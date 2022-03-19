use H_MYBASE_
select Distinct Имя , Фамилия,Отчество
from РАБОТНИКИ where Стаж between 5 and 10

select * from ВИДЫ_ОПЕРАЦИЙ where Название like 'Ф%' order by [ID Вида Операции] desc

select * from ОПЕРАЦИИ where [Кол-во деталей] in (50,100)