
/*1. Разработать представление с именем Пре-подаватель. Представление должно быть по-строено на основе SELECT-запроса к таблице TEACHER и содержать следующие столбцы: код (TEACHER), имя преподавателя (TEACHER_NAME), пол (GENDER), код кафедры (PULPIT).*/

use UNIVER;


drop VIEW if exists dbo.Преподаватель;
go

create VIEW [Преподаватель] as
select TEACHER, TEACHER_NAME, GENDER, PULPIT
from TEACHER
go

alter VIEW [Преподаватель] as
    select TEACHER[учитель],
           TEACHER_NAME[Имя учителя],
           GENDER[Пол],
           PULPIT[Факультет]
    from UNIVER.dbo.TEACHER
go

select *
from [Преподаватель]
go


