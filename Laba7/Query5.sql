/*5. Разработать представление с именем Дис-циплины. Представление должно быть по-строено на основе SELECT-запроса к таблице SUBJECT, отображать все дисциплины в ал-фавитном порядке и содержать следующие столбцы: код (SUBJECT), наименование дис-циплины (SUBJECT_NAME) и код кафедры (PULPIT). Использовать TOP и ORDER BY.*/

Use UNIVER;
go

drop view if exists "Дисциплины";
go

create view "Дисциплины" as
    select top 50 SUBJECT.SUBJECT, SUBJECT_NAME, PULPIT
    from SUBJECT
    order by SUBJECT_NAME
go

select * from "Дисциплины";
go