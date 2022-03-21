use UNIVER
select SUBJECT, NOTE from PROGRESS
	where NOTE >=all (select NOTE from PROGRESS
		where SUBJECT like 'О%')



/*7. Разработать SELECT-запрос, демон-стрирующий принцип применения ALL совместно с подзапросом*/