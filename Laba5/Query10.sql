use UNIVER
select  NAME, BDAY from STUDENT a
	where BDAY in ( select BDAY from STUDENT aa
		group by BDAY
		having count(BDAY)>=2)
order by BDAY asc`

/* Надо переписать без выебонов по типу хэвинга и ордера

/*10*. Найти в таблице STUDENT студентов, у которых день рождения в один день. Объяснить решение.*/