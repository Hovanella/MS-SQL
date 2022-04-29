/*9. Разработать сценарий с ошибками, в котором используются для обработки ошибок блоки TRY и CATCH. Приме-нить функции ERROR_NUMBER (код последней ошибки), ERROR_ES-SAGE (сообщение об ошибке), ERROR_LINE (код последней ошибки), ER-ROR_PROCEDURE (имя процедуры или NULL), ERROR_SEVERITY (уровень серьезности ошибки), ERROR_ STATE (метка ошибки). Проанализировать ре-зультат.
*/

use UNIVER;

begin TRY
	declare @Value int = 3
	UPDATE PROGRESS SET PROGRESS.NOTE='asd'
end TRY
begin CATCH
	print ERROR_NUMBER()
	print ERROR_MESSAGE()
	print ERROR_LINE()
	print ERROR_PROCEDURE()
	print ERROR_SEVERITY()
	print ERROR_STATE()
end CATCH
