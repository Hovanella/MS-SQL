/*1. Разработать сценарий, формиру-ющий список дисциплин на кафедре ИСиТ. В отчет должны быть выведены краткие названия (поле SUBJECT) из таблицы SUBJECT в одну строку через запятую. 
Использовать встроенную функцию RTRIM.*/

use UNIVER;
go

declare IsitCursor cursor
    for select SUBJECT
        from SUBJECT
        where SUBJECT.PULPIT = 'ИСиТ'

declare @sub char(4),
    @str char(100) = ' ';

open IsitCursor;
fetch IsitCursor into @sub;
print 'Предметы на кафедре ИСиТ: ';
while @@FETCH_STATUS = 0
    begin
        set @str = rtrim(@sub) + ', ' + @str;
        fetch IsitCursor into @sub;
    end;
print @str;


close IsitCursor;
deallocate IsitCursor;
go