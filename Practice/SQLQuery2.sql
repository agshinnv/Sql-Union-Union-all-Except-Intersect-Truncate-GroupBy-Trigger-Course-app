use Practice

select [Name] from Employees
union 
select [Name] from Employees1

select [Name] from Employees
union all
select [Name] from Employees1


select [Name] from Employees
intersect 
select [Name] from Employees1

select [Name] from Employees
except 
select [Name] from Employees1

create table Doctors(
[Id] int primary key identity(1,1),
[Name] nvarchar(50),
[Address] nvarchar(50)
)

delete from Doctors

truncate table Doctors

--select * from Students

--select count(*) as 'Count',Age
--from Students
--group by Age
--order by Age desc

Declare @counter int
set @counter = 1
while ( @counter <= 10 )
begin
	print 'The counter value is = ' + convert(nvarchar,@counter)
	set @counter  = @counter + 1
end


select GETDATE()



create table StudentLogs(
  [Id] int primary key identity(1,1),
  [StudentId] int,
  [Operations] nvarchar(50),
  [Date] datetime
)

select * from StudentLogs



--create trigger trg_writeLogAfterCreate on Students
--after insert
--as
--begin
--    insert into StudentLogs([StudentId],[Operations],[Date])
--	select [Id],'Insert',GETDATE() from inserted
--end



--insert into Students([Fullname],[Email],[Age],[Address],[CityId])
--values ('Omer Alasgarli','omer@code.edu.az',16,'xetai',2)


create procedure usp_insertStudent
@fullname nvarchar(50),
@email nvarchar(50),
@age int,
@address nvarchar(50),
@cityid int
as
begin
   insert into Students([Fullname],[Email],[Age],[Address],[CityId])
   values (@fullname,@email,@age,@address,@cityid)
end

exec usp_insertStudent 'Hesenov Eli','hesenov@code.edu.az',25,'bulbule',1

select * from Students
select * from StudentLogs


create trigger trg_writeLogAfterEdit on Students
after update
as
begin
    insert into StudentLogs([StudentId],[Operations],[Date])
	select [Id],'Update',GETDATE() from deleted
end


update Students
set [Email] = 'test2@gmail.com'
where [Id] = 6

select * from StudentLogs where [Operations] = 'Update'
order by [Date] desc



create table EmployeeLogs(
  [Id] int primary key identity(1,1),
  [EmployeeName] nvarchar(50),
  [OldEmail] nvarchar(50),
  [NewEmail] nvarchar(50),
  [Operations] nvarchar(50),
  [Date] datetime
)



create trigger trg_writeLogAfterEditEmail on Employees
after update
as
begin
	declare @oldEmail nvarchar(200) = (select [Email] from deleted)
	declare @fullName nvarchar(200) = (select [Name] from deleted)
	declare @newEmail nvarchar(200) = (select [Email] from inserted)
	insert into EmployeeLogs([EmployeeName],[OldEmail],[NewEmail],[Operations],[Date])
	values(@fullName,@oldEmail,@newEmail,'Update',GETDATE())

end

select * from Employees
select * from EmployeeLogs


update Employees
set [Email] = 'salam@gmail.com'
where [Id] = 6
