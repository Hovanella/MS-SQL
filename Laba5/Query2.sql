use UNIVER;
select PULPIT_NAME
from PULPIT
         join FACULTY F on F.FACULTY = PULPIT.FACULTY
    and
                           PULPIT.FACULTY IN
                           (select PROFESSION.FACULTY
                            from PROFESSION
                            where PROFESSION_NAME LIKE ('%технология%')
                               or PROFESSION_NAME LIKE ('%технологии%'))

/*2. Переписать запрос пункта 1 таким образом, чтобы тот же подзапрос был за-писан в конструкции INNER JOIN секции FROM внешнего запроса. При этом ре-зультат выполнения запроса должен быть аналогичным результату исходного запро-са.*/