use H_MyBase_

Select * from РАБОТНИКИ;

SELECT count(*) as NumberOfColumns FROM РАБОТНИКИ;

SELECT * FROM РАБОТНИКИ
WHERE ( (Стаж=10) or (ПОЛ = 'м') ) and (Телефон Between 3 and 4)
order by Стаж desc

SELECT Distinct Адрес from РАБОТНИКИ

SELECT Top(5) * from РАБОТНИКИ;

Delete Top(5) from ОПЕРАЦИИ;

