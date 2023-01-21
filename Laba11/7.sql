use UNIVER


-- A ---
set transaction isolation level Serializable 
begin transaction
select * from SUBJECT;
-------------------------- t1 ------------------
-------------------------- t2 -----------------
rollback;

--- B ---
begin transaction
insert SUBJECT values('ADSDtAD123' , '1DASADAAS' , 'ИСиТ');
commit ;