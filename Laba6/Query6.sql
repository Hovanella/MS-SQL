use UNIVER;

SELECT PROFESSION,SUBJECT,G.FACULTY , AVG(NOTE) AS [средний балл]
from FACULTY join GROUPS G on FACULTY.FACULTY = G.FACULTY and G.FACULTY = 'ИДип'
join STUDENT S on G.IDGROUP = S.IDGROUP
join PROGRESS P on S.IDSTUDENT = P.IDSTUDENT
group by  cube (G.FACULTY,PROFESSION,SUBJECT) 

/*6. Выполнить исходный SELECT-запрос п.5 с использованием CUBE-группировки. Проанализировать результат.*/