use UNIVER;




Select
(select avg(NOTE) from PROGRESS where SUBJECT= N'ОАиП')[Средняя отметка по ОАиП],
(select avg(NOTE) from PROGRESS where SUBJECT= N'СУБД')[Средняя отметка по СУБД],
(select avg(NOTE) from PROGRESS where SUBJECT= N'КГ')[Средняя отметка по КГ]







/*6. На основе таблицы PROGRESS сформировать строку, содержащую сред-ние значения оценок (столбец NOTE) по дисциплинам, имеющим следующие коды: ОАиП, БД и СУБД. Примечание: использовать три некоррелированных подзапроса в списке SELECT; в подзапросах применить агрегатные функции AVG. */