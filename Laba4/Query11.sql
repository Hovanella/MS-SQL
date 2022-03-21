use UNIVER;
create table TIMETABLE
(
    DAY_NAME   char(2) check (DAY_NAME in ('пн', 'вт', 'ср', 'чт', 'пт', 'сб')),
    LESSON     integer check (LESSON between 1 and 4),
    TEACHER    char(10)
        constraint TIMETABLE_TEACHER_FK foreign key references TEACHER (TEACHER),
    AUDITORIUM char(20)
        constraint TIMETABLE_AUDITORIUM_FK foreign key references AUDITORIUM (AUDITORIUM),
    SUBJECT    char(10)
        constraint TIMETABLE_SUBJECT_FK foreign key references SUBJECT (SUBJECT),
    IDGROUP    integer
        constraint TIMETABLE_GROUP_FK foreign key references GROUPS (IDGROUP),
)
insert into TIMETABLE
values ('пн', 1, 'СМЛВ', '313-1', 'СУБД', 2),
       ('пн', 2, 'СМЛВ', '313-1', 'ОАиП', 4),
       ('пн', 3, 'СМЛВ', '313-1', 'ОАиП', 11),

       ('пн', 1, 'МРЗ', '324-1', 'СУБД', 6),
       ('пн', 3, 'УРБ', '324-1', 'ПИС', 4),

       ('пн', 1, 'УРБ', '206-1', 'ПИС', 10),
       ('пн', 4, 'СМЛВ', '206-1', 'ОАиП', 3),

       ('пн', 1, 'БРКВЧ', '301-1', 'СУБД', 7),
       ('пн', 4, 'БРКВЧ', '301-1', 'ОАиП', 7),

       ('пн', 2, 'БРКВЧ', '413-1', 'СУБД', 8),

       ('пн', 2, 'ДТК', '423-1', 'СУБД', 7),
       ('пн', 4, 'ДТК', '423-1', 'ОАиП', 2),

       ('вт', 1, 'СМЛВ', '313-1', 'СУБД', 2),
       ('вт', 2, 'СМЛВ', '313-1', 'ОАиП', 4),

       ('вт', 3, 'УРБ', '324-1', 'ПИС', 4),
       ('вт', 4, 'СМЛВ', '206-1', 'ОАиП', 3);

--1
select AUDITORIUM_NAME as 'Аудитория, свободные на 2 паре во вт'
from AUDITORIUM
except
select distinct AUDITORIUM.AUDITORIUM_NAME
from AUDITORIUM inner join TIMETABLE T on T.LESSON = 2 and T.DAY_NAME='вт' and AUDITORIUM.AUDITORIUM = T.AUDITORIUM


--2
select AUDITORIUM_NAME as 'Аудитория, свободные на во вт'
from AUDITORIUM
except
select distinct AUDITORIUM.AUDITORIUM_NAME
from AUDITORIUM inner join TIMETABLE T on T.DAY_NAME='вт' and AUDITORIUM.AUDITORIUM = T.AUDITORIUM


--3
select distinct TEACHER_NAME,DAY_NAME, case
           when ( count(*)= 0) then 4
           when ( count(*)= 1) then 3
           when ( count(*)= 2) then 2
           when ( count(*)= 3) then 1
           when ( count(*)= 4) then 0
           end [Кол-во окон]
FROM  TEACHER inner join dbo.TIMETABLE T on TEACHER.TEACHER = T.TEACHER
group by TEACHER_NAME,DAY_NAME
order by TEACHER_NAME



-- select distinct TEACHER.TEACHER_NAME,DAY_NAME,LESSON
-- FROM  TEACHER cross join dbo.TIMETABLE T
-- where TEACHER.TEACHER in (select TEACHER from  TIMETABLE)








-- ex 4: окна у групп
select distinct GROUPS.IDGROUP,DAY_NAME, case
           when ( count(*)= 0) then 4
           when ( count(*)= 1) then 3
           when ( count(*)= 2) then 2
           when ( count(*)= 3) then 1
           when ( count(*)= 4) then 0
           end [Кол-во окон]
FROM  GROUPS inner join dbo.TIMETABLE T on GROUPS.IDGROUP = T.IDGROUP
group by GROUPS.IDGROUP,DAY_NAME
order by GROUPS.IDGROUP





