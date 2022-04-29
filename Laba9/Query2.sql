/*2. Создать временную локальную таблицу. Заполнить ее данными (10000 строк или больше).
Разработать SELECT-запрос. По-лучить план запроса и определить его стоимость.
Создать некластеризованный не-уникальный составной индекс.
Оценить процедуры поиска ин-формации.
*/

--ПРОВЕРИТЬ ИНДЕКСЫ В SSMS

create table #temp_table_1
(
    some_ind   int,
    some_field varchar(20),
    cc         int identity (1,1)
)
SET nocount on;
DECLARE @j int = 0;
while @j < 10000
    begin
        insert #temp_table_1(some_ind, some_field)
        values (FLOOR(RAND() * 10000), 'str' + cast(@j as nvarchar(1000)));
        SET @j = @j + 1;
    end

select *
from #temp_table_1
where cc > 500
  and some_ind between 1500 and 5000


SELECT *
from #temp_table_1
where some_field = 'str34'
  and cc > 3
CREATE index #temp_table_1_nonclu on #temp_table_1 (some_ind, cc)
drop table #temp_table_1