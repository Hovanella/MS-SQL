use UNIVER
select SUBJECT, IDSTUDENT , NOTE from PROGRESS z
	where NOTE >=all (select NOTE from PROGRESS
		where SUBJECT = z.SUBJECT )

/*Вывести предмет,оценку и айди студента, который получил по своему предмету отметку больше либо равную наивысшей отметки, полученной за этот предмет*/



/*7. Разработать SELECT-запрос, демон-стрирующий принцип применения ALL совместно с подзапросом*/