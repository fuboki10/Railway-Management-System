-------------Database creation-------------
--create database RailWaySystemDB
Create database RailWaySystemDB
GO
use RailWaySystemDB

------------Table Creation-----------------
CREATE TABLE [Station] (
	ID integer IDENTITY(1,1) NOT NULL,
	Name varchar(50) NOT NULL UNIQUE,
	City varchar(50) NOT NULL,
	[State] varchar(50) NOT NULL,
	Street integer NOT NULL,
  CONSTRAINT [PK_STATION] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

CREATE TABLE [Coach_Yard] (
	ID integer IDENTITY(1,1) NOT NULL,
	Station_ID integer NOT NULL,
	Size integer NOT NULL,
	foreign key(Station_ID) references Station on delete cascade on update cascade,
  CONSTRAINT [PK_COACH_YARD] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Repair_Yard] (
	ID integer IDENTITY(1,1) NOT NULL,
	Station_ID integer NOT NULL,
	Size integer NOT NULL,
	foreign key(Station_ID) references Station on delete cascade on update cascade,
  CONSTRAINT [PK_REPAIR_YARD] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

CREATE TABLE [Job] (
	ID int not null,
	Job_Description varchar(20) not null unique,
	primary key (ID)
)
GO


CREATE TABLE [Employee] (
	ID integer IDENTITY(1,1) NOT NULL,
	First_name varchar(50) NOT NULL,
	Last_name varchar(50) NOT NULL,
	Age integer NOT NULL,
	Birth_Date date NOT NULL,
	Salary integer NOT NULL,
	Working_Hours integer NOT NULL,
	JobID   INT NOT NULL,
	StationID int,
	FOREIGN KEY (StationID) REFERENCES Station on delete set null on update cascade,
	FOREIGN KEY (JobID) REFERENCES Job,
  CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

CREATE TABLE [USER] (
	ID integer IDENTITY(1,1) NOT NULL,
	Username varchar(20) COLLATE Latin1_General_CS_AS NOT NULL UNIQUE,
	PasswordHash BINARY(64) NOT NULL,
	EmployeeID INT,
	IsAdmin BIT,
	Salt UNIQUEIDENTIFIER,
	FOREIGN KEY(EmployeeID) REFERENCES [Employee] on delete cascade on update cascade,
	CONSTRAINT [USER_CHECK] check ((IsAdmin = 1 and EmployeeID is null) or (IsAdmin = 0 and EmployeeID is not null)),
  CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
GO


-- As it can't accept dup nulls 
CREATE UNIQUE NONCLUSTERED INDEX EmployeeID_UNQUE
ON dbo.[USER](EmployeeID)
WHERE EmployeeID IS NOT NULL;
go

CREATE TABLE [Route] (
	Source_ID integer NOT NULL,
	Destination_ID integer NOT NULL,
	Distance integer NOT NULL,
	foreign key(Source_ID) references Station(ID) on delete cascade on update cascade,
	foreign key(Destination_ID) references Station(ID) on delete no action on update no action,
	CONSTRAINT [RouteCheck] CHECK([Destination_ID] != [Source_ID]),
  CONSTRAINT [PK_ROUTE] PRIMARY KEY CLUSTERED
  (
  [Source_ID] ASC,
  [Destination_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Employee_Contact] (
	Employee_ID integer NOT NULL,
	Email varchar(50) UNIQUE,
	City varchar(50) NOT NULL,
	State varchar(50) NOT NULL,
	Street varchar(50) NOT NULL,
	foreign key(Employee_ID) references Employee on update cascade on delete cascade,
  CONSTRAINT [PK_EMPLOYEE_CONTACT] PRIMARY KEY CLUSTERED
  (
  [Employee_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Employee_Phone] (
	Employee_ID integer NOT NULL,
	Code integer NOT NULL,
	Number integer NOT NULL,
	foreign key(Employee_ID) references Employee(ID) on delete cascade on update cascade,
  CONSTRAINT [PK_EMPLOYEE_PHONE] PRIMARY KEY CLUSTERED
  (
  [Employee_ID] ASC,
  [Code] ASC,
  [Number] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Passenger] (
	ID integer IDENTITY(1,1) NOT NULL,
	First_name varchar(50) NOT NULL,
	Last_name varchar(50) NOT NULL,
	unique(First_name, Last_name),
  CONSTRAINT [PK_PASSENGER] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Passenger_Contact] (
	Passenger_ID integer NOT NULL,
	Email varchar(50) NOT NULL UNIQUE,
	City varchar(50) NOT NULL,
	[State] varchar(50) NOT NULL,
	Street varchar(50) NOT NULL,
	foreign key(Passenger_ID) references Passenger(ID) on delete cascade on update cascade,
  CONSTRAINT [PK_PASSENGER_CONTACT] PRIMARY KEY CLUSTERED
  (
  [Passenger_ID] ASC,
  [Email] ASC,
  [City] ASC,
  [State] ASC,
  [Street] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
GO

CREATE TABLE [Passenger_Phone] (
	Passenger_ID integer NOT NULL,
	Code integer NOT NULL,
	Number integer NOT NULL,
	foreign key(Passenger_ID) references Passenger(ID) on delete cascade on update cascade,
  CONSTRAINT [PK_PASSENGER_PHONE] PRIMARY KEY CLUSTERED
  (
  [Passenger_ID] ASC,
  [Code] ASC,
  [Number] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

CREATE TABLE [Train] (
	ID integer IDENTITY(1,1) NOT NULL,
	Model varchar(50) NOT NULL,
	[Status] BIT NOT NULL,   -- 0 Needs Fixing
	Color varchar(50) NOT NULL,
	No_Seats integer NOT NULL,
	Speed integer NOT NULL,
	No_Cars integer NOT NULL,
	[Date] date NOT NULL,
	Driver_ID integer UNIQUE,
	Repair_Yard_ID integer,
	Coach_Yard_ID integer,
	BoughtByID int,                    -- Manager ID --
	foreign key(Repair_Yard_ID) references Repair_Yard(ID),
	foreign key(Coach_Yard_ID) references Coach_Yard(ID),
	foreign key(BoughtByID) references Employee(ID),  
	foreign key(Driver_ID) references Employee(ID),
	CONSTRAINT [TrainCheck] check(
		(Driver_ID is not null and Repair_Yard_ID is null and Coach_Yard_ID is null) or
		(Driver_ID is null and Repair_Yard_ID is not null and Coach_Yard_ID is null) or
		(Driver_ID is null and Repair_Yard_ID is null and Coach_Yard_ID is not null)
	),
  CONSTRAINT [PK_TRAIN] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

CREATE TABLE [Trip] (
	ID integer IDENTITY(1,1) NOT NULL,
	Dept_Time date NOT NULL,
	Arr_Time date NOT NULL,
	[Type] integer NOT NULL,
	Source_ID integer NOT NULL,
	Destintaion_ID integer NOT NULL,
	Train_ID integer NOT NULL,
	StManager_ID integer,
	foreign key(Train_ID) references Train on delete cascade on update cascade,
	foreign key(StManager_ID) references Employee on delete set null on update cascade,
	foreign key(Source_ID, Destintaion_ID) references [Route],
    CONSTRAINT [PK_TRIP] PRIMARY KEY CLUSTERED
    (
    [ID] ASC
    ) WITH (IGNORE_DUP_KEY = OFF)
)
GO


CREATE TABLE [Ticket] (
	ID integer IDENTITY(1,1) NOT NULL,
	Class char(1) NOT NULL,
	Price integer NOT NULL,
	[Date] date,
	Booking_Clerk_ID integer,
	Passenger_ID integer,
	Trip_ID integer NOT NULL,
	foreign key(Booking_Clerk_ID) references Employee(ID) on delete set null on update cascade,
	foreign key(Passenger_ID) references Passenger(ID) on delete set null on update cascade,
	foreign key(Trip_ID) references Trip(ID) on delete no action on update no action,
  CONSTRAINT [PK_TICKET] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

CREATE TABLE [Subscription] (
	ID integer IDENTITY(1,1) NOT NULL,
	Fees integer NOT NULL,
	Class varchar(1) NOT NULL,
	No_Trips integer NOT NULL,
  CONSTRAINT [PK_SUBSCRIPTION] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Passenger_Subscription] (
	Passenger_ID integer NOT NULL,
	Subscription_ID integer NOT NULL,
	Exp_Date date NOT NULL,
	foreign key(Passenger_ID) references Passenger on delete cascade on update cascade,
	foreign key(Subscription_ID) references Subscription on delete cascade on update cascade,
  CONSTRAINT [PK_PASSENGER_SUBSCRIPTION] PRIMARY KEY CLUSTERED
  (
  [Passenger_ID] ASC,
  [Subscription_ID] ASC,
  [Exp_Date] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO


--- Insert -----


