/*1. На основе таблицы AUDITORIUM разработать SELECT-запрос, вычисляющий максимальную, минимальную и среднюю вместимость аудиторий, суммарную вме-стимость всех аудиторий и общее количе-ство аудиторий.*/
use UNIVER
Select max(AUDITORIUM_CAPACITY)  [Максимальная вместительность],
 min(AUDITORIUM_CAPACITY)  [Минимальная вместительность],
 avg(AUDITORIUM_CAPACITY)  [Средняя вместительность],
 count(*)  [Общее кол-во аудиторий]
From AUDITORIUM