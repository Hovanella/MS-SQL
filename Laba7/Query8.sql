/*8*. Разработать представление для таблицы TIMETABLE (лабораторная работа 6) в виде расписания. Изучить оператор PIVOT и использовать его.*/
use UNIVER
go

drop view if exists TimetableView
go

create view TimetableView
    as select top(50) [day], [lesson], [1 group], [2 group], [3 group], [4 group]
    from (
         select top(50) DAY_NAME [day],
                              LESSON [lesson],
                        convert(varchar,IDGROUP) + ' group' [group],
                        SUBJECT + ' ' + AUDITORIUM [discipline]
         from TIMETABLE
             ) tb1
    pivot (
        max([discipline])
        for [group]
        in ([1 group], [2 group], [3 group], [4 group])
        ) as pvt
    order by (
        case
            when [day] like N'пн' then 1
            when [day] like N'вт' then 2
       
        end), [lesson]
go

select * from TimetableView


