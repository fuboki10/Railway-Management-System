-------------Database creation-------------
--create database RailWaySystemDB
Create database RailWaySystemDB
GO
use RailWaySystemDB

------------Table Creation-----------------
CREATE TABLE [USER] (
	ID integer IDENTITY(1,1) NOT NULL,
	Username varchar(20) COLLATE Latin1_General_CS_AS NOT NULL UNIQUE,
	PasswordHash BINARY(64) NOT NULL,
  CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
GO

GO
CREATE TABLE [Employee] (
	ID integer IDENTITY(1,1) NOT NULL,
	First_name varchar(50) NOT NULL,
	Last_name varchar(50) NOT NULL,
	Age integer NOT NULL,
	Birth_Date date NOT NULL,
	Salary integer NOT NULL,
	Working_Hours integer NOT NULL,
  CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Booking Clerk] (
	ID integer NOT NULL UNIQUE,
	User_ID integer UNIQUE,
  CONSTRAINT [PK_BOOKING CLERK] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Driver] (
  ID integer NOT NULL UNIQUE,
  CONSTRAINT [PK_DRIVER] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Manager] (
	ID integer NOT NULL UNIQUE,
	User_ID integer UNIQUE,
  CONSTRAINT [PK_MANAGER] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Station Manager] (
	ID integer NOT NULL UNIQUE,
	User_ID integer UNIQUE,
  CONSTRAINT [PK_STATION MANAGER] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Station] (
	ID integer IDENTITY(1,1) NOT NULL,
	Name varchar(50) NOT NULL UNIQUE,
	City varchar(50) NOT NULL,
	State varchar(50) NOT NULL,
	Street integer NOT NULL,
  CONSTRAINT [PK_STATION] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Route] (
	Source_ID integer NOT NULL,
	Destination_ID integer NOT NULL,
	Distance integer NOT NULL,
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
  CONSTRAINT [PK_PASSENGER] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Passenger_Contact] (
	Passenger_ID integer NOT NULL,
	Email varchar(50) UNIQUE,
	City varchar(50) NOT NULL,
	[State] varchar(50) NOT NULL,
	Street varchar(50) NOT NULL,
  CONSTRAINT [PK_PASSENGER_CONTACT] PRIMARY KEY CLUSTERED
  (
  [Passenger_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Passenger_Phone] (
	Passenger_ID integer NOT NULL,
	Code integer NOT NULL,
	Number integer NOT NULL,
  CONSTRAINT [PK_PASSENGER_PHONE] PRIMARY KEY CLUSTERED
  (
  [Passenger_ID] ASC,
  [Code] ASC,
  [Number] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Ticket] (
	ID integer IDENTITY(1,1) NOT NULL,
	Class varchar(1) NOT NULL,
	Price integer NOT NULL,
	[Date] date NOT NULL,
	Booking_Clerk_ID integer NOT NULL,
	Passenger_ID integer NOT NULL,
	Trip_ID integer NOT NULL,
  CONSTRAINT [PK_TICKET] PRIMARY KEY CLUSTERED
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
	StManager_ID integer NOT NULL,
  CONSTRAINT [PK_TRIP] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Train] (
	ID integer IDENTITY(1,1) NOT NULL,
	Model varchar(50) NOT NULL,
	[Status] BIT NOT NULL,
	Color varchar(50) NOT NULL,
	No_Seats integer NOT NULL,
	Speed integer NOT NULL,
	No_Cars integer NOT NULL,
	[Date] date NOT NULL,
	Driver_ID integer NOT NULL UNIQUE,
	Repair_Yard_ID integer NOT NULL,
	Coach_Yard_ID integer NOT NULL,
  CONSTRAINT [PK_TRAIN] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Coach_Yard] (
	ID integer IDENTITY(1,1) NOT NULL,
	Station_ID integer NOT NULL,
	Size integer NOT NULL,
	No_Trains integer NOT NULL,
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
	No_Trains integer NOT NULL,
  CONSTRAINT [PK_REPAIR_YARD] PRIMARY KEY CLUSTERED
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
  CONSTRAINT [PK_PASSENGER_SUBSCRIPTION] PRIMARY KEY CLUSTERED
  (
  [Passenger_ID] ASC,
  [Subscription_ID] ASC,
  [Exp_Date] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Work_In] (
	Employee_ID integer NOT NULL,
	Station_ID integer NOT NULL,
  CONSTRAINT [PK_WORK_IN] PRIMARY KEY CLUSTERED
  (
  [Employee_ID] ASC,
  [Station_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Bought_By] (
	Manager_ID integer NOT NULL,
	Train_ID integer NOT NULL,
  CONSTRAINT [PK_BOUGHT_BY] PRIMARY KEY CLUSTERED
  (
  [Manager_ID] ASC,
  [Train_ID] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO


ALTER TABLE [Booking Clerk] WITH CHECK ADD CONSTRAINT [Booking Clerk_Update_fk0] FOREIGN KEY ([ID]) REFERENCES [Employee]([ID])
ON UPDATE no action 
GO
ALTER TABLE [Booking Clerk] CHECK CONSTRAINT [Booking Clerk_Update_fk0]
GO
ALTER TABLE [Booking Clerk] WITH CHECK ADD CONSTRAINT [Booking Clerk_Update_fk1] FOREIGN KEY ([User_ID]) REFERENCES [USER]([ID])
ON UPDATE no action 
GO
ALTER TABLE [Booking Clerk] CHECK CONSTRAINT [Booking Clerk_Update_fk1]
GO

ALTER TABLE [Driver] WITH CHECK ADD CONSTRAINT [Driver_Update_fk0] FOREIGN KEY ([ID]) REFERENCES [Employee]([ID])
ON UPDATE no action		
GO
ALTER TABLE [Driver] CHECK CONSTRAINT [Driver_Update_fk0]
GO

ALTER TABLE [Manager] WITH CHECK ADD CONSTRAINT [Manager_Update_fk0] FOREIGN KEY ([ID]) REFERENCES [Employee]([ID])
ON UPDATE no action
GO
ALTER TABLE [Manager] CHECK CONSTRAINT [Manager_Update_fk0]
GO
ALTER TABLE [Manager] WITH CHECK ADD CONSTRAINT [Manager_Update_fk1] FOREIGN KEY ([User_ID]) REFERENCES [USER]([ID])
ON UPDATE no action
GO
ALTER TABLE [Manager] CHECK CONSTRAINT [Manager_Update_fk1]
GO

ALTER TABLE [Station Manager] WITH CHECK ADD CONSTRAINT [Station Manager_Update_fk0] FOREIGN KEY ([ID]) REFERENCES [Employee]([ID])
ON UPDATE no action
GO
ALTER TABLE [Station Manager] CHECK CONSTRAINT [Station Manager_Update_fk0]
GO
ALTER TABLE [Station Manager] WITH CHECK ADD CONSTRAINT [Station Manager_Update_fk1] FOREIGN KEY ([User_ID]) REFERENCES [USER]([ID])
ON UPDATE no action
GO
ALTER TABLE [Station Manager] CHECK CONSTRAINT [Station Manager_Update_fk1]
GO

ALTER TABLE [Route] WITH CHECK ADD CONSTRAINT [Route_Update_fk0] FOREIGN KEY ([Source_ID]) REFERENCES [Station]([ID])
ON UPDATE no action
GO
ALTER TABLE [Route] CHECK CONSTRAINT [Route_Update_fk0]
GO
ALTER TABLE [Route] WITH CHECK ADD CONSTRAINT [Route_Update_fk1] FOREIGN KEY ([Destination_ID]) REFERENCES [Station]([ID])
ON UPDATE no action
GO
ALTER TABLE [Route] CHECK CONSTRAINT [Route_Update_fk1]
GO
ALTER TABLE [Route]
   ADD CONSTRAINT [RouteCheck] CHECK([Destination_ID] != [Source_ID]);
 GO
ALTER TABLE [Employee_Contact] WITH CHECK ADD CONSTRAINT [Employee_Contact_Update_fk0] FOREIGN KEY ([Employee_ID]) REFERENCES [Employee]([ID])
ON UPDATE no action
GO
ALTER TABLE [Employee_Contact] CHECK CONSTRAINT [Employee_Contact_Update_fk0]
GO

ALTER TABLE [Employee_Phone] WITH CHECK ADD CONSTRAINT [Employee_Phone_Update_fk0] FOREIGN KEY ([Employee_ID]) REFERENCES [Employee_Contact]([Employee_ID])
ON UPDATE no action
GO
ALTER TABLE [Employee_Phone] CHECK CONSTRAINT [Employee_Phone_Update_fk0]
GO


ALTER TABLE [Passenger_Contact] WITH CHECK ADD CONSTRAINT [Passenger_Contact_Update_fk0] FOREIGN KEY ([Passenger_ID]) REFERENCES [Passenger]([ID])
ON UPDATE no action
GO
ALTER TABLE [Passenger_Contact] CHECK CONSTRAINT [Passenger_Contact_Update_fk0]
GO

ALTER TABLE [Passenger_Phone] WITH CHECK ADD CONSTRAINT [Passenger_Phone_Update_fk0] FOREIGN KEY ([Passenger_ID]) REFERENCES [Passenger_Contact]([Passenger_ID])
ON UPDATE no action
GO
ALTER TABLE [Passenger_Phone] CHECK CONSTRAINT [Passenger_Phone_Update_fk0]
GO

ALTER TABLE [Ticket] WITH CHECK ADD CONSTRAINT [Ticket_Update_fk0] FOREIGN KEY ([Booking_Clerk_ID]) REFERENCES [Booking Clerk]([ID])
ON UPDATE no action
GO
ALTER TABLE [Ticket] CHECK CONSTRAINT [Ticket_Update_fk0]
GO
ALTER TABLE [Ticket] WITH CHECK ADD CONSTRAINT [Ticket_Update_fk1] FOREIGN KEY ([Passenger_ID]) REFERENCES [Passenger]([ID])
ON UPDATE no action
GO
ALTER TABLE [Ticket] CHECK CONSTRAINT [Ticket_Update_fk1]
GO
ALTER TABLE [Ticket] WITH CHECK ADD CONSTRAINT [Ticket_Update_fk2] FOREIGN KEY ([Trip_ID]) REFERENCES [Trip]([ID])
ON UPDATE no action
GO
ALTER TABLE [Ticket] CHECK CONSTRAINT [Ticket_Update_fk2]
GO

ALTER TABLE [Trip] WITH CHECK ADD CONSTRAINT [Trip_Update_fk0] FOREIGN KEY ([Source_ID]) REFERENCES [Station]([ID])
ON UPDATE no action
GO
ALTER TABLE [Trip] CHECK CONSTRAINT [Trip_Update_fk0]
GO
ALTER TABLE [Trip] WITH CHECK ADD CONSTRAINT [Trip_Update_fk1] FOREIGN KEY ([Destintaion_ID]) REFERENCES [Station]([ID])
ON UPDATE no action
GO
ALTER TABLE [Trip] CHECK CONSTRAINT [Trip_Update_fk1]
GO
ALTER TABLE [Trip] WITH CHECK ADD CONSTRAINT [Trip_Update_fk2] FOREIGN KEY ([Train_ID]) REFERENCES [Train]([ID])
ON UPDATE no action
GO
ALTER TABLE [Trip] CHECK CONSTRAINT [Trip_Update_fk2]
GO
ALTER TABLE [Trip] WITH CHECK ADD CONSTRAINT [Trip_Update_fk3] FOREIGN KEY ([StManager_ID]) REFERENCES [Station Manager]([ID])
ON UPDATE no action 
GO
ALTER TABLE [Trip] CHECK CONSTRAINT [Trip_Update_fk3]
GO

ALTER TABLE [Train] WITH CHECK ADD CONSTRAINT [Train_Update_fk0] FOREIGN KEY ([Driver_ID]) REFERENCES [Driver]([ID])
ON UPDATE Cascade
GO

ALTER TABLE [Train] CHECK CONSTRAINT [Train_Update_fk0]
GO
ALTER TABLE [Train] WITH CHECK ADD CONSTRAINT [Train_Update_fk1] FOREIGN KEY ([Repair_Yard_ID]) REFERENCES [Repair_Yard]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Train] CHECK CONSTRAINT [Train_Update_fk1]
GO
ALTER TABLE [Train] WITH CHECK ADD CONSTRAINT [Train_Update_fk2] FOREIGN KEY ([Coach_Yard_ID]) REFERENCES [Coach_Yard]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Train] CHECK CONSTRAINT [Train_Update_fk2]
GO

ALTER TABLE [Coach_Yard] WITH CHECK ADD CONSTRAINT [Coach_Yard_Update_fk0] FOREIGN KEY ([Station_ID]) REFERENCES [Station]([ID])
ON UPDATE no action
GO
ALTER TABLE [Coach_Yard] CHECK CONSTRAINT [Coach_Yard_Update_fk0]
GO

ALTER TABLE [Repair_Yard] WITH CHECK ADD CONSTRAINT [Repair_Yard_Update_fk0] FOREIGN KEY ([Station_ID]) REFERENCES [Station]([ID])
ON UPDATE no action
GO
ALTER TABLE [Repair_Yard] CHECK CONSTRAINT [Repair_Yard_Update_fk0]
GO


ALTER TABLE [Passenger_Subscription] WITH CHECK ADD CONSTRAINT [Passenger_Subscription_Update_fk0] FOREIGN KEY ([Passenger_ID]) REFERENCES [Passenger]([ID])
ON UPDATE no action
GO
ALTER TABLE [Passenger_Subscription] CHECK CONSTRAINT [Passenger_Subscription_Update_fk0]
GO
ALTER TABLE [Passenger_Subscription] WITH CHECK ADD CONSTRAINT [Passenger_Subscription_Update_fk1] FOREIGN KEY ([Subscription_ID]) REFERENCES [Subscription]([ID])
ON UPDATE no action
GO
ALTER TABLE [Passenger_Subscription] CHECK CONSTRAINT [Passenger_Subscription_Update_fk1]
GO

ALTER TABLE [Work_In] WITH CHECK ADD CONSTRAINT [Work_In_Update_fk0] FOREIGN KEY ([Employee_ID]) REFERENCES [Employee]([ID])
ON UPDATE no action
GO
ALTER TABLE [Work_In] CHECK CONSTRAINT [Work_In_Update_fk0]
GO
ALTER TABLE [Work_In] WITH CHECK ADD CONSTRAINT [Work_In_Update_fk1] FOREIGN KEY ([Station_ID]) REFERENCES [Station]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Work_In] CHECK CONSTRAINT [Work_In_Update_fk1]
GO

ALTER TABLE [Bought_By] WITH CHECK ADD CONSTRAINT [Bought_By_Update_fk0] FOREIGN KEY ([Manager_ID]) REFERENCES [Manager]([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Bought_By] CHECK CONSTRAINT [Bought_By_Update_fk0]
GO
ALTER TABLE [Bought_By] WITH CHECK ADD CONSTRAINT [Bought_By_Update_fk1] FOREIGN KEY ([Train_ID]) REFERENCES [Train]([ID])
ON UPDATE no action
GO
ALTER TABLE [Bought_By] CHECK CONSTRAINT [Bought_By_Update_fk1]
GO

ALTER TABLE [Booking Clerk] WITH CHECK ADD CONSTRAINT [Booking Clerk_Delete_fk0] FOREIGN KEY ([ID]) REFERENCES [Employee]([ID])
ON DELETE cascade  
GO
ALTER TABLE [Booking Clerk] CHECK CONSTRAINT [Booking Clerk_Delete_fk0]
GO
ALTER TABLE [Booking Clerk] WITH CHECK ADD CONSTRAINT [Booking Clerk_Delete_fk1] FOREIGN KEY ([User_ID]) REFERENCES [USER]([ID])
ON DELETE   CASCADE
GO
ALTER TABLE [Booking Clerk] CHECK CONSTRAINT [Booking Clerk_Delete_fk1]
GO

ALTER TABLE [Driver] WITH CHECK ADD CONSTRAINT [Driver_Delete_fk0] FOREIGN KEY ([ID]) REFERENCES [Employee]([ID])
ON DELETE CASCADE	
GO
ALTER TABLE [Driver] CHECK CONSTRAINT [Driver_Delete_fk0]
GO

ALTER TABLE [Manager] WITH CHECK ADD CONSTRAINT [Manager_Delete_fk0] FOREIGN KEY ([ID]) REFERENCES [Employee]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Manager] CHECK CONSTRAINT [Manager_Delete_fk0]
GO
ALTER TABLE [Manager] WITH CHECK ADD CONSTRAINT [Manager_Delete_fk1] FOREIGN KEY ([User_ID]) REFERENCES [USER]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Manager] CHECK CONSTRAINT [Manager_Delete_fk1]
GO

ALTER TABLE [Station Manager] WITH CHECK ADD CONSTRAINT [Station Manager_Delete_fk0] FOREIGN KEY ([ID]) REFERENCES [Employee]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Station Manager] CHECK CONSTRAINT [Station Manager_Delete_fk0]
GO
ALTER TABLE [Station Manager] WITH CHECK ADD CONSTRAINT [Station Manager_Delete_fk1] FOREIGN KEY ([User_ID]) REFERENCES [USER]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Station Manager] CHECK CONSTRAINT [Station Manager_Delete_fk1]
GO


ALTER TABLE [Route] WITH CHECK ADD CONSTRAINT [Route_Delete_fk0] FOREIGN KEY ([Source_ID]) REFERENCES [Station]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Route] CHECK CONSTRAINT [Route_Delete_fk0]
GO
ALTER TABLE [Route] WITH CHECK ADD CONSTRAINT [Route_Delete_fk1] FOREIGN KEY ([Destination_ID]) REFERENCES [Station]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Route] CHECK CONSTRAINT [Route_Delete_fk1]
GO

ALTER TABLE [Employee_Contact] WITH CHECK ADD CONSTRAINT [Employee_Contact_Delete_fk0] FOREIGN KEY ([Employee_ID]) REFERENCES [Employee]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Employee_Contact] CHECK CONSTRAINT [Employee_Contact_Delete_fk0]
GO

