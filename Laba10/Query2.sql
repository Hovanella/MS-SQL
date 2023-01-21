/*Разработать сценарий, демонстриру-ющий отличие глобального курсора от локального на примере базы данных X_UNIVER.*/
use UNIVER;
go

DECLARE Teacher_cursor CURSOR LOCAL for select TEACHER.TEACHER_NAME from TEACHER where TEACHER.PULPIT = 'ИСиТ';
DECLARE @teacher char(50), @teacher_ot char(100) ='';
OPEN Teacher_cursor;
print 'Преподаватели ИСиТ';
FETCH  Teacher_cursor into @teacher;
	set @teacher_ot ='1. ' + RTRIM(@teacher);
	print @teacher_ot;
CLOSE Teacher_cursor;
go

OPEN Teacher_cursor;
CLOSE Teacher_cursor
go	

DECLARE Teacher_cursor_2 CURSOR GLOBAL for select TEACHER.TEACHER_NAME from TEACHER where TEACHER.PULPIT = 'ИСиТ';
DECLARE @teacher char(50), @teacher_ot char(100) ='';
OPEN Teacher_cursor_2;
print 'Преподаватели ИСиТ';
FETCH  Teacher_cursor_2 into @teacher;
	set @teacher_ot ='1. ' + RTRIM(@teacher);
	print @teacher_ot;
CLOSE Teacher_cursor_2;
go


OPEN Teacher_cursor_2;
CLOSE Teacher_cursor_2;
deallocate Teacher_cursor_2
go