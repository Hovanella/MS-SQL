use UNIVER
select SUBJECT, NOTE, IDSTUDENT from PROGRESS
	where NOTE =any (select NOTE from PROGRESS
		where IDSTUDENT=1019 and SUBJECT='Кг')

/*-Вывести Предмет, айди студента , который получил по этому предмету такую же отметку,как студент 1019 получил за КГ -*/


/*8. Разработать SELECT-запрос, демонстрирующий принцип применения ANY совместно с подзапросом.*/