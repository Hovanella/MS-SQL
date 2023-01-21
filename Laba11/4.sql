------A------
--явную транзакцию с уровнем изолированности READ UNCOMMITED,
--кот. допуск неподтвержд, неповтор. и фантомное чтение
set transaction isolation level READ UNCOMMITTED
begin transaction
-----t1---------
select @@SPID, 'insert FACULTY' 'результат', *
from FACULTY ;
commit;
-----B–-------
--явную транзакцию с уровнем изолированности READ COMMITED (по умолч) 
-----t2---------
begin transaction
select @@SPID
insert FACULTY values('ИТasdt','Информационных технологий');

-----t1----------
-----t2----------
ROLLBACK;

SELECT * FROM FACULTY;
SELECT * FROM PULPIT;