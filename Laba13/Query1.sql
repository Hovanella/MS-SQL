/*1. Разработать скалярную функцию с именем COUNT_STUDENTS, которая вычисляет количество сту-дентов на факультете, код которого задается параметром типа VARCHAR(20) с именем @faculty. Использовать внутреннее соединение таблиц FACULTY, GROUPS, STU-DENT. Опробовать работу функции.
Внести изменения в текст функции с помощью оператора ALTER с тем, чтобы функция принимала второй параметр @prof типа VARCHAR(20), обозначающий специальность студентов. Для параметров определить значения по умолча-нию NULL. Опробовать работу функции с помощью SE-LECT-запросов.

  Внести изменения в текст функции с помощью оператора ALTER с тем, чтобы функция принимала второй параметр @prof типа VARCHAR(20), обозначающий специальность студентов. Для параметров определить значения по умолча-нию NULL. Опробовать работу функции с помощью SE-LECT-запросов.
*/
use UNIVER;
go

drop function if exists COUNT_STUDENTS;
go

create function COUNT_STUDENTS (@faculty nvarchar(20)) returns int as
begin
    declare @count int=0;
    set @count=(select count(STUDENT.IDSTUDENT)
    from FACULTY
	inner join GROUPS on GROUPS.FACULTY = FACULTY.FACULTY
	inner join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
	where FACULTY.FACULTY = @faculty)
    return @count;
end;
go


declare @temp_1 int = dbo.COUNT_STUDENTS('ИДиП');
print 'Количество студентов на факультете ' +cast(@temp_1 as nvarchar(20))+ ' человек.';

select FACULTY 'Факультет',
	dbo.COUNT_STUDENTS(FACULTY) 'Кол-во студентов'
from FACULTY
go


alter function COUNT_STUDENTS (@faculty nvarchar(20), @prof nvarchar(20)) returns int as
begin
    declare @count int=0;
    set @count=(select count(STUDENT.IDSTUDENT)
    from FACULTY
    inner join GROUPS on GROUPS.FACULTY = FACULTY.FACULTY
    inner join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
    where FACULTY.FACULTY = @faculty and GROUPS.PROFESSION = @prof)
    return @count;
end;
go

declare @temp_1 int = dbo.COUNT_STUDENTS('ИДиП', '1-40 01 02');
print 'Количество студентов: ' + convert(varchar, @temp_1);

select FACULTY.FACULTY 'Факультет',
	GROUPS.PROFESSION 'Специальность',
	dbo.COUNT_STUDENTS(FACULTY.FACULTY, GROUPS.PROFESSION) 'Кол-во студентов'
from FACULTY
	inner join GROUPS on GROUPS.FACULTY = FACULTY.FACULTY
group by FACULTY.FACULTY, GROUPS.PROFESSION
go