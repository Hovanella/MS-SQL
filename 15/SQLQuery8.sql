go
create function FFACPUL(@f varchar(20), @p varchar(20)) returns table
as return
select FACULTY.FACULTY, PULPIT.PULPIT from FACULTY left outer join PULPIT
  on FACULTY.FACULTY = PULPIT.FACULTY
   where FACULTY.FACULTY = ISNULL(@f, FACULTY.FACULTY) and --первое значение, не равное null
    PULPIT.PULPIT = ISNULL(@p, PULPIT.PULPIT);

go
create procedure TASK
	as begin
		begin try         
			begin tran
				select * from dbo.FFACPUL(null, null);
				select * from dbo.FFACPUL('ИДиП', null);
				select * from dbo.FFACPUL(null, 'ИСиТ');
				select * from dbo.FFACPUL('ИДиП', 'ИСиТ');
			commit tran;
		end try
		begin catch
			print 'Номер ошибки: ' + cast(error_number() as varchar(6));
			print 'Сообщение: ' + error_message();
			print 'Уровень: ' + cast(error_severity() as varchar(6));
			print 'Метка: ' + cast(error_state() as varchar(8));
			print 'Номер строки: ' + cast(error_line() as varchar(8));
			if error_procedure() is not  null   
				print 'Имя процедуры: ' + error_procedure(); 
			if @@trancount > 0 rollback tran ; 
			return -1;
		end catch;
	end;

declare @k3 int;  
exec @k3 = TASK; 
print 'Код ошибки: ' + cast(@k3 as varchar(3));