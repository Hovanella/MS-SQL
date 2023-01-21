--1 хранимая процедура без параметров
CREATE procedure PSUBJECT
as begin
DECLARE @n int = (SELECT count(*) from SUBJECT);
SELECT SUBJECT [КОД], SUBJECT_NAME [ДИСЦИПЛИНА], PULPIT [КАФЕДРА] from SUBJECT;
return @n;
end;

DECLARE @k int;
EXEC @k = PSUBJECT; -- вызов процедуры 
print 'Количество предметов: ' + cast(@k as varchar(3));
go

--2 изменение процедуры(добавление параметров)
ALTER procedure PSUBJECT @p varchar(20), @c nvarchar(2) output
as begin
SELECT * from SUBJECT where SUBJECT = @p;
set @c = cast(@@rowcount as nvarchar(2));
end;

DECLARE @k1 int, @k2 nvarchar(2);
EXEC @k1 = PSUBJECT @p = 'СУБД', @c = @k2 output;
print 'Количество предметов: ' + @k2;
go

--3 создать локальную табл, убрать выходной параметр процедуры
ALTER procedure PSUBJECT @p varchar(20)
as begin
SELECT * from SUBJECT where SUBJECT = @p;
end;


CREATE table #SUBJECTs
(
	Код_предмета varchar(20),
	Название_предмета varchar(100),
	Кафедра varchar(20)
);
INSERT #SUBJECTs EXEC PSUBJECT @p = 'ПСП';
INSERT #SUBJECTs EXEC PSUBJECT @p = 'СУБД';
SELECT * from #SUBJECTs;
go

drop table #SUBJECTs
go


--4 процедура с использованием TRY/CATCH
CREATE procedure PAUDITORIUM_INSERT @a char(20), @n varchar(50), @c int = 0, @t char(10)
as begin 
begin try
INSERT into AUDITORIUM(AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME)
	values(@a, @n, @c, @t);
	--values(433-1, 'ЛК', 433-1, 100);
return 1;
end try
begin catch
print 'Номер ошибки: ' + cast(error_number() as varchar(6));
print 'Сообщение: ' + error_message();
print 'Уровень: ' + cast(error_severity() as varchar(6));
print 'Метка: ' + cast(error_state() as varchar(8));
print 'Номер строки: ' + cast(error_line() as varchar(8));
if error_procedure() is not null   
print 'Имя процедуры: ' + error_procedure();
return -1;
end catch;
end;


DECLARE @rc int;  
EXEC @rc = PAUDITORIUM_INSERT @a = '420-3', @n = 'ЛК', @c = 100, @t = '420-3'; 
print 'Код ошибки: ' + cast(@rc as varchar(3));
go

delete AUDITORIUM where AUDITORIUM='420-3';

--5 отчет со списком дисциплин на конкретной кафедре (процедура должна генерировать ошибку с сообщением ошибка в параметрах)
go
CREATE procedure SUBJECT_REPORT @p char(10) 
as begin
DECLARE @rc int;
begin try
DECLARE @sb char(10), @r varchar(100) = '';
DECLARE sbj CURSOR for 
	SELECT SUBJECT from SUBJECT where PULPIT = @p;
if not exists(SELECT SUBJECT from SUBJECT where PULPIT = @p)
	raiserror('Ошибка', 11, 1);
else 
OPEN sbj;
fetch sbj into @sb;
print 'Предметы: ';
while @@fetch_status = 0
begin
set @r = rtrim(@sb) + ', ' + @r;  
set @rc = @rc + 1;
fetch sbj into @sb;
end
print @r;
CLOSE sbj;
return @rc;
end try
begin catch
print 'Ошибка в параметрах' 
if error_procedure() is not null   
print 'Имя процедуры: ' + error_procedure();
return @rc;
end catch;
end;

DECLARE @k2 int;  
EXEC @k2 = SUBJECT_REPORT @p ='ИСиТ';  
print 'Количество предметов: ' + cast(@k2 as varchar(3));
go

--6 PAUDITORIUM_INSERTX должна возвращать к точке вызова значение -1 в том случае, если произошла ошибка и 1, если выполнения процедуры завершилось успешно.
CREATE procedure PAUDITORIUM_INSERTX @a char(20), @n varchar(50), @c int = 0, @t char(10), @tn varchar(50)
as begin
DECLARE @rc int = 1;
begin try
set transaction isolation level serializable;          
begin tran
INSERT into AUDITORIUM_TYPE(AUDITORIUM_TYPE, AUDITORIUM_TYPENAME)
	values(@n, @tn);
EXEC @rc = PAUDITORIUM_INSERT @a, @n, @c, @t;
commit tran;
return @rc;
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


DECLARE @k3 int;  
EXEC @k3 = PAUDITORIUM_INSERTX '622-3', @n = 'КК', @c = 85, @t = '622-3', @tn = 'Комп. класс'; 
print 'Код ошибки: ' + cast(@k3 as varchar(3));

delete AUDITORIUM where AUDITORIUM='622-3';  
go