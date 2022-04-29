/*. Продемонстрировать конструкцию IF… ELSE на примере анализа данных таблиц базы данных Х_UNIVER.*/

use UNIVER
go

declare @numberOfGroups int = 100;

if (select count(*) from GROUPS) > @numberOfGroups
begin
    print 'Количество групп больше '+ cast( @numberOfGroups as varchar);
end
else
begin
    print 'Количество групп меньше ' + cast( @numberOfGroups as varchar);
end