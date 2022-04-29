
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

SELECT some_ind from  #temp_table_2 where some_ind between 5000 and 19999;
SELECT some_ind from  #temp_table_2 where some_ind>15000 and  some_ind < 20000
SELECT some_ind from  #temp_table_2 where some_ind=16000

 CREATE  index #temp_table_WHERE on #temp_table_2(some_ind) where (some_ind>15000 and
 some_ind  < 20000);
 drop index #temp_table_WHERE on #temp_table_2