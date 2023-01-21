--2-- СВОЙСТВО АТОМАРНОСТИ ЯВНОЙ ТРАНЗАКЦИИ
begin try        
begin tran                 -- начало  явной транзакции
insert FACULTY values ('ДФ111', 'Другой факультет');
insert FACULTY values ('ПиМ111', 'Факультет print-технологий');
insert FACULTY values ('ИТ','Самый лучший');
update FACULTY set FACULTY_NAME='The Best' where FACULTY='ИТ'
commit tran;               -- фиксация транзакции
end try
begin catch
print 'ошибка: '+ case 
when error_number() = 2627 and patindex('%FACULTY_PK%', error_message()) > 0 
then 'дублирование '	--позиция 1-го вхождения
else 'неизвестная ошибка: '+ cast(error_number() as  varchar(5))+ error_message()  
end;
if @@trancount > 0 rollback tran; -- ур.вложенности тр.>0,  транз не завершена 	  
end catch;

select * from FACULTY; 

update FACULTY set FACULTY_NAME='Факультет информационных технологий' where FACULTY='ИТ'
DELETE FACULTY WHERE FACULTY = 'ДФ';
DELETE FACULTY WHERE FACULTY = 'ПиМ';