ALTER TABLE [Employee_Phone] WITH CHECK ADD CONSTRAINT [Employee_Phone_Delete_fk0] FOREIGN KEY ([Employee_ID]) REFERENCES [Employee_Contact]([Employee_ID])
ON DELETE CASCADE
GO
ALTER TABLE [Employee_Phone] CHECK CONSTRAINT [Employee_Phone_Delete_fk0]
GO


ALTER TABLE [Passenger_Contact] WITH CHECK ADD CONSTRAINT [Passenger_Contact_Delete_fk0] FOREIGN KEY ([Passenger_ID]) REFERENCES [Passenger]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Passenger_Contact] CHECK CONSTRAINT [Passenger_Contact_Delete_fk0]
GO

ALTER TABLE [Passenger_Phone] WITH CHECK ADD CONSTRAINT [Passenger_Phone_Delete_fk0] FOREIGN KEY ([Passenger_ID]) REFERENCES [Passenger_Contact]([Passenger_ID])
ON DELETE CASCADE
GO
ALTER TABLE [Passenger_Phone] CHECK CONSTRAINT [Passenger_Phone_Delete_fk0]
GO

ALTER TABLE [Ticket] WITH CHECK ADD CONSTRAINT [Ticket_Delete_fk0] FOREIGN KEY ([Booking_Clerk_ID]) REFERENCES [Booking Clerk]([ID])
ON DELETE SET NULL
GO
ALTER TABLE [Ticket] CHECK CONSTRAINT [Ticket_Delete_fk0]
GO
ALTER TABLE [Ticket] WITH CHECK ADD CONSTRAINT [Ticket_Delete_fk1] FOREIGN KEY ([Passenger_ID]) REFERENCES [Passenger]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Ticket] CHECK CONSTRAINT [Ticket_Delete_fk1]
GO
ALTER TABLE [Ticket] WITH CHECK ADD CONSTRAINT [Ticket_Delete_fk2] FOREIGN KEY ([Trip_ID]) REFERENCES [Trip]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Ticket] CHECK CONSTRAINT [Ticket_Delete_fk2]
GO

