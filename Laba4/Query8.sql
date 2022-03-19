--1
use UNIVER;
(SELECT NAME, YEAR_FIRST
 FROM STUDENT
          FULL OUTER JOIN GROUPS G on STUDENT.IDGROUP = G.IDGROUP
 EXCEPT
 SELECT NAME,
        YEAR_FIRST

 FROM GROUPS
          FULL OUTER JOIN STUDENT S on GROUPS.IDGROUP = S.IDGROUP)
UNION
(
    SELECT NAME,
           YEAR_FIRST

    FROM GROUPS
             FULL OUTER JOIN STUDENT S
                             on GROUPS.IDGROUP = S.IDGROUP
    EXCEPT
    SELECT NAME, YEAR_FIRST
    FROM STUDENT
             FULL OUTER JOIN GROUPS G
                             on STUDENT.IDGROUP = G.IDGROUP
);

--2
(
    SELECT NAME, YEAR_FIRST
    From GROUPS
             Left OUTER JOIN STUDENT S2 on GROUPS.IDGROUP = S2.IDGROUP
    Union ALL
    SELECT NAME, YEAR_FIRST
    From GROUPS
             RIGHT outer join STUDENT S3 on GROUPS.IDGROUP = S3.IDGROUP)
EXCEPT
(SELECT NAME,
        YEAR_FIRST
 FROM GROUPS
          FULL OUTER JOIN STUDENT S on GROUPS.IDGROUP = S.IDGROUP)
UNION
(
    (
        SELECT NAME,
               YEAR_FIRST
        FROM GROUPS
                 FULL OUTER JOIN STUDENT S
                                 on GROUPS.IDGROUP = S.IDGROUP)
    EXCEPT
    (
        SELECT NAME, YEAR_FIRST
        From GROUPS
                 Left OUTER JOIN STUDENT S2
                                 on GROUPS.IDGROUP = S2.IDGROUP
        Union ALL
        SELECT NAME, YEAR_FIRST
        From GROUPS
                 RIGHT outer join STUDENT S3
                                  on GROUPS.IDGROUP = S3.IDGROUP));

--3
(SELECT NAME, YEAR_FIRST
 FROM STUDENT
          inner JOIN GROUPS G on STUDENT.IDGROUP = G.IDGROUP
 except
 (SELECT NAME, YEAR_FIRST
  FROM STUDENT
           FULL OUTER JOIN GROUPS G
                           on STUDENT.IDGROUP = G.IDGROUP));


--4


select PULPIT.FACULTY, PULPIT.PULPIT, PULPIT.PULPIT_NAME
from PULPIT full outer join TEACHER
on PULPIT.PULPIT = TEACHER.PULPIT
where TEACHER.TEACHER is null

--5
select TEACHER.TEACHER_NAME, TEACHER.TEACHER, TEACHER.PULPIT,TEACHER.GENDER
from PULPIT full outer join TEACHER
on PULPIT.PULPIT=TEACHER.PULPIT
where TEACHER.TEACHER is not null

--6
select * from PULPIT full outer join TEACHER
on PULPIT.PULPIT = TEACHER.PULPIT




/*8. Показать на примере, что соединение
FULL OUTER JOIN двух таблиц:
− является коммутативной операцией;
− является объединением LEFT OUTER JOIN и RIGHT OUTER JOIN соединений этих таблиц;
− включает соединение INNER JOIN этих таблиц.
Примечание: создать две таблицы, запол-нить их данными. Разработать SELECT-запросы, реализующие задания.

Создать три новых запроса:
− запрос, результат которого содержит дан-ные левой (в операции FULL OUTER JOIN) таблицы и не содержит данные правой;
− запрос, результат которого содержит дан-ные правой таблицы и не содержащие данные левой;
− запрос, результат которого содержит дан-ные правой таблицы и левой таблиц;
Примечание: использовать в запросах вы-ражение IS NULL и IS NOT NULL.*/
