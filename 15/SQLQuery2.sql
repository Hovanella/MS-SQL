--1 Скалярная функция подсчета количества студентов по заданному факультету
go
create function COUNT_STUDENTS(@faculty nvarchar(20)) returns int
as begin
declare @rc int = 0;
set @rc = (
SELECT count(IDSTUDENT) from STUDENT join GROUPS
    on STUDENT.IDGROUP = GROUPS.IDGROUP
	join FACULTY
	    on GROUPS.FACULTY = FACULTY.FACULTY
		    where FACULTY.FACULTY = @faculty);
return @rc;
end;

go
declare @n int = dbo.COUNT_STUDENTS('ИДиП');
print 'Количество студентов: ' + cast(@n as varchar(4));

--по заданному факультету и коду специальности
go
alter function COUNT_STUDENTS(@faculty varchar(20) = null, @prof varchar(20) = '1-40 01 02') returns int
as begin
declare @rc int = 0;
set @rc = (
SELECT count(IDSTUDENT) from FACULTY inner join GROUPS
	on FACULTY.FACULTY = GROUPS.FACULTY
	inner join STUDENT
		on GROUPS.IDGROUP = STUDENT.IDGROUP
			where FACULTY.FACULTY = @faculty and GROUPS.PROFESSION = @prof);
return @rc;
end;


go
declare @n int = dbo.COUNT_STUDENTS('ИДиП', '1-40 01 02');
print 'Количество студентов: ' + cast(@n as varchar(4));

--2 вывод дисциплин на кафедрах
go
create function FSUBJECTS(@p varchar(20)) returns varchar(300)
as begin
declare @sb varchar(10), @s varchar(100) = '';
declare sbj cursor local static
    for select distinct SUBJECT from SUBJECT 
	    where PULPIT like @p;
open sbj;
fetch sbj into @sb;
while @@FETCH_STATUS = 0
begin
set @s = @s + RTRIM(@sb) + ', ';
fetch sbj into @sb;
end;
return @s
end;

go 
select distinct PULPIT, dbo.FSUBJECTS(PULPIT)[Дисциплины] from SUBJECT;

--3 
go
create function FFACPUL(@f varchar(20), @p varchar(20)) returns table
as return
select FACULTY.FACULTY, PULPIT.PULPIT from FACULTY left outer join PULPIT
  on FACULTY.FACULTY = PULPIT.FACULTY
   where FACULTY.FACULTY = ISNULL(@f, FACULTY.FACULTY) and --первое значение, не равное null
    PULPIT.PULPIT = ISNULL(@p, PULPIT.PULPIT);

go
select * from dbo.FFACPUL(null, null); -- выведет все
select * from dbo.FFACPUL('ИДиП', null); -- должно вывести кафедру
select * from dbo.FFACPUL(null, 'ИСиТ'); -- выведет факультет
select * from dbo.FFACPUL('ИДиП', 'ИСиТ'); 

--4
go
create function FCTEACHER(@p varchar(20)) returns int
as begin
declare @rc int = (select count(TEACHER) from TEACHER where PULPIT = ISNULL(@p, PULPIT));
return @rc;
end;

go 
select PULPIT, dbo.FCTEACHER(PULPIT)[Количество преподавателей] from TEACHER; -- кол-во по кафедрам
select dbo.FCTEACHER(null)[Общее количество преподавателей]; -- общее кол-во


--5
go
create function COUNT_PULPIT(@f varchar(20)) returns int -- подсчет кафедр
as begin
declare @rc int = 0;
set @rc = (select count(PULPIT) from PULPIT where FACULTY = @f);
return @rc;
end;


-- DROP FUNCTION COUNT_PULPIT


go
create function COUNT_GROUP(@f varchar(20)) returns int --подсчет групп
as begin
declare @rc int = 0;
set @rc = (select count(IDGROUP) from GROUPS where FACULTY like @f);
return @rc;
end;


-- DROP FUNCTION COUNT_GROUP


go
create function COUNT_PROFESSION(@f varchar(20)) returns int -- специальности 
as begin
declare @rc int = 0;
set @rc = (select count(PROFESSION) from PROFESSION where FACULTY like @f);
return @rc;
end;


-- DROP FUNCTION COUNT_PROFESSION


--6 чтобы количество кафедр, количество групп, количество студентов и количество специальностей вычислялось отдельными скалярными функциями

go
create function FACULTY_REPORT(@c int) 
returns @fr table([Факультет] varchar(50), [Количество кафедр] int, [Количество групп]  int, [Количество студентов] int, [Количество специальностей] int)
as begin
declare cc cursor static for select FACULTY from FACULTY where dbo.COUNT_STUDENTS(FACULTY,default)> @c; 
declare @f varchar(30);
open cc;  
fetch cc into @f;
while @@fetch_status = 0
begin
insert @fr values(@f, dbo.COUNT_PULPIT(@f), dbo.COUNT_GROUP(@f), dbo.COUNT_STUDENTS(@f,default), dbo.COUNT_PROFESSION(@f)); 
fetch cc into @f;  
end;   
return; 
end;


 --DROP FUNCTION FACULTY_REPORT


go
select * from dbo.FACULTY_REPORT(0);