
use UNIVER;
select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPE
from AUDITORIUM_TYPE
         Inner Join AUDITORIUM
                    on AUDITORIUM_TYPE.AUDITORIUM_TYPE = AUDITORIUM.AUDITORIUM_TYPE;
/*
1. Ознакомиться с приложением. Изучить сценарии на языке T-SQL, содержащие опе-раторы для создания и заполнения таблиц базы данных UNIVER.
Выполнить сценарии. Убедиться, что они работают корректно.
На основе таблиц AUDITORIUM_ TYPE и AUDITORIUM сформировать перечень кодов аудиторий (столбец AUDITO-RUM.AUDITORIUM) и соответствующих им наименований типов аудиторий (столбец AUDITORIUM_ TYPE.AUDITORIUM_ TYPENAME). Примечание: использовать соединение таблиц INNER JOIN. */
