use UNIVER
select PULPIT_NAME
from PULPIT,
     FACULTY
where PULPIT.FACULTY = FACULTY.FACULTY
  and PULPIT.FACULTY in (select PROFESSION.FACULTY
                         from PROFESSION
                         where PROFESSION_NAME LIKE ('%технология%')
                            or PROFESSION_NAME LIKE ('%технологии%'))


/*1. На основе таблиц FACULTY, PUL-PIT и PROFESSION сформировать спи-сок наименований кафедр (столбец PUL-PIT_NAME), которые находятся на фа-культете (таблица FACULTY), обеспечи-вающем подготовку по специальности, в наименовании (столбец PROFESSION_ NAME) которого содержится слово технология или технологии. Примечание: использовать в секции WHERE предикат IN c некоррелированным подзапросом к таблице PROFESSION. */