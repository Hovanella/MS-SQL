/*1. С помощью SSMS определить все индексы, которые имеются в БД UNIVER. Определить, какие из них являются кластеризованными, а ка-кие некластеризованными.
Создать временную локальную таблицу. Заполнить ее данными (не менее 1000 строк).
Разработать SELECT-запрос. По-лучить план запроса и определить его стоимость.
Создать кластеризованный индекс, уменьшающий стоимость SELECT-запроса.
*/

USE UNIVER
go

--ПРОВЕРИТЬ ИНДЕКСЫ В SSMS

exec sp_helpindex 'AUDITORIUM'
exec sp_helpindex 'AUDITORIUM_TYPE'
exec sp_helpindex 'FACULTY'
exec sp_helpindex 'GROUPS'
exec sp_helpindex 'PROFESSION'
exec sp_helpindex 'PROGRESS'
exec sp_helpindex 'PULPIT'
exec sp_helpindex 'STUDENT'
exec sp_helpindex 'SUBJECT'
exec sp_helpindex 'TEACHER'
exec sp_helpindex 'TIMETABLE'


drop table if exists #temp_table
go

create table #temp_table
(	some_ind int,
	some_field varchar(20)
)
SET nocount on;
DECLARE @i int = 0;
while @i < 2000
	begin
		insert #temp_table(some_ind, some_field)
			values(@i, REPLICATE('test ',3));
		SET @i = @i + 1;
	end

select * from #temp_table where some_ind between 1500 and 2000 order by some_ind




select * from #temp_table where some_ind between 1500 and 2000 order by some_ind
	checkpoint;
CREATE  clustered index  #temp_table_cl on #temp_table(some_ind asc)


