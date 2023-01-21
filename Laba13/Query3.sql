/*3. Разработать табличную функцию FFACPUL, результа-ты работы которой продемонстрированы на рисунке ниже.
Функция принимает два параметра, задающих код фа-культета (столбец FACULTY.FACULTY) и код кафедры (столбец PULPIT.PULPIT). Использует SELECT-запрос c левым внешним соединением между таблицами FACULTY и PULPIT. 
Если оба параметра функции равны NULL, то она воз-вращает список всех кафедр на всех факультетах. 
Если задан первый параметр (второй равен NULL), функ-ция возвращает список всех кафедр заданного факультета. 
Если задан второй параметр (первый равен NULL), функ-ция возвращает результирующий набор, содержащий стро-ку, соответствующую заданной кафедре.*/
use UNIVER
go

drop function if exists  FFACPUL
go

create function FFACPUL(@fac varchar(10), @pul varchar(10)) returns table
    as return
    select FACULTY.FACULTY, PULPIT.PULPIT
    from FACULTY left outer join PULPIT
    on FACULTY.FACULTY = PULPIT.FACULTY
where FACULTY.FACULTY=isnull(@fac, FACULTY.FACULTY) and PULPIT.PULPIT=isnull(@pul, PULPIT.PULPIT);
go


select * from dbo.FFACPUL(null,null);
select * from dbo.FFACPUL('ИДиП',null);
select * from dbo.FFACPUL(null,'ИСиТ');
select * from dbo.FFACPUL('ТТЛП','ЛМиЛЗ');
select * from dbo.FFACPUL('no','no');
go
	