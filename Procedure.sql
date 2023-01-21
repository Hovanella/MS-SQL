use UNIVER
go



Create PROCEDURE TeacherSubjects @Name varchar(100) as
    begin

        select SUBJECT_NAME
        from SUBJECT inner join TEACHER T on SUBJECT.PULPIT = T.PULPIT
        where @Name = T.TEACHER_NAME;

    end
    go

exec TeacherSubjects 'Акунович Станислав Иванович';


go
Create FUNCTION TeacherSubjectss (@Name varchar(100)) returns table
    as return
         select SUBJECT_NAME
        from SUBJECT inner join TEACHER T on SUBJECT.PULPIT = T.PULPIT
        where @Name = T.TEACHER_NAME;
go

select * from TeacherSubjectss('Акунович Станислав Иванович')

drop function TeacherSubjectss
go
drop procedure TeacherSubjects 
go