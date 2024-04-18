
create table Countries(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50)
)

select * from Countries

create table Cities(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	[CountryId] int,
	foreign key (CountryId) references Countries(Id)
)

select * from Cities

create table Students(
	[Id] int primary key identity(1,1),
	[Fullname] nvarchar(100) not null,
	[Age] int,
	[Email] nvarchar(100),
	[CityId] int,

	foreign key (CityId) references Cities(Id)
)

select * from Students

create table Teachers(
	[Id] int primary key identity(1,1),
	[Fullname] nvarchar(100),
	[Salary] decimal,
	[CityId] int,
	foreign key (CityId) references Cities(Id)
)

select * from Teachers


create table Rooms(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	[Capacity] int
)

select * from Rooms


create table Groups(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	[RoomId] int,
	
	foreign key (RoomId) references Rooms(Id)
)

select * from Groups


create table StudentGroups(
	[Id] int primary key identity(1,1),
	[GroupId] int,
	[StudentId] int,
	
	foreign key (GroupId) references Groups(Id),
	foreign key (StudentId) references Students(Id)
)


select * from StudentGroups


create table TeacherGroups(
	[Id] int primary key identity(1,1),
	[TeacherId] int,
	[GroupId] int,
	
	foreign key (TeacherId) references Teachers(Id),
	foreign key (GroupId) references Groups(Id)
)


select * from TeacherGroups

create table StaffMembers(
	[Id] int primary key identity(1,1),
	[Name] nvarchar(50),
	[RoomId] int,
	[CityId] int,
	
	foreign key (RoomId) references Rooms(Id),
	foreign key (CityId) references Cities(Id)
)

select * from StaffMembers






select st.Fullname as 'Student fullname', st.age as 'Student age', st.Email as 'Student email', ct.Name as 'City', co.Name as 'Country' from Students st
join Cities ct
on ct.Id = st.CityId
join Countries co
on ct.CountryId = co.Id
