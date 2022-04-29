/*
3. Разработать сценарий, демонстри-рующий отличие статических курсоров от динамических на примере базы дан-ных X_UNIVER.
*/
use UNIVER;
go

create table #TEMP ( VARIABLE nvarchar(20))
insert #TEMP values('DEFAULT')
declare @str nvarchar(20) = ''

declare SC  cursor local static
            for select #TEMP.VARIABLE from #TEMP
declare DC  cursor local dynamic
            for select #TEMP.VARIABLE from #TEMP
open SC
open DC
update #TEMP set VARIABLE = 'CHANGED'
fetch SC into @str
print 'STATIC: '+ @str
fetch DC into @str
print 'DYNAMIC: '+ @str
drop table #TEMP