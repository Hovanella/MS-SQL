/* 1. Разработать сценарий, де-монстрирующий работу в ре-жиме неявной транзакции.
Проанализировать пример, приведенный справа, в котором создается таблица Х, и создать сценарий для другой таблицы.*/

drop table if exists #TEMPDB1;

DECLARE @x BIT = 1
SET IMPLICIT_TRANSACTIONS ON

CREATE TABLE #TEMPDB1(A INT)
INSERT INTO #TEMPDB1(A) VALUES(1)
IF @x = 1 COMMIT
ELSE ROLLBACK

if exists (select * from #TEMPDB1)
print 'ok'
else
print 'no'
