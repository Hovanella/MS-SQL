/*6. Изменить представление Количе-ство_кафедр, созданное в задании 2 так, чтобы оно было привязано к базовым таблицам. Про-демонстрировать свойство привязанности представления к базовым таблицам. Примеча-ние: использовать опцию SCHEMABINDING. */

use UNIVER;
go

Alter VIEW "Количество кафедр" with SCHEMABINDING AS
select FACULTY.FACULTY,FACULTY_NAME,count(PULPIT) as "Количество кафедр"
from dbo.FACULTY right join dbo.PULPIT P on FACULTY.FACULTY = P.FACULTY
group by FACULTY_NAME, FACULTY.FACULTY
go

alter table FACULTY ALTER COLUMN FACULTY_NAME nvarchar(50);
