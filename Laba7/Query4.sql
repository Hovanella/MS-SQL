/*4. Разработать и создать представление с именем Лекционные_аудитории.
Представление должно быть построено на основе SELECT-запроса к таблице AUDITO-RIUM и содержать следующие столбцы: код (AUDITORIUM), наименование аудитории (AUDITORIUM_NAME).
Представление должно отображать только лекционные аудитории (в столбце AUDITO-RIUM_TYPE строка, начинающаяся с симво-лов ЛК).
Выполнение INSERT и UPDATE допускает-ся, но с учетом ограничения, задаваемого оп-цией WITH CHECK OPTION.
*/

use UNIVER;
go

drop view if exists Лекционные_аудитории
go

create view Лекционные_аудитории as
    select AUDITORIUM, AUDITORIUM_NAME,AUDITORIUM_TYPE
    from AUDITORIUM
    where AUDITORIUM_TYPE like 'ЛК%' with check option;
go

Insert Лекционные_аудитории values (176445, 'Лasda','Л');
go

select * from Лекционные_аудитории;