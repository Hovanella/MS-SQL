use UNIVER
--task6 (��������� ������)

-- A ---
set transaction isolation level REPEATABLE READ
begin transaction
select * from SUBJECT;
-------------------------- t1 ------------------
-------------------------- t2 -----------------
rollback;

--- B ---
begin transaction
insert SUBJECT values('ADSDSAD' , 'SDASADAAS' , '����');
commit ;