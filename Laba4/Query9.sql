use UNIVER;

select AUDITORIUM.AUDITORIUM, AUDITORIUM_TYPE.AUDITORIUM_TYPE
from AUDITORIUM
         cross join AUDITORIUM_TYPE
where AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE;




--9. ����������� SELECT-������ �� ������ CROSS JOIN-���������� ������ AUDITORIUM_TYPE � AUDITORIUM, �������-����� ���������, ����������� ����������, ����������� ��� ���������� ������� � ��-����� 1.