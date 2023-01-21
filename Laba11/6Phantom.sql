use UNIVER
--task6 (фантомное чтение)

-- A ---
set transaction isolation level REPEATABLE READ
begin transaction
select * from SUBJECT;
-------------------------- t1 ------------------
-------------------------- t2 -----------------
rollback;

--- B ---
begin transaction
insert SUBJECT values('ADSDSAD' , 'SDASADAAS' , 'ИСиТ');
commit ;