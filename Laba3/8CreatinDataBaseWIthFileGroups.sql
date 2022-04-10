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
Create table ���������
(
    [ID ���������] int identity (1,1)
        constraint PK_��������� primary key,
    �������        nvarchar(50) not null,
    ���            nvarchar(50),
    ��������       nvarchar(50),
    �����          nvarchar(50),
    �������        nvarchar(50),
    ����           int check (���� >= 0),
)ON FG1;

Insert into ��������� (�������, ���, ��������, �����, �������, ����)
VALUES ('������', '����', '��������', '�����', '4', 10),
       ('�������', '������', '���������', '������', '3', 15),
       ('���������', '�������', '����������', '�������', '2', 10),
       ('��������', '�������', '����������', '�����', '1', 0);



Create table ����_��������
(
    [ID ���� ��������]  int identity (1,1)
        constraint ��_����_�������� primary key,
    ��������            nvarchar(50),
    [������� ���������] int
)ON FG1;
Insert into ����_�������� (��������, [������� ���������])
VALUES ('��������', 1),
       ('�������', 2),
       ('������������', 2),
       ('����������', 3);

Create table ��������
(
    [ID ��������]      int IDENTITY (1,1)
        constraint ��_�������� primary key,
    [ID ���������]     int foreign key references ��������� ([ID ���������]),
    [ID ���� ��������] int foreign key references ����_�������� ([ID ���� ��������]),
    ����               date,
    [���-�� �������]   int
)ON FG1;
Insert into �������� ([ID ���������], [ID ���� ��������], ����, [���-�� �������])
VALUES (2, 1, '2002-12-24', 100),
       (4, 2, '2003-12-24', 40),
       (2, 3, '2004-12-24', 50),
       (3, 4, '2005-12-24', 10);

