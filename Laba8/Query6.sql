/*6. Разработать сценарий, в котором с помощью CASE анализируются оценки, полученные студентами некоторого фа-культета при сдаче экзаменов.
*/
use UNIVER;
go

SELECT IDSTUDENT,
       AVG(NOTE) as балл,
		CASE
			WHEN avg (PROGRESS.NOTE) = 4 then 'Достойно'
			WHEN avg (PROGRESS.NOTE) between 5 and 6 then 'Удовлетворительно'
			WHEN avg (PROGRESS.NOTE) between 7 and 8 then 'Хорошо'
			WHEN avg (PROGRESS.NOTE) between 9 and 10 then 'Шикарно'
			else 'Не определено'
		end [Анализ среднего балла]
		FROM PROGRESS
		GROUP BY IDSTUDENT