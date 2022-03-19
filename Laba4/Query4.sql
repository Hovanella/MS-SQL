use UNIVER;

select STUDENT.NAME,
       FACULTY.FACULTY,
       PULPIT.PULPIT,
       PROFESSION.PROFESSION_NAME,
       SUBJECT.SUBJECT_NAME,
       case
           when (PROGRESS.NOTE = 6) then 'шесть'
           when (PROGRESS.NOTE = 7) then 'семь'
           when (PROGRESS.NOTE = 8) then 'восемь'
           end [PROGRESS.NOTE]
from PROGRESS
         inner join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
         inner join [SUBJECT] on [SUBJECT].[SUBJECT] = PROGRESS.[SUBJECT]
         inner join GROUPS on GROUPS.IDGROUP = STUDENT.IDGROUP
         inner join PROFESSION on PROFESSION.PROFESSION = GROUPS.PROFESSION
         inner join PULPIT on PULPIT.PULPIT = [SUBJECT].PULPIT
         inner join FACULTY on FACULTY.FACULTY = PULPIT.FACULTY
where PROGRESS.NOTE between 6 and 8
order by FACULTY.FACULTY asc, PROGRESS.NOTE desc, PULPIT.PULPIT asc, PROFESSION.PROFESSION asc, STUDENT.NAME asc

/*4. На основе таблиц PRORGESS, STU-DENT, GROUPS, SUBJECT, PULPIT и FACULTY сформировать перечень студен-тов, получивших экзаменационные оценки (столбец PROGRESS.NOTE) от 6 до 8.
Результирующий набор должен содержать столбцы: Факультет, Кафедра, Специаль-ность, Дисциплина, Имя Студента, Оцен-ка. В столбце Оценка должны быть записа-ны экзаменационные оценки прописью: шесть, семь, восемь.
Результирующий набор отсортировать в 4. На основе таблиц PRORGESS, STU-DENT, GROUPS, SUBJECT, PULPIT и FACULTY сформировать перечень студен-тов, получивших экзаменационные оценки (столбец PROGRESS.NOTE) от 6 до 8.
Результирующий набор должен содержать столбцы: Факультет, Кафедра, Специаль-ность, Дисциплина, Имя Студента, Оцен-ка. В столбце Оценка должны быть записа-ны экзаменационные оценки прописью: шесть, семь, восемь.
Результирующий набор отсортировать в */