ALTER TABLE [Trip] WITH CHECK ADD CONSTRAINT [Trip_Delete_fk0] FOREIGN KEY ([Source_ID]) REFERENCES [Station]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Trip] CHECK CONSTRAINT [Trip_Delete_fk0]
GO
ALTER TABLE [Trip] WITH CHECK ADD CONSTRAINT [Trip_Delete_fk1] FOREIGN KEY ([Destintaion_ID]) REFERENCES [Station]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Trip] CHECK CONSTRAINT [Trip_Delete_fk1]
GO
ALTER TABLE [Trip] WITH CHECK ADD CONSTRAINT [Trip_Delete_fk2] FOREIGN KEY ([Train_ID]) REFERENCES [Train]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Trip] CHECK CONSTRAINT [Trip_Delete_fk2]
GO
ALTER TABLE [Trip] WITH CHECK ADD CONSTRAINT [Trip_Delete_fk3] FOREIGN KEY ([StManager_ID]) REFERENCES [Station Manager]([ID])
ON DELETE SET NULL  
GO
ALTER TABLE [Trip] CHECK CONSTRAINT [Trip_Delete_fk3]
GO

ALTER TABLE [Train] WITH CHECK ADD CONSTRAINT [Train_Delete_fk0] FOREIGN KEY ([Driver_ID]) REFERENCES [Driver]([ID])
ON DELETE SET NULL
GO

