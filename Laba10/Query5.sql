/*5. Создать курсор, демонстрирую-щий применение конструкции CUR-RENT OF в секции WHERE с исполь-зованием операторов UPDATE и DE-LETE.*/
use UNIVER;
go

drop table if exists #TEMP;
go

create table #TEMP
(
    variable nvarchar(50)
)
insert #TEMP
values ('DEFAULT')
insert #TEMP
values ('delete')

declare @str nvarchar(50) = ''
declare CURS cursor local dynamic
    for select #TEMP.VARIABLE
        from #TEMP for update
open CURS
fetch CURS into @str
update #TEMP
set #TEMP.VARIABLE = 'UPDATED'
where current of CURS
fetch CURS into @str
delete #TEMP
where current of CURS
close CURS
select *
from #TEMP

