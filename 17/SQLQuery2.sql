use UNIVER--1 ����������� �������� �������� XML-��������� � ������ PATH �� ������� TEACHER ��� �������������� ������� ����.
go
select PULPIT.FACULTY[���������/@���], TEACHER.PULPIT[���������/�������/@���], 
    TEACHER.TEACHER_NAME[���������/�������/�������������/@���]
	    from TEACHER inner join PULPIT
		    on TEACHER.PULPIT = PULPIT.PULPIT
			   where TEACHER.PULPIT = '����' for xml path, root('������_��������������_�������_����');

--2 ������������ ���������, ������������ ���� ��������� � �����������
go
select AUDITORIUM.AUDITORIUM [���������],
           AUDITORIUM.AUDITORIUM_TYPE [�������������_����],
		   AUDITORIUM.AUDITORIUM_CAPACITY [�����������] 
		   from AUDITORIUM join AUDITORIUM_TYPE
		     on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
	where AUDITORIUM.AUDITORIUM_TYPE = '��' for xml AUTO, root('������_���������'), elements;

--3 XML-��������, ���������� ������ � ���� ����� ������� �����������, ������� ������� �������� � ������� SUBJECT. 
--����������� ��������, ����������� ������ � ����������� �� XML-��������� 
go
declare @h int = 0,
@sbj varchar(3000) = '<?xml version="1.0" encoding="windows-1251" ?>
                      <����������>
					     <���������� ���="����" ��������="������������ ��������� � �������" �������="����" />
						 <���������� ���="���" ��������="������ ������ ����������" �������="����" />
						 <���������� ���="���" ��������="�������������� ���������������� �" �������="����" />
					  </����������>';
exec sp_xml_preparedocument @h output, @sbj;
insert SUBJECT select[���], [��������], [�������] from openxml(@h, '/����������/����������',0)
    with([���] char(10), [��������] varchar(100), [�������] char(20));
	select * from SUBJECT;

--4 ����������� ��������, � ������� ������� �������� INSERT, ����������� ������ � XML-��������.
insert into STUDENT(IDGROUP, NAME, BDAY, INFO) values(22, '������ �.�.', '19.10.2001',
                                                          '<�������>
														     <������� �����="��" �����="1234567" ����="01.05.2013" />
															 <�������>+75257764165</�������>
															 <�����>
															    <������>��������</������>
																<�����>�����</�����>
																<�����>����������</�����>
																<���>25</���>
																<��������>318</��������>
															 </�����>
														  </�������>');
select * from STUDENT where NAME = '������ �.�.';
update STUDENT set INFO = '<�������>
					           <������� �����="��" �����="1234567" ����="01.05.2013" />
						       <�������>375257764165</�������>
							   <�����>
								  <������>��������</������>
								  <�����>�����</�����>
								  <�����>����������</�����>
	         					  <���>25</���>
								  <��������>318</��������>
								</�����>
							 </�������>'
where NAME = '������ �.�.';
select NAME[���], INFO.value('(�������/�������/@�����)[1]', 'char(2)')[����� ��������],
	INFO.value('(�������/�������/@�����)[1]', 'varchar(20)')[����� ��������],
	INFO.query('/�������/�����')[�����]
		from  STUDENT
			where NAME = '������ �.�.'; 


--5 
go
create xml schema collection Student as 
N'<?xml version="1.0" encoding="utf-16" ?>
<xs:schema attributeFormDefault="unqualified" 
   elementFormDefault="qualified"
   xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xs:element name="�������">
<xs:complexType><xs:sequence>
<xs:element name="�������" maxOccurs="1" minOccurs="1">
  <xs:complexType>
    <xs:attribute name="�����" type="xs:string" use="required" />
    <xs:attribute name="�����" type="xs:unsignedInt" use="required"/>
    <xs:attribute name="����"  use="required">
	<xs:simpleType>  <xs:restriction base ="xs:string">
		<xs:pattern value="[0-9]{2}.[0-9]{2}.[0-9]{4}"/>
	 </xs:restriction> 	</xs:simpleType>
     </xs:attribute>
  </xs:complexType>
</xs:element>
<xs:element maxOccurs="3" name="�������" type="xs:unsignedInt"/>
<xs:element name="�����">   <xs:complexType><xs:sequence>
   <xs:element name="������" type="xs:string" />
   <xs:element name="�����" type="xs:string" />
   <xs:element name="�����" type="xs:string" />
   <xs:element name="���" type="xs:string" />
   <xs:element name="��������" type="xs:string" />
</xs:sequence></xs:complexType>  </xs:element>
</xs:sequence></xs:complexType>
</xs:element></xs:schema>';



drop XML SCHEMA COLLECTION Student;

select Name, INFO from STUDENT where NAME='������ �.�.'