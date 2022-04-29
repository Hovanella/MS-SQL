/*2. Разработать и создать представление с именем Количество кафедр. Представление должно быть построено на основе SELECT-запроса к таблицам FACULTY и PULPIT.
Представление должно содержать следую-щие столбцы: факультет (FACUL-TY.FACULTY_ NAME), количество кафедр (вычисляется на основе строк таблицы PULPIT). */

use UNIVER;
go

drop VIEW if exists "Количество кафедр";
go

Create VIEW "Количество кафедр" AS
select FACULTY.FACULTY,FACULTY_NAME,count(PULPIT) as "Количество кафедр"
from FACULTY right join PULPIT P on FACULTY.FACULTY = P.FACULTY
group by FACULTY_NAME, FACULTY.FACULTY
go

select * from "Количество кафедр"
go



