/*2. Разработать скрипт, в котором определяется общая вместимость ауди-торий. Когда общая вместимость пре-вышает 200, то вывести количество аудиторий, среднюю вместимость ауди-торий, количество аудиторий, вмести-мость которых меньше средней, и про-цент таких аудиторий. Когда общая вместимость аудиторий меньше 200, то вывести сообщение о размере общей вместимости*/

use UNIVER;
go


DECLARE @SumCapacity                            int
DECLARE @AuditoriumNumber                               int
DECLARE @AverageCapacity                                int
DECLARE @NumberOfAuditoriumsWithCapacityLessThanAverage int

SELECT @SumCapacity = SUM(AUDITORIUM_CAPACITY)
FROM AUDITORIUM
if @SumCapacity > 200
    begin
        select @AuditoriumNumber = (select COUNT(*) from AUDITORIUM),
               @AverageCapacity = (select AVG(AUDITORIUM_CAPACITY) FROM AUDITORIUM)
         set      @NumberOfAuditoriumsWithCapacityLessThanAverage = (select COUNT(*)
                                                               from AUDITORIUM
                                                               where AUDITORIUM_CAPACITY < @AverageCapacity)
        select @AuditoriumNumber                                as [Кол-во аудиторий],
               @AverageCapacity                                as [Средняя вместимость],
               @NumberOfAuditoriumsWithCapacityLessThanAverage as [Кол-во аудиторий,вместимостью меньше средней],
               100 * (cast(@NumberOfAuditoriumsWithCapacityLessThanAverage as float) /
                      cast(@AverageCapacity as float))            'процент аудиторий,вместимостью меньше средней'
    end
else
    select @SumCapacity;