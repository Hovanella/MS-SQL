/*6. Разработать SELECT-запрос, с помощью которого из таблицы PROGRESS удаляются строки, содержащие информацию о студентах, получивших оценки ниже 4 (использовать объеди-нение таблиц PROGRESS, STUDENT, GROUPS).

Разработать SELECT-запрос, с по-мощью которого в таблице PROGRESS для студента с конкретным номером IDSTUDENT корректируется оценка (увеличивается на единицу).

*/

use UNIVER;


-- ВООБЩЕ НЕ РАБОТАЕТ
select *
from PROGRESS;

DECLARE @id varchar(10), @name varchar(100), @subj varchar(50), @note varchar(2);
DECLARE PROGRESS_DELETE_CURSOR CURSOR LOCAL DYNAMIC
    for SELECT STUDENT.IDSTUDENT, STUDENT.NAME, PROGRESS.SUBJECT, PROGRESS.NOTE
        from PROGRESS
                 inner join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT FOR UPDATE;
OPEN PROGRESS_DELETE_CURSOR
fetch PROGRESS_DELETE_CURSOR into @id,@name,@subj,@note;
if (@note < 5)
    begin
        DELETE PROGRESS where CURRENT OF PROGRESS_DELETE_CURSOR;
    end;

select *
from PROGRESS;


--1


declare @id int = 0, @specId int = 1003;

select *
from PROGRESS
where IDSTUDENT = @specId;

declare CURS cursor local
    for select *
        from PROGRESS for update
OPEN CURS
while @@fetch_status = 0
    begin
        fetch CURS into @id
        if @id = @specId
            update PROGRESS
            set PROGRESS.NOTE = PROGRESS.NOTE + 1
            where current of CURS
    end
close CURS

select *
from PROGRESS
where IDSTUDENT = @specId;
