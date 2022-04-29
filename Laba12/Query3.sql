/*3. Создать временную локальную таблицу с именем #SUBJECT. Наименование и тип столбцов таблицы должны соответствовать столбцам результирующего набора процедуры PSUBJECT, разработанной в зада-нии 2.
Изменить процедуру PSUBJECT таким образом, чтобы она не содержала выходного параметра.
Применив конструкцию INSERT… EXECUTE с мо-дифицированной процедурой PSUBJECT, добавить строки в таблицу #SUBJECT.
*/
use UNIVER;
go

CREATE TABLE #SUBJECT (
	[SUBJECT] NVARCHAR(20) PRIMARY KEY,
	[SUBJECT_NAME] NVARCHAR(MAX),
	[PULPIT] NVARCHAR(MAX)
	)
go
ALTER PROCEDURE PSUBJECT @p NVARCHAR(20)
AS
BEGIN
	SELECT * FROM SUBJECT
	WHERE SUBJECT.PULPIT = @p
END
GO

INSERT #SUBJECT EXEC PSUBJECT @p = 'ИСиТ'
select * from #SUBJECT