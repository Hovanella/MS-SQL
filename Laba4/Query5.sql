use UNIVER;

select FACULTY.FACULTY,
       PULPIT.PULPIT,
       PROFESSION.PROFESSION_NAME,
       SUBJECT.SUBJECT_NAME,
       STUDENT.NAME,
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
order by (case
              when (PROGRESS.NOTE = '6') then 3
              when (PROGRESS.NOTE = '7') then 1
              when (PROGRESS.NOTE = '8') then 2
    end);

/*5. Переписать запрос, реализующий зада-ние 4 таким образом, чтобы в результирую-щем наборе сортировка по экзаменационным оценкам была следующей: сначала выводи-лись строки с оценкой 7, затем строки с оценкой 8 и далее строки с оценкой 6.
Примечание: использовать выражение CASE в секции ORDER BY.
*/

