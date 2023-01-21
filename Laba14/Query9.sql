use UNIVER;
go
drop trigger if exists  DDL_UNIVER on database;
go

	create  trigger DDL_UNIVER on database
                    for DDL_DATABASE_LEVEL_EVENTS
	    as
        raiserror('Операции с БД запрещены ))) ', 10, 1);
	    rollback;
	return;
	go

	

	drop table  TR_AUDIT;


	 drop trigger if exists  DDL_UNIVER on database;