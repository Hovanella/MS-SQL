use UNIVER;
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

select * from #temp_table_2 where cc >500 and some_ind between 1500 and 5000
CREATE index #temp_table_2_nonclu_2 on #temp_table_2(some_ind) INCLUDE(cc)
select CC from #temp_table_2 where some_ind > 500
drop table #temp_table_2