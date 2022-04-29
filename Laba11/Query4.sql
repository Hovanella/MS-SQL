/*4. Разработать два сценария A и B на примере базы данных X_UNIVER.
Сценарий A представляет со-бой явную транзакцию с уров-нем изолированности READ UNCOMMITED, сценарий B – явную транзакцию с уровнем изолированности READ COM-MITED (по умолчанию).

Сценарий A должен демон-стрировать, что уровень READ UNCOMMITED допускает не-подтвержденное, неповторяю-щееся и фантомное чтение.
*/

use UNIVER;
go
-- Сценарий A--
set transaction isolation level READ UNCOMMITTED
--t1
begin transaction

select @@SPID,'результат', * from SUBJECT;
commit;
--t2
--B--
begin transaction
select @@SPID
insert SUBJECT values ('12', 'Математика','БФ');
--t1--
--t2--
rollback;
