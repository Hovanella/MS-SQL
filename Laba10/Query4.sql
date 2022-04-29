/*4. Разработать сценарий, демонстри-рующий свойства навигации в резуль-тирующем наборе курсора с атрибутом SCROLL на примере базы данных X_UNIVER.
Использовать все известные ключе-вые слова в операторе FETCH.
*/

use UNIVER;
go

declare @str varchar(50)
declare curs    cursor local scroll
                for select TEACHER.TEACHER_NAME from TEACHER
open curs
fetch next from curs into @str
print 'NEXT: '+@str
fetch prior from curs into @str
print 'PRIOR: '+@str
fetch first from curs into @str
print 'FIRST: '+@str
fetch last from curs into @str
print 'LAST: '+@str
fetch absolute 2 from curs into @str
print 'ABSOLUTE 2: '+@str
fetch relative -1 from curs into @str
print 'RELATIVE -1: '+@str
close curs