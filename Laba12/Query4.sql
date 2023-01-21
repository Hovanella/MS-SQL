/*4. Разработать процедуру с именем PAUDITORIUM_INSERT. Процедура принимает четыре входных параметра: @a, @n, @c и @t. Параметр @a имеет тип CHAR(20), параметр @n имеет тип VARCHAR(50), параметр @c имеет тип INT и значение по умолчанию 0, параметр @t имеет тип CHAR(10).
Процедура добавляет строку в таблицу AUDITO-RIUM. Значения столбцов AUDITORIUM, AUDI-TORIUM_NAME, AUDITORIUM_CAPACITY и AUDITORIUM_TYPE добавляемой строки задаются соответственно параметрами @a, @n, @c и @t.
Процедура PAUDITORIUM_INSERT должна при-менять механизм TRY/CATCH для обработки ошибок. В случае возникновения ошибки, процедура должна формировать сообщение, содержащее код ошибки, уровень серьезности и текст сообщения в стандартный выходной поток.
Процедура должна возвращать к точке вызова зна-чение -1 в том случае, если произошла ошибка и 1, ес-ли выполнение успешно.
Опробовать работу процедуры с различными значе-ниями исходных данных, которые вставляются в таб-лицу.
*/
use UNIVER
go

drop Procedure if exists PAUDITORIUM_INSERT;
go

CREATE PROCEDURE PAUDITORIUM_INSERT @a NVARCHAR(20), @n NVARCHAR(50), @c INT = 0, @t NVARCHAR (10)
AS
BEGIN TRY
	INSERT INTO AUDITORIUM VALUES (@a, @n, @c, @t);
	RETURN 1;
END TRY
BEGIN CATCH
	PRINT error_message();
	PRINT error_procedure();
	PRINT error_state();
    RETURN -1;
END CATCH
GO

declare @result int;
exec @result = PAUDITORIUM_INSERT '7716-2', 'ЛК', 200, '776-2';
select @result;
