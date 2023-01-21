/*4. На рисунке ниже показан сценарий, демонстрирующий работу скалярной функции FCTEACHER. Функция прини-мает один параметр, задающий код кафедры. Функция воз-вращает количество преподавателей на заданной парамет-ром кафедре. Если параметр равен NULL, то возвращается общее количество преподавателей. */

use UNIVER
go

drop function if exists FCTEACHER;
go

create function FCTEACHER(@pul nvarchar(10)) returns int as
    begin
        declare @count int=(select count(*) from TEACHER
        where PULPIT=isnull(@pul, PULPIT));
        return @count;
    end;
go


select PULPIT, dbo.FCTEACHER(PULPIT) [Количество преподавателей] from PULPIT;

select dbo.FCTEACHER('ИСиТ') [Преподавателей на исите],dbo.FCTEACHER(null) [Всего преподавателей];
