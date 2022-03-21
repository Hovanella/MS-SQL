use UNIVER
select AUDITORIUM_TYPE,AUDITORIUM_CAPACITY
from AUDITORIUM f
where AUDITORIUM_CAPACITY = (select top(1) AUDITORIUM_CAPACITY from AUDITORIUM p where  p.AUDITORIUM_TYPE= f.AUDITORIUM_TYPE order by AUDITORIUM_CAPACITY desc  )


/* НЕ ПОНИМАЮ ЭТОТ ЗАПРОС



/*4. На основе таблицы AUDITORIUM сформировать список аудиторий самых больших вместимостей (столбец AUDI-TORIUM_CAPACITY) для каждого типа аудитории (AUDITORIUM_TYPE). При этом результат следует отсортировать в порядке убывания вместимости. Примеча-ние: использовать коррелируемый подза-прос c секциями TOP и ORDER BY. */