create table #ex5 (t_ind int, t_identity int identity(1, 1), t_field varchar(100))

set nocount on
declare @i5 int = 0
while (@i5 < 10000)
begin
        insert into #ex5(t_ind, t_field) values (floor(30000*rand()), replicate('string', 10))
        if ((@i5 + 1) % 1000 = 0)
            print 'Strings added: ' + convert(varchar, @i5 + 1)
        set @i5 = @i5 + 1
end


use tempdb
create index #ex5_key on #ex5(t_ind)

insert top(10000) #ex5(t_ind, t_field) select t_ind, t_field from #ex5

alter index #ex5_key on #ex5 reorganize
alter index #ex5_key on #ex5 rebuild with (online = off)

select name [Index],
       avg_fragmentation_in_percent [fragmentation %]
from sys.dm_db_index_physical_stats (DB_ID('TEMPDB'),
    OBJECT_ID('#ex5_key'), null, null, null) ss
join sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id
where name is not null
