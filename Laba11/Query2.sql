use UNIVER;
go

BEGIN TRY
	BEGIN TRANSACTION
	INSERT into PROGRESS (NOTE) values ('asd');
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	PRINT ERROR_MESSAGE();
    if @@trancount > 0
        rollback transaction;
END CATCH