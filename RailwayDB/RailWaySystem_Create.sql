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
	Code varchar(10) NOT NULL,
	Number varchar(15) NOT NULL,
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
	Driver_ID integer,
	Repair_Yard_ID integer,
	Coach_Yard_ID integer,
	BoughtByID int,                    -- Manager ID --
	foreign key(Repair_Yard_ID) references Repair_Yard(ID),
	foreign key(Coach_Yard_ID) references Coach_Yard(ID),
	foreign key(BoughtByID) references Employee(ID) on delete set null,  
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

-- As it can't accept dup nulls 
CREATE UNIQUE NONCLUSTERED INDEX Driver_ID_UNQUE
ON dbo.Train(Driver_ID)
WHERE Driver_ID IS NOT NULL;
go

CREATE TABLE [Trip] (
	ID integer IDENTITY(1,1) NOT NULL,
	Dept_Time datetime NOT NULL,
	Arr_Time datetime NOT NULL,
	[Type] integer NOT NULL,
	Source_ID integer NOT NULL,
	Destintaion_ID integer NOT NULL,
	Train_ID integer NOT NULL,
	StManager_ID integer,
	foreign key(Train_ID) references Train on delete cascade on update cascade,
	foreign key(StManager_ID) references Employee on delete no action on update cascade,
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
	foreign key(Trip_ID) references Trip(ID) on delete cascade,
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
	unique(Class, No_Trips),
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


-----proc------


use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- Create date: 7/12/2019
-- Description:	Update the name of the station with the provided id
-- =============================================
CREATE PROCEDURE UpdateStation 
	-- Add the parameters for the stored procedure here
	@old_name varchar(50),
	@new_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Station set Name = @new_name where Name = @old_name
	 return @@rowcount 
	 
END
GO

Use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE UpdateSalary 
	@id int,
	@sal int 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Employee 
	SET Salary = @sal
	WHERE ID = @id

END
GO

Use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE getAllEmps 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT E.ID as 'ID', First_name as 'First Name', Last_name as 'Last Name',
	 CAST(Birth_Date AS varchar(10)) AS 'Birth Date',
	 CAST(DATEDIFF(DD, Birth_Date, GETDATE()) / 365.25 AS INT) AS 'Age', 
	 Salary, Working_Hours, Job_Description AS 'Job', S.Name AS 'Station'  
	FROM (Employee E INNER JOIN Job J ON E.JobID=J.ID) INNER JOIN Station S ON S.ID=E.StationID 
END
GO

use RailWaySystemDB
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE RemoveTrain
	-- Add the parameters for the stored procedure here
	@ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Train WHERE ID=@ID 
END
GO


USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new clerk into the DB
Create Procedure [dbo].[Remove_Subscription]

	@Subscription_ID int
As
Begin

	
	-- Inserting into the Trip table
	Delete from [Subscription] where Subscription.ID=@Subscription_ID
End

GO

use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- Create date: 7/12/2019
-- Description:	Remove the route joining the two provided stations
-- =============================================
CREATE PROCEDURE RemoveRoute 
	-- Add the parameters for the stored procedure here
	@source_id int,
	@dest_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Delete from [Route] where Source_ID = @source_id and Destination_ID = @dest_id
	Delete from Trip where Source_ID=@source_id and Destintaion_ID=@dest_id
	
END
GO


use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- Create date: 7/12/2019
-- Description:	Removes a repair yard
-- =============================================
CREATE PROCEDURE	RemoveRepairYard 
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Repair_Yard where ID = @id

	return @@rowcount
END
GO

use RailWaySystemDB
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  RemoveCoachYard 
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Coach_Yard where ID = @id

	return @@rowcount
END
GO

use RailWaySystemDB
go
use [RailWaySystemDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 11/29/2019
-- Description:	Login
-- =============================================
CREATE PROCEDURE [Login]
    @UserName VARCHAR(20),
    @Password VARCHAR(20),
    @responseMessage VARCHAR(250)='' OUTPUT
AS
BEGIN

    SET NOCOUNT ON

    DECLARE @ID INT

    IF EXISTS (SELECT ID FROM [USER] WHERE Username=@UserName)
    BEGIN
        SET @ID=(SELECT ID FROM [USER] WHERE Username=@UserName AND PasswordHash=HASHBYTES('SHA2_512', @Password+CAST(Salt AS VARCHAR(36))))

       IF(@ID IS NULL)
           SET @responseMessage='Incorrect password'
       ELSE 
           SET @responseMessage='User successfully logged in'
    END
    ELSE
       SET @responseMessage='Invalid login'
	
	SELECT @responseMessage as response, @ID as ID

END
	

/****** Object:  StoredProcedure [dbo].[InsertUser]    Script Date: 12/13/2019 5:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new User into the DB
CREATE PROCEDURE [dbo].[InsertUser]
    @Username varchar(20), 
    @Password varchar(20),
	@EmployeeID int=null,
	@IsAdmin BIT=null,
    @responseMessage varchar(250)='' OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @salt UNIQUEIDENTIFIER=NEWID()
    BEGIN TRY

	-- Inserting The user into User table
        INSERT INTO dbo.[User] (Username, PasswordHash, EmployeeID, IsAdmin, Salt)
        VALUES(@Username, HASHBYTES('SHA2_512', @Password+CAST(@salt AS VARCHAR(36))), @EmployeeID, @IsAdmin, @salt)
		
		-- Displaying The status of the insertion
       SET @responseMessage='Success'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

	SELECT @responseMessage as response, @@identity as ID

	-- Returning The Id of the inserted user
END
go

use RailWaySystemDB
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		abdelrahman
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE InsertTrain
	-- Add the parameters for the stored procedure here
	@Model varchar(50),
	@Status BIT=1,   -- 0 Needs Fixing
	@Color varchar(50),
	@No_Seats integer,
	@Speed integer,
	@No_Cars integer,
	@Date date,
	@Driver_ID integer=null,
	@Repair_Yard_ID integer=null,
	@Coach_Yard_ID integer=null,
	@BoughtByID int=null         
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @NO_TRAINS INT = (SELECT COUNT(*) FROM Train WHERE Coach_Yard_ID=@Coach_Yard_ID)
	IF @NO_TRAINS < (SELECT Size FROM Coach_Yard WHERE ID=@Coach_Yard_ID)
	BEGIN
		INSERT INTO Train
		(Model, [Status], Color, No_Seats, Speed, No_Cars, [Date], Driver_ID, Repair_Yard_ID, Coach_Yard_ID, BoughtByID)
		VALUES
		(@Model, @Status, @Color, @No_Seats, @Speed, @No_Cars, @Date, @Driver_ID, @Repair_Yard_ID, @Coach_Yard_ID, @BoughtByID)
	END
	SELECT @@rowcount
END
GO
Use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE InsertStation
	@name varchar(50),
	@state varchar(50),
	@city varchar(50),
	@street int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Station
	values (@name, @city, @state, @street);

	return @@identity
	
END
GO

USE RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE InsertPassenger
	@fname varchar(50),
	@lname varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.


    insert into Passenger
	values(@fname, @lname);
	Select @@IDENTITY
END
GO

use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new employee into the Employee table
CREATE PROCEDURE InsertEmp 

	@fname varchar(50),
	@lname varchar(50),
	@bd date,
	@salary int,
	@working_hours int,
	@jobid int,
	@station_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Inserting the employee into Employee table
	Insert into Employee 
	values (@fname, @lname, @bd, @salary, @working_hours,@jobid, @station_id);

	-- Returning the id of the inserted employee
	return @@identity
END
GO

use RailWaySystemDB
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 12/4/2019
-- Description:	GetUsername
-- =============================================
CREATE PROCEDURE GetUsername
	-- Add the parameters for the stored procedure here
	@ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Username FROM [USER] WHERE ID=@ID
END
GO

use RailWaySystemDB
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
use RailWaySystemDB
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 12/9/2019
-- Description:	Get Employee Job
-- =============================================
CREATE PROCEDURE GetUserJob
	-- Add the parameters for the stored procedure here
	@UserID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF ((SELECT IsAdmin FROM [USER] WHERE ID=@UserID) = 1)
	BEGIN
		SELECT 'Admin'
	END
	ELSE
	BEGIN
		DECLARE @EmpID INT = (SELECT EmployeeID FROM [USER] WHERE ID=@UserID)
		DECLARE @JobID INT = (SELECT JobID FROM Employee WHERE ID=@EmpID)
		SELECT Job_Description FROM JOB WHERE ID=@JobID 
	END
END
GO

use RailWaySystemDB
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 14/12/2019
-- Description:	GetAllTrains
-- =============================================
CREATE PROCEDURE GetAllTrains	
	-- Add the parameters for the stored procedure here
	@StationID INT = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF (@StationID IS NOT NULL)
	BEGIN
		SELECT T.ID AS 'ID', Model, [Status], Color, No_Seats, Speed,
		No_Cars, CAST([Date] AS varchar(10)) AS 'Date', Driver_ID, Repair_Yard_ID, Coach_Yard_ID, BoughtByID 
		FROM 
		Train T
		WHERE 
		Driver_ID IS NULL AND 
		(EXISTS(SELECT * FROM Coach_Yard C WHERE C.ID=T.Coach_Yard_ID AND C.Station_ID=@StationID)
		OR
		EXISTS(SELECT * FROM Repair_Yard R WHERE R.ID=T.Repair_Yard_ID AND R.Station_ID=@StationID))
	END
	ELSE
		SELECT ID AS 'ID', Model, [Status], Color, No_Seats, Speed,
		No_Cars, CAST([Date] AS varchar(10)) AS 'Date', Driver_ID, Repair_Yard_ID, Coach_Yard_ID, BoughtByID FROM Train
END
GO


use RailWaySystemDB
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 14/12/2019
-- Description:	GetAllTrips
-- =============================================
CREATE PROCEDURE GetAllTrips	
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT T.Arr_TIme ,T.Dept_time ,T.ID  trip_id,T.Type  "Class" , S.Name  "From" ,D.Name  "TO",TR.Model  "Train Model"
	  FROM Trip T, Station S,Station D,Train TR where T.Source_ID=S.ID and T.Destintaion_ID=D.ID and T.Train_ID=TR.ID
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 21/12/2019
-- Description:	get ticket with specifec attributes
-- =============================================
create PROCEDURE getticketatt
@date1 varchar(50),
@date2 varchar(50),
@source int,
@Destination int,
@class varchar(50)
AS
BEGIN
select top 1 T.ID from Ticket T where T.Trip_ID = (select TR.ID from Trip Tr where @source=Tr.Source_ID and
@Destination=Tr.Destintaion_ID and Tr.Arr_Time>CAST(@date1 as Date) and Tr.Arr_Time<CAST(@date2 as Date) ) and Passenger_ID is null and @class=Class
END
GO


use RailWaySystemDB
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 21/12/2019
-- Description:	get ticket price with specifec attributes
-- =============================================
create PROCEDURE getticketprice
@date1 varchar(50),
@date2 varchar(50),
@source int,
@Destination int,
@class varchar(50)
AS
BEGIN
select top 1 T.Price from Ticket T where T.Trip_ID = (select TR.ID from Trip Tr where @source=Tr.Source_ID and
@Destination=Tr.Destintaion_ID and Tr.Arr_Time>CAST(@date1 as Date) and Tr.Arr_Time<CAST(@date2 as Date)  )  and Passenger_ID is null and @class=Class
END
GO


use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 21/12/2019
-- Description:	cancel ticket
-- =============================================
create PROCEDURE CancelTicket2
@ticketID int
AS
BEGIN
	update Ticket set Passenger_ID=null,Booking_Clerk_ID=null,Date=null where ID=@ticketID
END
GO




use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 21/12/2019
-- Description:	connect ticket to passenger
-- =============================================
create PROCEDURE connectTicket
@PassengerID int,
@BookingeClerkID int,
@Date varchar(50),
@ID int
AS
BEGIN
Update Ticket set Passenger_ID=@PassengerID , Date=@Date ,Booking_Clerk_ID=@BookingeClerkID where ID=@ID  
END
GO

use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 17/12/2019
-- Description:	Delete Passenger Contact
-- =============================================
create PROCEDURE DeletePContact 
	@Email varchar(50)
AS
BEGIN
	declare @passenger int;
	set @passenger=(select Passenger_ID from Passenger_Contact where Passenger_Contact.Email=@Email)
	if (select count(*) from Passenger_Contact where Passenger_ID =@passenger) > 1 
	Begin
	select Passenger_ID from Passenger_Contact where Passenger_Contact.Email=@Email
	Delete from Passenger_Contact where @Email=Passenger_Contact.Email
	End
	else 
	begin
	select -1
	end
END
GO


use RailWaySystemDB
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 16/12/2019
-- Description:	getallPassengers
-- =============================================
CREATE PROCEDURE GetALLPassengers 
	
AS
BEGIN
	SELECT * from Passenger
END
GO


use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 16/12/2019
-- Description:	get Passenger Conatact
-- =============================================
CREATE PROCEDURE GetPContact 
	-- Add the parameters for the stored procedure here
	@PassengerID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	SELECT First_name,Last_name,Email,City,State,Street from Passenger_Contact,Passenger
	 where Passenger_ID=@PassengerID and Passenger_ID=ID  
END
GO

use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 16/12/2019
-- Description:	Add Passenger contact
-- =============================================
CREATE PROCEDURE AddPContact 
	-- Add the parameters for the stored procedure here
	@PassengerID int,
	@City varchar(50),
	@Email varchar(50),
	@State varchar(50),
	@Street varchar(50)

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	Insert into  Passenger_Contact Values(@PassengerID,@Email,@City,@State,@Street)  
END
GO


use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 16/12/2019
-- Description:	Edit Passenger contact
-- =============================================
CREATE PROCEDURE EditPContact 
	-- Add the parameters for the stored procedure here
	@City varchar(50),
	@Email varchar(50),
	@State varchar(50),
	@Street varchar(50)

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if(@City!='')
	begin
	update   Passenger_Contact   set City = @City  where Email=@Email
	end  
	if(@State!='')
	begin
	update   Passenger_Contact   set  State=@State where Email=@Email
	end  
	if(@Street!='')
	begin
	update   Passenger_Contact   set  Street = @Street where Email=@Email
	end  
	select Passenger_ID from Passenger_Contact where Email=@Email
END
GO 

use  RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 16/12/2019
-- Description:	Add Passenger Phone
-- =============================================
CREATE PROCEDURE AddPPhone 
	-- Add the parameters for the stored procedure here
	@PassengerID int,
	@code int,
	@number int

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Insert into Passenger_Phone Values(@PassengerID,@code,@number)
END
GO 
use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 16/12/2019
-- Description:	edit Passenger Phone
-- =============================================
CREATE PROCEDURE EditPPhone 
	-- Add the parameters for the stored procedure here
	@PassengerID int,
	@code int,
	@number int

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update  Passenger_Phone
	set Code=@code , Number=@number
	where  @PassengerID=Passenger_ID	
END
GO 
use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 16/12/2019
-- Description:	Delete Passenger Phone
-- =============================================
Create PROCEDURE DeletePPhone 
	-- Add the parameters for the stored procedure here
	@PassengerID int,
	@code int,
	@number int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete from Passenger_Phone where @PassengerID=Passenger_ID and @code =Code and @number=Number
	END
GO


 
use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 16/12/2019
-- Description:	veiw Passenger Phone
-- =============================================
Create PROCEDURE VeiwPPhone 
	-- Add the parameters for the stored procedure here
	@PassengerID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	select First_name "First Name",Last_name "Last Name",Code,Number from Passenger_Phone,Passenger where  @PassengerID=Passenger_ID and @PassengerID=ID
END
GO 



use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali Abozied
-- Create date: 14/12/2019
-- Description:	get all trips between two stations
-- =============================================
CREATE PROCEDURE  GetTripsBet
	-- Add the parameters for the stored procedure here
	@Source_ID int,
    @Destintaion_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 Select T.ID from Trip T, Ticket Ti where Source_ID=@Source_ID and Destintaion_ID=@Destintaion_ID 
END
GO

use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 21/12/2019
-- Description:	get all subscription
-- =============================================
CREATE PROCEDURE GetAllSubs
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 'Price:'+CAST(Fees as varchar(10))+' Class:'+Class+' trips no:'+CAST(No_Trips as varchar(10)) as Atributes , ID from Subscription 
END
GO
use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 21/12/2019
-- Description:	get all subscription
-- =============================================
CREATE PROCEDURE InsertPsub
@PassengerID int,
@SubID int,
@expire varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Passenger_Subscription values(@PassengerID,@SubID,@expire);
END
GO


use RailWaySystemDB
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 13/12/2019
-- Description:	GetAllAdmins
-- =============================================
CREATE PROCEDURE GetAllAdmins
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ID, Username FROM [USER] WHERE IsAdmin=1
END
GO

USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new driver into the DB
Create Procedure get_emp_id_userId
@UserID int
As
Begin

	-- Inserting Driver's basic info in the Employee table

	
	-- Inserting the Driver into the Driver table
	select EmployeeID from dbo.[USER] where dbo.[USER].ID=@UserID
End
Go

use RailWaySystemDB
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 13/12/2019
-- Description:	Delete user by id
-- =============================================
CREATE PROCEDURE DeleteUser
	-- Add the parameters for the stored procedure here
	@ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [USER] WHERE ID=@ID
END
GO

use RailWaySystemDB
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE DeleteStation
	@id int
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM Station
	WHERE ID = @id;
	DELETE FROM Route
	WHERE Destination_ID = @id;

	
END
GO

use RailWaySystemDB
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 13/12/2019
-- Description:	ChangeUsername
-- =============================================
CREATE PROCEDURE ChangeUsername
	-- Add the parameters for the stored procedure here
	@ID INT,
	@Username varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [USER] SET Username=@Username WHERE ID=@ID
END
GO

use RailWaySystemDB
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 13/12/2019
-- Description:	Change Password
-- =============================================
CREATE PROCEDURE ChangePassword
	-- Add the parameters for the stored procedure here
	@ID INT,
	@OldPassword varchar(20),
	@NewPassword varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [USER] SET PasswordHash=HASHBYTES('SHA2_512', @NewPassword + CAST(Salt AS varchar(36)))
	WHERE ID=@ID AND PasswordHash=HASHBYTES('SHA2_512', @OldPassword+CAST(Salt AS VARCHAR(36)))

	SELECT @@ROWCOUNT
	
END
GO


USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new clerk into the DB
Create Procedure [dbo].[Cancel_Ticket]

	@Ticket_ID int
As
Begin

	
	-- Inserting into the Trip table
	Delete from [Ticket] where Ticket.ID=@Ticket_ID
End

GO

USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new clerk into the DB
Create Procedure [dbo].[Book_Seat]

	@Class varchar(1), 
	@Date date,
	@Price int,
	@Trip_ID int,
	@Booking_Clerk_ID int,
	@Passenger_ID int
As
Begin

	
	-- Inserting into the Trip table
	insert into [Ticket] values(@Class , @Price ,@Date , @Trip_ID ,@Booking_Clerk_ID,@Passenger_ID )
End
GO

CREATE PROCEDURE DeleteEmployee
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete From Employee
	where ID = @id
END
go
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		lido22
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetCyardStationId
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Station_ID from Coach_Yard where ID = @id;
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		lido22
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetRyardStationId
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Station_ID from Repair_Yard where ID = @id;
END
GO
--=======================================================
--lido22
create PROCEDURE DeleteEmpPhone
	@id int,
	@code varchar(10),
	@number varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		Delete from Employee_Phone where @id=Employee_ID and @code =Code and @number=Number

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		lido22
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetEmployeeStID
		@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT StationID from Employee where ID = @id;
END
GO
--------------------------------------------------------------------------
-- Author:		lido22
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetUserStationName
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF ((SELECT IsAdmin FROM [USER] WHERE ID=@id) = 1)
	BEGIN
		SELECT 'admin'
	END
	ELSE
	BEGIN
		DECLARE @EmpID INT = (SELECT EmployeeID FROM [USER] WHERE ID=@id)
		select S.Name from Station S where ID = (SELECT E.StationID  FROM Employee E WHERE ID=@EmpID)
	 
	END
    
	
END
GO
---------------------------------------------------------------------------------------

create PROCEDURE [dbo].[GetUserstId]
	-- Add the parameters for the stored procedure here
	@UserID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF ((SELECT IsAdmin FROM [USER] WHERE ID=@UserID) = 1)
	BEGIN
		SELECT 'admin'
	END
	ELSE
	BEGIN
		DECLARE @EmpID INT = (SELECT EmployeeID FROM [USER] WHERE ID=@UserID)
		(SELECT E.StationID  FROM Employee E WHERE ID=@EmpID)
	 
	END
END
GO

GO
-- Author:		lido22
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE ChangeTripDate
	@id int, 
	@arr date, 
	@dep date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Trip
	set Arr_Time = @arr, Dept_Time = @dep
	Where ID = @id
END
GO

CREATE PROCEDURE ChangeTripClass
@id int, 
@class int
AS
BEGIN
	-- lido22 ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Trip
	set [Type] = @class
	where ID = @id;
END
GO

GO


use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- Create date: 7/12/2019
-- Description:	Add a new route
-- =============================================
CREATE PROCEDURE AddRoute 
	-- Add the parameters for the stored procedure here
	@source_id int,
	@dest_id int,
	@distance int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into Route values(@source_id, @dest_id, @distance)

	return @@rowcount
END
GO

USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new clerk into the DB
Create Procedure [dbo].[Add_Subscription]

	@Fees int,
	@Class varchar(1),
	@No_Trips int
As
Begin
	
	
	-- Inserting into the Trip table
	INSERT INTO [Subscription]  values(@Fees,@Class,@No_Trips)
	return @@rowcount
End

GO

use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE AddCoachYard
	@size int,
	@station_id int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	insert into Coach_Yard (Station_ID, Size)
	values(@station_id, @size)
	return @@rowcount
END
GO

use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman
-- =============================================
CREATE PROCEDURE GetCoachYard
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Coach_Yard where Station_ID = @id
END
GO

USE [RailWaySystemDB]
GO
/****** Object:  StoredProcedure [dbo].[ChangePhone]    Script Date: 12/15/2019 6:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		lido22
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[ChangeEmpPhone]
	@code int,
	@id int,
	@phone int
AS
BEGIN
	
	SET NOCOUNT ON;

    
	update Employee_Phone
	set Code = @code, Number = @phone
	where Employee_ID = (select EmployeeID
	from [USER]
	where ID = @id);
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		lido22

CREATE PROCEDURE ChangeEmpEmail
	@id int,
	@email varchar(50)
AS
BEGIN
	
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Employee_Contact
	set Email = @email
	where Employee_ID = (select EmployeeID
	from [USER]
	where ID = @id);
END
GO
-- ==============================================
USE [RailWaySystemDB]
GO

/****** Object:  StoredProcedure [dbo].[GetEcontact]    Script Date: 16/12/2019 19:26:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE [dbo].[GetEphones]
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select (Code + number) as Phone_numbers from Employee_Phone where Employee_ID = @id
END
GO
--=============================================
USE [RailWaySystemDB]
GO

/****** Object:  StoredProcedure [dbo].[GetEcontact]    Script Date: 16/12/2019 19:26:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE [dbo].[GetEAddress]
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Email, (Street+', ' + State+ ', ' + City) as address from Employee_Contact where Employee_ID = @id
	
END
GO
-- ==================================================
USE [RailWaySystemDB]
GO

/****** Object:  StoredProcedure [dbo].[GetUsercontact]    Script Date: 16/12/2019 19:59:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE [dbo].[GetUserPhones]
	-- Add the parameters for the stored procedure here
	@userid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @id int = (SELECT EmployeeID from dbo.[USER] where ID=@userid)
    -- Insert statements for procedure here
	exec [dbo].[GetEphones] @id = @id

END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE DeleteEmpContact
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Employee_Contact
	where Employee_ID = @id;
END
GO

--=============================================
-- Author:		lido22
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE InsertTicket
	@class char,
	@price int,
	@date date,
	@bid int,
	@pid int, 
	@tid int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.--
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Ticket
	values(@class, @price , @date ,@bid ,@pid , @tid);
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		lido22
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetAllEContacts
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	select *
	From Employee_Contact;
    
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		lido22
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE UpdateEmpContact
	
	@id int,
	@City varchar(50),
	@Email varchar(50),
	@State varchar(50),
	@Street varchar(50)
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Update Employee_Contact
	set City = @City, Email = @Email, [State] = @State, Street = @Street
	where Employee_ID = @id;
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		lido22
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE AddEmpContact 
	-- Add the parameters for the stored procedure here
	@id int,
	@City varchar(50),
	@Email varchar(50),
	@State varchar(50),
	@Street varchar(50)

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	Insert into  Employee_Contact Values(@id,@Email,@City,@State,@Street) 
END
GO


-- ============================================
USE [RailWaySystemDB]
GO

/****** Object:  StoredProcedure [dbo].[GetUsercontact]    Script Date: 16/12/2019 19:59:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE [dbo].[GetUserAddress]
	-- Add the parameters for the stored procedure here
	@userid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @id int = (SELECT EmployeeID from dbo.[USER] where ID = @userid)
    -- Insert statements for procedure here
	exec [dbo].[GetEAddress] @id = @id

END
GO
USE [RailWaySystemDB]
GO

-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
create PROCEDURE [dbo].[Insert_Emp_Phone]
	@id int,
	@code varchar(10),
	@number varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Employee_Phone values (@id, @code, @number)
	return @@rowcount
END
GO

USE [RailWaySystemDB]
GO

/****** Object:  StoredProcedure [dbo].[InsertEmp]    Script Date: 16/12/2019 17:34:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================================
--				Mohamed Abobakr
-- =============================================================
-- Inserting a new employee into the Employee table and a User in the User table if not a driver
CREATE PROCEDURE [dbo].[Insert_Emp] 

	@fname varchar(50),
	@lname varchar(50),
	@bd date,
	@salary int,
	@working_hours int,
	@jobid int,
	@station_id int = null,
	@Username varchar(20) = null, 
    @Password varchar(20) = null,
	@IsAdmin BIT=null,
    @responseMessage varchar(250)='' OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @job varchar(50)
	set @job= (select Job_Description from Job where id = @jobid)
    -- Inserting the employee into Employee table
	Insert into Employee 
	values (@fname, @lname, @bd, @salary, @working_hours,@jobid, @station_id);

	if (@job != 'Driver')
	begin
	EXEC	[dbo].[InsertUser]
		@Username,
		@Password,
		@EmployeeID = @@IDENTITY,
		@IsAdmin = 0,
		@responseMessage = @responseMessage OUTPUT
	end
	-- Returning the id of the inserted user
	return @@identity
END
GO
Use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE DeleteUserPhone
	-- Add the parameters for the stored procedure here
	@id int,
	@phone varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Employee_Phone where @phone = (Code+Number) and Employee_ID in
	(select EmployeeID from [USER] where @id = ID)
	return @@rowcount
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		lido22
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetAllEmpPhones

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	from Employee_Phone
END
GO

Use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE GetAllStations
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Station 
	return @@rowcount
END
GO
Use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE InsetUserPhone 
	-- Add the parameters for the stored procedure here
	@userid int,
	@code varchar(50),
	@number varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @id int
	set @id = (select EmployeeID from [dbo].[USER] where (ID = @userid))
	exec Insert_Emp_Phone @id, @number, @code
	return @@rowcount
END
GO
use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- Create date: 7/12/2019
-- Description:	Add a new repair yard
-- =============================================
CREATE PROCEDURE AddRepairYard
	-- Add the parameters for the stored procedure here
	@station_id int,
	@size int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Repair_Yard values(@station_id, @size)
	return @@rowcount
END
GO
USE [RailWaySystemDB]
GO

/****** Object:  StoredProcedure [dbo].[GetCoachYard]    Script Date: 18/12/2019 18:05:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE [dbo].[GetRepairYard]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Repair_Yard where Station_ID = @id
END

GO
Use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohaemd Abobakr
-- =============================================
CREATE PROCEDURE UpdateRepSize 
	-- Add the parameters for the stored procedure here
	@id int,
	@size int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Repair_Yard set Size = @size where ID = @id
	return @@rowcount
END
GO

Use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE UpdateCoachSize 
	-- Add the parameters for the stored procedure here
	@id int,
	@size int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update	Coach_Yard set Size = @size where ID = @id
	return @@rowcount
END
GO
Use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed
-- =============================================
CREATE PROCEDURE GetAllRyards 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Repair_Yard
END
GO
use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE GetAllCyards 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Coach_Yard
END
GO
use RailWaySystemDB
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		abdelrahman tarek
-- Create date: 18/12/2019
-- Description:	GetAllJobs
-- =============================================
CREATE PROCEDURE GetAllJobs	
	-- Add the parameters for the stored procedure here
	@ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE	@Job varchar(20)

	IF ((SELECT IsAdmin FROM [USER] WHERE ID=@ID) = 1)
	BEGIN
		SET @Job = (SELECT 'Admin')
	END
	ELSE
	BEGIN
		DECLARE @EmpID INT = (SELECT EmployeeID FROM [USER] WHERE ID=@ID)
		DECLARE @JobID INT = (SELECT JobID FROM Employee WHERE ID=@EmpID)
		SET @Job = (SELECT Job_Description FROM JOB WHERE ID=@JobID)
	END

    -- Insert statements for procedure here
	IF @Job='Admin'
	BEGIN
		SELECT * FROM Job
	END  
	IF @Job = 'Manager'
	BEGIN
		SELECT * FROM Job WHERE Job_Description != 'Manager' 
	END
	IF @Job = 'Station Manager'
	BEGIN
		SELECT * FROM Job WHERE Job_Description != 'Manager' and Job_Description != 'Station Manager'
	END
END
GO


use RailWaySystemDB
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 12/18/2019
-- Description:	Check that username exists in database
-- =============================================
CREATE PROCEDURE CheckUsername
	-- Add the parameters for the stored procedure here
	@Username varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF (EXISTS (SELECT * FROM [USER] WHERE Username=@Username))
	BEGIN 
		SELECT 1
	END
	ELSE
		SELECT 0
END
GO

Use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE Unassign_Trains 
	-- Add the parameters for the stored procedure here
	@station_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Train where Coach_Yard_ID in (select ID from Coach_Yard where Station_ID = @station_id) 
END
GO

Use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE GetAllDrivers
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @DriverJobID INT = (SELECT ID FROM Job WHERE Job_Description='Driver') 
	-- Insert statements for procedure here
	SELECT (First_name + ' ' + Last_name) as name, Employee.ID from Employee left join Train on employee.ID = Driver_ID  
	where Employee.JobID = @DriverJobID and Model is null
END
GO

USE RailWaySystemDB
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 12/21/2019
-- Description:	GetAllSubscriptions
-- =============================================
CREATE PROCEDURE GetAllSubscriptions
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Subscription
END
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE Get_driver 
	-- Add the parameters for the stored procedure here
	@Tid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Driver_ID from Train where ID = @Tid
END
GO
use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE get_source
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT distinct Name, ID from Station, [route] where ID = Source_ID
END
GO
USE [RailWaySystemDB]
GO

/****** Object:  StoredProcedure [dbo].[get_dest]    Script Date: 20/12/2019 14:54:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE [dbo].[get_dest] 
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Station, [Route] where ID = Destination_ID and @id = Source_ID
END

GO


USE RailWaySystemDB
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman
-- Create date: 21/12/2019
-- Description:	Get Station the Employee Works In
-- =============================================
CREATE PROCEDURE EmployeeStation
	-- Add the parameters for the stored procedure here
	@EmpID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT StationID FROM Employee WHERE ID=@EmpID
END
GO
use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE GetNoSeats
		@Tid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT No_Seats from Train where ID = @Tid
END
GO

USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new clerk into the DB
CREATE Procedure [dbo].[InsertTrip]
	@Dept_Time datetime, 
	@Type int, 
	@Destination_ID int,
	@Source_ID int,
	@Train_ID int,
	@DriverID int,
	@St_Manager_ID int,
	@NumClassA int,
	@PriceClassA int,
	@NumClassB int,
	@PriceClassB int,
	@NumClassC int,
	@PriceClassC int
As
Begin
	DECLARE @I int
	
	-- Inserting into the Trip table
	DECLARE @Arr_Time datetime;
	DECLARE @Distance INT = (SELECT Distance FROM [Route] WHERE Source_ID=@Source_ID AND Destination_ID=@Destination_ID)
	DECLARE @Speed INT = (SELECT Speed FROM Train WHERE ID=@Train_ID)
	DECLARE @T float = (CAST(@Distance AS float) / CAST(@Speed AS float)) -- HOURS IN FLOAT
	SET @T = @T * 60 * 60
	SET @Arr_Time = DATEADD(SECOND, @T, @Dept_Time)
	insert into [Trip] values(@Dept_Time , @Arr_Time ,@Type , @Source_ID ,@Destination_ID,@Train_ID ,@St_Manager_ID )
	---------------------------------
	DECLARE @ID INT = @@IDENTITY

	-- Insert All Class A Tickets
	SET @I = @NumClassA
	WHILE @I > 0
	BEGIN
		EXEC	[dbo].[InsertTicket]
		@class = N'A',
		@price = @PriceClassA,
		@date = NULL,
		@bid = NULL,
		@pid = NULL,
		@tid = @ID
		SET @I = @I - 1
	END
	------------------------------

	-- Insert All Class B Tickets
	SET @I = @NumClassB
	WHILE @I > 0
	BEGIN
		EXEC	[dbo].[InsertTicket]
		@class = N'B',
		@price = @PriceClassB,
		@date = NULL,
		@bid = NULL,
		@pid = NULL,
		@tid = @ID
		SET @I = @I - 1
	END
	------------------------------

	-- Insert All Class A Tickets
	SET @I = @NumClassC
	WHILE @I > 0
	BEGIN
		EXEC	[dbo].[InsertTicket]
		@class = N'C',
		@price = @PriceClassC,
		@date = NULL,
		@bid = NULL,
		@pid = NULL,
		@tid = @ID
		SET @I = @I - 1
	END
	------------------------------
	UPDATE Train SET Driver_ID=@DriverID, Coach_Yard_ID=null
	WHERE ID=@Train_ID
End

GO

use RailWaySystemDB
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		abdelrahman
-- Create date: <Create Date,,>
-- Description:	ChangeTrainStatus
-- =============================================
CREATE PROCEDURE ChangeTrainStatus
	-- Add the parameters for the stored procedure here
	@TrainID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Declare @Status BIT = (SELECT [Status] FROM Train WHERE ID=@TrainID)
	DECLARE @StationID INT
	IF @Status=1  -- Go To Repair / Change it to 0
	BEGIN
		SET @StationID = (SELECT C.Station_ID FROM Train T INNER JOIN Coach_Yard C ON T.Coach_Yard_ID=C.ID AND T.ID=@TrainID)
		DECLARE @RepairYardID INT = (SELECT TOP 1 R.ID FROM Repair_Yard R
				WHERE Station_ID=@StationID AND 
				EXISTS(SELECT COUNT(*) FROM Train T WHERE T.Repair_Yard_ID=R.ID HAVING COUNT(*) < R.Size))
		UPDATE Train SET [Status]=0, Repair_Yard_ID=@RepairYardID, Coach_Yard_ID=NULL
		WHERE ID=@TrainID  
	END
	ELSE
	BEGIN
		SET @StationID = (SELECT R.Station_ID FROM Train T INNER JOIN Repair_Yard R ON T.Repair_Yard_ID=R.ID AND T.ID=@TrainID)
		DECLARE @CoachYardID INT = (SELECT TOP 1 C.ID FROM Coach_Yard C
				WHERE Station_ID=@StationID AND 
				EXISTS(SELECT COUNT(*) FROM Train T WHERE T.Coach_Yard_ID=C.ID HAVING COUNT(*) < C.Size))
		UPDATE Train SET [Status]=1, Repair_Yard_ID=NULL, Coach_Yard_ID=@CoachYardID
		WHERE ID=@TrainID  
	END
	SELECT @@ROWCOUNT
END
GO
USE [RailWaySystemDB]
GO

use RailWaySystemDB
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		abdelrahman
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE TripArrived
	-- Add the parameters for the stored procedure here
	@ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @Arr_Time DATETIME = (SELECT Arr_Time FROM Trip WHERE ID=@ID)
	IF GETDATE() >= @Arr_Time
	BEGIN
		DECLARE @TrainID INT = (SELECT Train_ID FROM Trip WHERE ID=@ID)
		DECLARE @SourceID INT = (SELECT Source_ID FROM Trip WHERE ID=@ID)
		DELETE Trip WHERE ID=@ID
		DECLARE @CoachYardID INT = (SELECT TOP 1 C.ID FROM Coach_Yard C
				WHERE Station_ID=@SourceID AND 
				EXISTS(SELECT COUNT(*) FROM Train T WHERE T.Coach_Yard_ID=C.ID HAVING COUNT(*) < C.Size))
		UPDATE Train SET Repair_Yard_ID=NULL, Coach_Yard_ID=@CoachYardID, Driver_ID = NULL
		WHERE ID=@TrainID
		SELECT 1  
	END
	ELSE
		SELECT 0
END
GO

USE [RailWaySystemDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getpassengerticket]
@PassengerID int
AS
BEGIN
select* from Ticket where Passenger_ID=@PassengerID
END


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 21/12/2019
-- Description:	edit ticket
-- =============================================
CREATE PROCEDURE [dbo].[EditTicket]
@ticketID int,
@class varchar(50),
@date varchar(50),
@BookingClerkID int
AS
BEGIN
	declare @Tripid int ;
	set @Tripid=(select Trip_ID from Ticket where ID =@ticketID)
	if(select count(*) from Ticket where Trip_ID=@Tripid and Class=@class and Passenger_ID is null)>0
	
	begin
		if(select Passenger_id from Ticket where ID=@ticketID) is null
		begin
		select -1;
		end
		else
		begin
		declare @passngerID int ;
		set @passngerID=(select Passenger_id from Ticket where ID=@ticketID);
		exec CancelTicket2
		@ticketID=@ticketID;
		declare @newticketid int ;
		set @newticketid =(select top 1 ID from Ticket where Trip_ID=@Tripid and Class=@class);
		exec connectTicket
		@PassengerID =@passngerID,
		@BookingeClerkID =@BookingClerkID,
		@Date =@date,
		@ID =@newticketid
		select @passngerID
		end
	end 
END


