use UNIVER
select SUBJECT, NOTE from PROGRESS
	where NOTE >any (select NOTE from PROGRESS
		where IDSTUDENT=1019)

/*8. Разработать SELECT-запрос, демонстрирующий принцип применения ANY совместно с подзапросом.*/