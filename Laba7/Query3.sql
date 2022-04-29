
/*3. Разработать и создать представление с именем Аудитории. Представление должно быть построено на основе таблицы AUDITO-RIUM и содержать столбцы: код (AUDITO-RIUM), наименование аудитории (AUDITO-RIUM_NAME).
Представление должно отображать только лекционные аудитории (в столбце AUDITO-RIUM_ TYPE строка, начинающаяся с симво-ла ЛК) и допускать выполнение оператора IN-SERT, UPDATE и DELETE.
*/


use UNIVER;
go

  

drop view if exists Аудитории;
go

Create VIEW Аудитории(Код , Наименование )  AS
    select AUDITORIUM,AUDITORIUM_NAME from AUDITORIUM 
	--where AUDITORIUM_TYPE like 'лк%'
go

Insert Аудитории values ('666','Лк');
Update Аудитории set Наименование = '100' where Код = '313-1';

go

select * from Аудитории
go