ALTER TABLE [Train] CHECK CONSTRAINT [Train_Delete_fk0]
GO
ALTER TABLE [Train] WITH CHECK ADD CONSTRAINT [Train_Delete_fk1] FOREIGN KEY ([Repair_Yard_ID]) REFERENCES [Repair_Yard]([ID])
ON DELETE no action
GO
ALTER TABLE [Train] CHECK CONSTRAINT [Train_Delete_fk1]
GO
ALTER TABLE [Train] WITH CHECK ADD CONSTRAINT [Train_Delete_fk2] FOREIGN KEY ([Coach_Yard_ID]) REFERENCES [Coach_Yard]([ID])
ON DELETE no action -- review 
GO
ALTER TABLE [Train] CHECK CONSTRAINT [Train_Delete_fk2]
GO

ALTER TABLE [Coach_Yard] WITH CHECK ADD CONSTRAINT [Coach_Yard_Delete_fk0] FOREIGN KEY ([Station_ID]) REFERENCES [Station]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Coach_Yard] CHECK CONSTRAINT [Coach_Yard_Delete_fk0]
GO

ALTER TABLE [Repair_Yard] WITH CHECK ADD CONSTRAINT [Repair_Yard_Delete_fk0] FOREIGN KEY ([Station_ID]) REFERENCES [Station]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Repair_Yard] CHECK CONSTRAINT [Repair_Yard_Delete_fk0]
GO


