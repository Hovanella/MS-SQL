/*7. Создать временную локальную таблицу из трех столбцов и 10 строк, заполнить ее и вывести содержимое. Использовать оператор WHILE.*/

use UNIVER;
go

DROP TABLE if exists #temp;
CREATE TABLE #temp
(
    ID            int identity (1,1),
    RANDOM_NUMBER int,
    WORD          varchar(50) default 'value'
);

DECLARE @iter int = 0;
WHILE @iter < 10
    begin
        INSERT #temp(RANDOM_NUMBER)
        values (rand() * 1000);
        SET @iter = @iter + 1;
    end

SELECT *
from #temp;