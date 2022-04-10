use UNIVER
select  Name, BDAY from STUDENT a
where BDAY in ( select BDAY from STUDENT where a.NAME <> STUDENT.NAME)
order by BDAY

	

/*10*. Найти в таблице STUDENT студентов, у которых день рождения в один день. Объяснить решение.*/