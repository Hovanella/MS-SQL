/*2. Найти процедуру PSUBJECT с помощью обо-зревателя объектов (Object Explorer) SSMS и через контекстное меню создать сценарий на изменение про-цедуры оператором ALTER.
Изменить процедуру PSUBJECT, созданную в за-дании 1, таким образом, чтобы она принимала два па-раметра с именами @p и @c. Параметр @p является входным, имеет тип VARCHAR(20) и значение по умолчанию NULL. Параметр @с является выходным, имеет тип INT.
Процедура PSUBJECT должна формировать ре-зультирующий набор, аналогичный набору, представ-ленному на рисунке выше, но при этом содержать строки, соответствующие коду кафедры, заданному параметром @p. Кроме того, процедура должна фор-мировать значение выходного параметра @с, равное количеству строк в результирующем наборе, а также возвращать значение к точке вызова, равное общему количеству дисциплин (количеству строк в таблице SUBJECT). */


use UNIVER;
go;



ALTER PROCEDURE PSUBJECT @p NVARCHAR(20) = NULL, @c INT OUTPUT
AS
BEGIN
	DECLARE @count INT = (SELECT COUNT(*) FROM SUBJECT)
	PRINT 'Parameters: @p = ' + @p + ', @c = ' + CAST(@c AS VARCHAR(3))
	SELECT * FROM SUBJECT
	WHERE SUBJECT.PULPIT = @p
	SET @c = @@ROWCOUNT
	RETURN @count
END
GO

declare @c int;
exec PSUBJECT 'ЛУ', @c output
print 'result = ' + cast(@c as varchar(3));