/*10. На основе таблицы PROGRESS определить для каждой дисциплины коли-чество студентов, получивших оценки 8 и 9. Использовать группировку, секцию HAVING, сортировку. */

use UNIVER;
select SUBJECT,
       count(*) as count
from PROGRESS
group by SUBJECT, NOTE
HAVING NOTE in (8, 9)
order by SUBJECT;
