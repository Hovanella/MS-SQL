/*4. Разработать T-SQL-скрипты, вы-полняющие:
 вычисление значений переменной z

для различных значений исходных данных;
 преобразование полного ФИО сту-дента в сокращенное (например, Макейчик Татьяна Леонидовна в Макейчик Т. Л.);
 поиск студентов, у которых день рождения в следующем месяце, и опре-деление их возраста;
 поиск дня недели, в который сту-денты некоторой группы сдавали экза-мен по СУБД.*/

use UNIVER;
go

declare @t float=3, @x float=4, @z float;
if (@t > @x) set @z = power(SIN(@t), 2);
if (@t < @x) set @z = 4 * (@t + @x);
if (@t = @x) set @z = 1 - exp(@x - 2);
print 'z=' + cast(@z as varchar(10));

declare @FIO varchar(100)='Хованский Тимофей Александрович'
select substring(@FIO, 1, charindex(' ', @FIO))
           + substring(@FIO, charindex(' ', @FIO) + 1, 1) + '.'
           + substring(@FIO, charindex(' ', @FIO, charindex(' ', @FIO) + 1) + 1, 1) + '.'


select NAME as 'Имя', DATEDIFF(YEAR, BDAY, GETDATE())  as 'Кол-во лет'
from STUDENT
where MONTH(BDAY) = MONTH(getdate()) + 1;

select *
from (select *,
             (CASE
                  when DATEPART(weekday, PDATE) = 1 then 'Понедельник'
                  when DATEPART(weekday, PDATE) = 2 then 'Вторник'
                  when DATEPART(weekday, PDATE) = 3 then 'Среда'
                  when DATEPART(weekday, PDATE) = 4 then 'Четверг'
                  when DATEPART(weekday, PDATE) = 5 then 'Пятница'
                  when DATEPART(weekday, PDATE) = 6 then 'Суббота'
                  when DATEPART(weekday, PDATE) = 7 then 'Воскресение'
                 end) День_недели
      from PROGRESS
      where [SUBJECT] like '%СУБД%') as tr;