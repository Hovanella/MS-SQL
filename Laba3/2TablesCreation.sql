use H_MYBASE_

Create table РАБОТНИКИ
(
[ID Работника] int identity(1,1) constraint PK_РАБОТНИКИ primary key,
Фамилия nvarchar(50) not null ,
Имя nvarchar(50),
Отчество nvarchar(50),
Адрес nvarchar(50),
Телефон nvarchar(50),
Стаж int check (Стаж >=0),
)


Create table ВИДЫ_ОПЕРАЦИЙ(
    [ID Вида Операции] int identity (1,1) constraint РК_ВИДЫ_ОПЕРАЦИЙ primary key ,
    Название nvarchar(50),
    [Признак Сложности] int
);

Create table ОПЕРАЦИИ(
    [ID Операции] int IDENTITY (1,1) constraint РК_ОПЕРАЦИИ primary key ,
    [ID Работника] int foreign key references РАБОТНИКИ([ID Работника]),
    [ID Вида Операции] int foreign key references ВИДЫ_ОПЕРАЦИЙ([ID Вида Операции]),
    Дата date ,
    [Кол-во деталей] int
)


select * from Операции;

