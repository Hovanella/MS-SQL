Select Наименование_товара
From ЗАКАЗЫ
Where (Дата_поставки > CONVERT(DATETIME, '2004-12-12 00:00:00', 102))
