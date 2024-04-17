create table Students(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Surname] nvarchar(50),
[Age] int,
[Email] nvarchar(50),
[Address] nvarchar(50)
)



create table StudentArchive(
  [Id] int primary key identity(1,1),
  [StudentId] int,
  [StudentName] nvarchar(50),
  [StudentSurname] nvarchar(50),
  [StdudentAge] int,
  [StudentEmail] nvarchar(50),
  [StudentAddress] nvarchar(50),
  [Operations] nvarchar(50),
  [Date] datetime
)

select * from Students
select * from StudentArchive


create trigger trg_writeArchiveDeleteStudent on Students
after delete
as
begin
	SET NOCOUNT ON;

    INSERT INTO StudentArchive([StudentId],[StudentName],[StudentSurname],[StdudentAge],[StudentEmail],[StudentAddress],[Operations],[Date])
    SELECT  [Id],[Name],[Surname],[Age],[Email],[Address],'Deleted', GETDATE()
    FROM deleted;
end




create procedure usp_deleteStudent
@id int
as
begin
delete from Students where [Id] = @id
end

exec usp_deleteStudent 4