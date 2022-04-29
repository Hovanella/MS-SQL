use UNIVER;
go

drop table if exists #temp_table_2 ;
go

create table #temp_table_2
(
	some_ind int,
	some_field varchar(20),
	cc int identity(1,1)
)
SET nocount on;
DECLARE @k int = 0;
while @k < 30000
begin
	insert #temp_table_2(some_ind, some_field)
		values(FLOOR(RAND()*30000), REPLICATE('test2',3) );
	SET @k = @k + 1;
end




use tempdb
 CREATE index #temp_table_2_ind  on #temp_table_2(some_ind);


INSERT TOP(10000) #temp_table_2(some_ind, some_field) SELECT some_ind, some_field FROM #temp_table_2

ALTER INDEX #temp_table_2_ind ON #temp_table_2 REORGANIZE

ALTER INDEX #temp_table_2_ind  ON #temp_table_2 REBUILD WITH(online = OFF)

SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
        FROM sys.dm_db_index_physical_stats(DB_ID('tempdb'),
        OBJECT_ID('#TEMP2'), NULL, NULL, NULL) ss
        JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id
        WHERE name is not null;