ALTER TABLE [Passenger_Subscription] WITH CHECK ADD CONSTRAINT [Passenger_Subscription_Delete_fk0] FOREIGN KEY ([Passenger_ID]) REFERENCES [Passenger]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Passenger_Subscription] CHECK CONSTRAINT [Passenger_Subscription_Delete_fk0]
GO
ALTER TABLE [Passenger_Subscription] WITH CHECK ADD CONSTRAINT [Passenger_Subscription_Delete_fk1] FOREIGN KEY ([Subscription_ID]) REFERENCES [Subscription]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Passenger_Subscription] CHECK CONSTRAINT [Passenger_Subscription_Delete_fk1]
GO

ALTER TABLE [Work_In] WITH CHECK ADD CONSTRAINT [Work_In_Delete_fk0] FOREIGN KEY ([Employee_ID]) REFERENCES [Employee]([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Work_In] CHECK CONSTRAINT [Work_In_Delete_fk0]
GO
ALTER TABLE [Work_In] WITH CHECK ADD CONSTRAINT [Work_In_Delete_fk1] FOREIGN KEY ([Station_ID]) REFERENCES [Station]([ID])
ON DELETE SET NULL --review 
GO
ALTER TABLE [Work_In] CHECK CONSTRAINT [Work_In_Delete_fk1]
GO

ALTER TABLE [Bought_By] WITH CHECK ADD CONSTRAINT [Bought_By_Delete_fk0] FOREIGN KEY ([Manager_ID]) REFERENCES [Manager]([ID])
ON DELETE SET NULL --review
GO
ALTER TABLE [Bought_By] CHECK CONSTRAINT [Bought_By_Delete_fk0]
GO
ALTER TABLE [Bought_By] WITH CHECK ADD CONSTRAINT [Bought_By_Delete_fk1] FOREIGN KEY ([Train_ID]) REFERENCES [Train]([ID])
ON DELETE no action--review
GO
ALTER TABLE [Bought_By] CHECK CONSTRAINT [Bought_By_Delete_fk1]
GO
--For Hashing--
ALTER TABLE [User] ADD Salt UNIQUEIDENTIFIER 
GO
