/*3. Разработать сценарий, де-монстрирующий применение оператора SAVE TRAN на при-мере базы данных X_UNIVER.
В блоке CATCH предусмот-реть выдачу соответствующих сообщений об ошибках.
Опробовать работу сценария при использовании различных контрольных точек и различных операторов модификации таб-лиц.
*/

--НЕ РАБОТАЕТ

use UNIVER;
go

   DECLARE @point NVARCHAR(10);

BEGIN TRY
	BEGIN TRAN
    SET @point = 'P1'; SAVE TRAN @point;
    INSERT PROGRESS (NOTE) VALUES ('qwe');
	SET @point = 'P2'; SAVE TRAN @point;
	COMMIT TRAN
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE() + @point
	ROLLBACK TRAN @point
    COMMIT TRAN
END CATCH