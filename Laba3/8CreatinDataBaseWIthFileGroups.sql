use master
go

create database H_MyBase_H
    on primary
    (name = N'H_MyBase_mdf', filename = N'D:\DB\H_MyBase_mdf.mdf',
        size = 10240 Kb, maxsize = UNLIMITED, filegrowth =1024 Kb),

    ( name = N'H_MyBase_ndf', filename = N'D:\DB\H_MyBase_ndf.ndf',
        size = 10240 KB, maxsize =1 Gb, filegrowth =25%),

    filegroup FG1

        ( name = N'H_MyBase_fg1_1', filename = N'D:\DB\H_MyBase__fgq-1.ndf',
            size = 10240 Kb, maxsize =1 Gb, filegrowth =25%),
        ( name = N'H_MyBase_fg1_2', filename = N'D:\DB\H_MyBase_fgq-2.ndf',
            size = 10240 Kb, maxsize =1 Gb, filegrowth =25%)
    log on
    (name = N'H_MyBase_log', filename = N'D:\DB\H_MyBase_log.ldf',
        size = 10240 Kb, maxsize =2048 Gb, filegrowth =10%)

go

use H_MYBASE_H
Create table РАБОТНИКИ
(
    [ID Работника] int identity (1,1)
        constraint PK_РАБОТНИКИ primary key,
    Фамилия        nvarchar(50) not null,
    Имя            nvarchar(50),
    Отчество       nvarchar(50),
    Адрес          nvarchar(50),
    Телефон        nvarchar(50),
    Стаж           int check (Стаж >= 0),
)ON FG1;

Insert into РАБОТНИКИ (Фамилия, Имя, Отчество, Адрес, Телефон, Стаж)
VALUES ('Иванов', 'Иван', 'Иванович', 'Минск', '4', 10),
       ('Андреев', 'Андрей', 'Андреевич', 'Гродно', '3', 15),
       ('Васильенв', 'Василий', 'Васильевич', 'Витебск', '2', 10),
       ('Дмитриев', 'Дмитрий', 'Дмитриевич', 'Минск', '1', 0);



Create table ВИДЫ_ОПЕРАЦИЙ
(
    [ID Вида Операции]  int identity (1,1)
        constraint РК_ВИДЫ_ОПЕРАЦИЙ primary key,
    Название            nvarchar(50),
    [Признак Сложности] int
)ON FG1;
Insert into ВИДЫ_ОПЕРАЦИЙ (Название, [Признак Сложности])
VALUES ('Проточка', 1),
       ('Бурение', 2),
       ('Рефрежировка', 2),
       ('Фрезеровка', 3);

Create table ОПЕРАЦИИ
(
    [ID Операции]      int IDENTITY (1,1)
        constraint РК_ОПЕРАЦИИ primary key,
    [ID Работника]     int foreign key references РАБОТНИКИ ([ID Работника]),
    [ID Вида Операции] int foreign key references ВИДЫ_ОПЕРАЦИЙ ([ID Вида Операции]),
    Дата               date,
    [Кол-во деталей]   int
)ON FG1;
Insert into ОПЕРАЦИИ ([ID Работника], [ID Вида Операции], Дата, [Кол-во деталей])
VALUES (2, 1, '2002-12-24', 100),
       (4, 2, '2003-12-24', 40),
       (2, 3, '2004-12-24', 50),
       (3, 4, '2005-12-24', 10);

