/*5. Разработать процедуру с именем SUB-JECT_REPORT, формирующую в стандартный вы-ходной поток отчет со списком дисциплин на кон-кретной кафедре. В отчет должны быть выведены краткие названия (поле SUBJECT) из таблицы SUBJECT в одну строку через запятую (использовать встроенную функцию RTRIM).
  Процедура имеет входной параметр с именем @p типа CHAR(10), кото-рый предназначен для указания кода кафедры.
В том случае, если по заданному значению @p не-возможно определить код кафедры, процедура должна генерировать ошибку с сообщением ошибка в пара-метрах.

Процедура SUBJECT_REPORT должна возвра-щать к точке вызова количество дисциплин, отобра-женных в отчете.
*/
Use UNIVER
go

drop procedure if exists SUBJECT_REPORT
go

CREATE PROCEDURE SUBJECT_REPORT @p NVARCHAR(MAX)
AS
DECLARE @rc INT = 0
BEGIN TRY
	DECLARE @sb NVARCHAR(20), @result NVARCHAR(MAX) = ''

	DECLARE SUBJECTS CURSOR FOR SELECT SUBJECT.SUBJECT FROM SUBJECT WHERE SUBJECT.PULPIT = rtrim(@p)
	IF NOT EXISTS (SELECT SUBJECT.SUBJECT FROM SUBJECT WHERE SUBJECT.PULPIT = rtrim(@p))
		RAISERROR('ERROR', 11, 1)
	ELSE
		OPEN SUBJECTS
		FETCH SUBJECTS INTO @sb
		PRINT 'SUBJECTS:'
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @result = rtrim(@sb) + ', ' + rtrim(@result)
			SET @rc = @rc + 1
			FETCH SUBJECTS INTO @sb
		END
		PRINT @result
		CLOSE SUBJECTS
	    DEALLOCATE SUBJECTS
		RETURN @rc
END TRY
BEGIN CATCH
	PRINT 'ошибка в параметрах';
	IF ERROR_PROCEDURE() IS NOT NULL
		PRINT 'имя процедуры : ' + ERROR_PROCEDURE()
	RETURN @rc
END CATCH
GO

declare @res int;
exec @res = SUBJECT_REPORT 'ИСиТ'
print 'количество дисциплин = ' + cast(@res as varchar(3));





