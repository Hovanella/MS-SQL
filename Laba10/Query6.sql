/*6. Разработать SELECT-запрос, с помощью которого из таблицы PROGRESS удаляются строки, содержащие информацию о студентах, получивших оценки ниже 4 (использовать объеди-нение таблиц PROGRESS, STUDENT, GROUPS).

Разработать SELECT-запрос, с по-мощью которого в таблице PROGRESS для студента с конкретным номером IDSTUDENT корректируется оценка (увеличивается на единицу).

*/

use UNIVER;



insert into PROGRESS (SUBJECT, IDSTUDENT, PDATE, NOTE) values
	('КГ',   1026,  '06.05.2013',3),
	('КГ',   1027,  '06.05.2013',2),
	('КГ',   1028,  '06.05.2013',2),
	('КГ',   1029,  '06.05.2013',3),
	('КГ',   1030,  '06.05.2013',1),
	('КГ',   1031,  '06.05.2013',3)

select * from PROGRESS


select NAME, NOTE
from PROGRESS
	inner join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
where NOTE < 4

declare EX6_1 cursor local
	for	select NAME, NOTE
	from PROGRESS
		inner join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where NOTE < 4
declare @student nvarchar(20), @mark int;
	open EX6_1;
		fetch  EX6_1 into @student, @mark;
		while @@FETCH_STATUS = 0
			begin
				delete PROGRESS where current of EX6_1;
				fetch  EX6_1 into @student, @mark;
			end
	close EX6_1;

select NAME, NOTE from PROGRESS inner join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT where NOTE<4
go



--1

declare EX6_2 cursor local for select NAME, NOTE from PROGRESS inner join STUDENT S on PROGRESS.IDSTUDENT = S.IDSTUDENT
where PROGRESS.IDSTUDENT=1023;

declare @student nvarchar(20), @mark int;
open EX6_2;
fetch EX6_2 into @student, @mark;
update PROGRESS set NOTE = NOTE + 1 where current of EX6_2;
close EX6_2;


select * from PROGRESS where IDSTUDENT=1023;
