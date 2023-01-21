/*2. Разработать скалярную функцию с именем FSUB-JECTS, принимающую параметр @p типа VARCHAR(20), значение которого задает код кафедры (столбец SUB-JECT.PULPIT).
Функция должна возвращать строку типа VARCHAR(300) с перечнем дисциплин в отчете.
Создать и выполнить сценарий, который создает отчет, аналогичный представленному ниже.
Примечание: использовать локальный статический курсор на основе SELECT-запроса к таблице SUBJECT.
*/

use UNIVER;
go

drop function if exists  FSUBJECTS;
go

create function FSUBJECTS(@p varchar(20)) returns varchar(300)
as begin
declare @sb varchar(10), @s varchar(100) = '';
declare sbj cursor local for
            select distinct SUBJECT from SUBJECT where PULPIT like @p;
open sbj;
    fetch sbj into @sb;
    while @@FETCH_STATUS = 0
    begin
        set @s = @s + RTRIM(@sb) + ', ';
        fetch sbj into @sb;
    end;
close sbj;
return @s
end;
go

select distinct PULPIT, dbo.FSUBJECTS(PULPIT)[Дисциплины] from SUBJECT;