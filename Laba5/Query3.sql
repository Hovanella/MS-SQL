use UNIVER;
select distinct PULPIT_NAME
from PULPIT
         join FACULTY F on F.FACULTY = PULPIT.FACULTY
         join PROFESSION P on F.FACULTY = P.FACULTY and (PROFESSION_NAME LIKE ('%технология%')
                               or PROFESSION_NAME LIKE ('%технологии%'))



/*3. Переписать запрос, реализующий 1 пункт без использования подзапроса. Примечание: использовать соединение INNER JOIN трех таблиц. */