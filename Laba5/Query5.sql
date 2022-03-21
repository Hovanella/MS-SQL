use UNIVER;
Select distinct FACULTY_NAME
from FACULTY,
     PULPIT
where not exists(select PULPIT.PULPIT from PULPIT where FACULTY.FACULTY = PULPIT.FACULTY)

/*5. На основе таблиц FACULTY и PUL-PIT сформировать список наименований факультетов (столбец FACULTY_NAME) на котором нет ни одной кафедры (табли-ца PULPIT). Примечание: использовать предикат EXISTS и коррелированный под-запрос. */