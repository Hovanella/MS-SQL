/*1. Разработать хранимую процедуру без параметров с именем PSUBJECT. Процедура формирует результи-рующий набор на основе таблицы SUBJECT, анало-гичный набору, представленному на рисунке:


К точке вызова процедура должна возвращать ко-личество строк, выведенных в результирующий набор.
*/
use UNIVER;
go

drop procedure if exists PSUBJECT;
go

GO
CREATE PROCEDURE PSUBJECT
AS
BEGIN
	DECLARE @count INT = (SELECT COUNT(*) FROM SUBJECT)
	SELECT SUBJECT 'код', SUBJECT_NAME дисциплина, PULPIT кафедра FROM SUBJECT
	RETURN @count
END

GO
declare @res int = 0;
EXECUTE @res = PSUBJECT;
print 'result = ' + cast(@res as varchar(3))
