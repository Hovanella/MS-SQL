--3-- ОПЕРАТОР SAVE TRAN
-- если транзакция сост из неск независ блоков операторов T-SQL, то исп.
-- SAVE TRANSACTION, формир контр.точку транзакции
declare @point varchar(3)
begin try
begin tran
insert into AUDITORIUM values('test123', 'ЛБ-К', 40, 'test1')
set @point = 'p1'; save tran @point
insert into AUDITORIUM values('test1132', 'ЛБ-К', 40, 'test1')
set @point = 'p2'; save tran @point
insert into AUDITORIUM values('test1', 'ЛК', 50, 'test2')
set @point = 'p3'; save tran @point
commit tran
end try
begin catch
print 'Ошибка! ' + error_message()
if @@TRANCOUNT > 0
begin
print 'Контрольная точка: ' + cast(@point as varchar)
rollback tran @point
commit tran
end
end catch

select * from AUDITORIUM;