USE [RailWaySystemDB]
GO

/*DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertManager]
		@fname = N'Ihab',
		@lname = N'Talkhan',
		@age = 57,
		@bd = '2-23-1962',
		@salary = 80000,
		@working_hours = 35,
		@username = 'ITalkhan',
		@password = '1234'

SELECT	'Return Value' = @return_value

GO*/

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertStation]
		@name = 'Masr',
		@state = N'Cairo',
		@city = N'Ramses',
		@street = 1

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertStation]
		@name = 'ElRaml',
		@state = 'Alexandria',
		@city = 'ElRaml',
		@street = 2

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertStation]
		@name = N'ElAiat',
		@state = N'Giza',
		@city = N'ElAiat',
		@street = 5

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertStation]
		@name = N'Siedy Gaber',
		@state = N'Alexandria',
		@city = N'Siedy Gaber',
		@street = 1

SELECT	'Return Value' = @return_value

GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertStation]
		@name = N'ElMansoria',
		@state = N'Giza',
		@city = N'ElMansoria',
		@street = 13

SELECT	'Return Value' = @return_value

GO

Insert into Job (ID, Job_Description) values (1, 'Manager')
Insert into Job (ID, Job_Description) values (2, 'Station Manager')
Insert into Job (ID, Job_Description) values (3, 'Booking Clerk')
Insert into Job (ID, Job_Description) values (4, 'Driver')

EXEC	[dbo].[InsertUser]
		@Username = N'admin',
		@Password = N'admin',
		@EmployeeID = NULL,
		@IsAdmin = 1

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertEmp]
		@fname = 'Hossam',
		@lname = 'Alaa',
		@age = 28,
		@bd = '1-21-1991',
		@salary = 29000,
		@working_hours = 30,
		@jobid = 3,
		@station_id = 1
SELECT	'Return Value' = @return_value

GO


USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertEmp]
		@fname = 'Ahmed',
		@lname = 'Gomaa',
		@age = 27,
		@bd = '9-7-1992',
		@salary = 29000,
		@working_hours = 30,
		@jobid = 3,
		@station_id = 1
SELECT	'Return Value' = @return_value

GO


USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertEmp]
		@fname = 'Hamdy',
		@lname = 'Ismael',
		@age = 45,
		@bd = '05-05-1975',
		@salary = 30000,
		@working_hours = 30,
		@jobid = 3,
		@station_id = 1
SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertEmp]
		@fname = 'Ihab',
		@lname = 'Sayed',
		@age = 40,
		@bd = '11-9-1979',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4,
		@station_id = 1
SELECT	'Return Value' = @return_value

GO


USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertEmp]
		@fname = 'Tamer',
		@lname = 'Zaghlol',
		@age = 43,
		@bd = '5-3-1976',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4,
		@station_id = 1

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertEmp]
		@fname = 'Yasser',
		@lname = 'Farag',
		@age = 46,
		@bd = '9-17-1973',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4,
		@station_id = 1

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertEmp]
		@fname = 'Boraie', 
		@lname = 'Elsayed',
		@age = 49,
		@bd = '1-17-1970',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4,
		@station_id = 1

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertEmp]
		@fname = 'Ahmed',
		@lname = 'Arafat',
		@age = 47,
		@bd = '1-29-1972',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4,
		@station_id = 1

SELECT	'Return Value' = @return_value

GO


USE [RailWaySystemDB]
GO

DECLARE	@return_value int



EXEC	@return_value = [dbo].[InsertEmp]
		@fname = 'Kaled',  
		@lname = 'Sorady',
		@age = 45,
		@bd = '5-21-1974',
		@salary = 60000,
		@working_hours = 35,
		@jobid = 2,
		@station_id = 1

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertEmp]
		@fname = 'Alaa',
		@lname = 'Korany',
		@age = 50,
		@bd = '3-2-1969',
		@salary = 60000,
		@working_hours = 35,
	    @jobid = 2,
		@station_id = 2

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertEmp]
		@fname = 'Hassan',
		@lname = 'Mohamed',
		@age = 49,
		@bd = '7-30-1970',
		@salary = 60000,
		@working_hours = 35,
	    @jobid = 2,
		@station_id = 3

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertPassenger]
		@fname = 'Ahmed',
		@lname = 'Walid'

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertPassenger]
		@fname = 'Younis',
		@lname = 'Moustafa'

SELECT	'Return Value' = @return_value

GO


USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertPassenger]
		@fname = 'Youssef',
		@lname = 'Mahmoud'

SELECT	'Return Value' = @return_value

GO


USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertPassenger]
		@fname = 'Mohamed',
		@lname = 'Ahmed'

SELECT	'Return Value' = @return_value

GO


USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertPassenger]
		@fname = 'Mostafa',
		@lname = 'Mohy'

SELECT	'Return Value' = @return_value

GO


USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertPassenger]
		@fname = 'Ahmed',
		@lname = 'Sameer'

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertPassenger]
		@fname = 'Mahmoud',
		@lname = 'Ashraf'

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddCoachYard]
		@size = 5,
		@stid = 1

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddCoachYard]
		@size = 5,
		@stid = 2

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddCoachYard]
		@size = 3,
		@stid = 3

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddCoachYard]
		@size = 2,
		@stid = 4

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddCoachYard]
		@size = 1,
		@stid = 5

SELECT	'Return Value' = @return_value

GO


USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRepairYard]
		@station_id = 1,
		@size = 5

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRepairYard]
		@station_id = 2,
		@size = 4

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRepairYard]
		@station_id = 3,
		@size = 3

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRepairYard]
		@station_id = 4,
		@size = 1

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRepairYard]
		@station_id = 5,
		@size = 1

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRoute]
		@source_id = 1,
		@dest_id = 2,
		@distance = 230

SELECT	'Return Value' = @return_value

GO
USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRoute]
		@source_id = 2,
		@dest_id = 1,
		@distance = 230

SELECT	'Return Value' = @return_value

GO
USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRoute]
		@source_id = 1,
		@dest_id = 5,
		@distance = 50

SELECT	'Return Value' = @return_value

GO
USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRoute]
		@source_id = 5,
		@dest_id = 1,
		@distance = 50

SELECT	'Return Value' = @return_value

GO
USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRoute]
		@source_id = 2,
		@dest_id = 4,
		@distance = 60

SELECT	'Return Value' = @return_value

GO
USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRoute]
		@source_id = 4,
		@dest_id = 2,
		@distance = 60

SELECT	'Return Value' = @return_value

GO
USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRoute]
		@source_id = 3,
		@dest_id = 5,
		@distance = 47

SELECT	'Return Value' = @return_value

GO
USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[AddRoute]
		@source_id = 5,
		@dest_id = 3,
		@distance = 47

SELECT	'Return Value' = @return_value

GO
DECLARE	@return_value int

EXEC	@return_value = [dbo].[Add_Subscription]
		@Fees = 500,
		@Class = N'A',
		@No_Trips = 100

SELECT	'Return Value' = @return_value

GO
DECLARE	@return_value int

EXEC	@return_value = [dbo].[Add_Subscription]
		@Fees = 500,
		@Class = N'A',
		@No_Trips = 100

SELECT	'Return Value' = @return_value

GO
DECLARE	@return_value int

EXEC	@return_value = [dbo].[Add_Subscription]
		@Fees = 500,
		@Class = N'A',
		@No_Trips = 100

SELECT	'Return Value' = @return_value

GO
DECLARE	@return_value int

EXEC	@return_value = [dbo].[Add_Subscription]
		@Fees = 300,
		@Class = N'B',
		@No_Trips = 100

SELECT	'Return Value' = @return_value

GO
DECLARE	@return_value int

EXEC	@return_value = [dbo].[Add_Subscription]
		@Fees = 300,
		@Class = N'B',
		@No_Trips = 100

SELECT	'Return Value' = @return_value

GO
DECLARE	@return_value int

EXEC	@return_value = [dbo].[Add_Subscription]
		@Fees = 300,
		@Class = N'B',
		@No_Trips = 100

SELECT	'Return Value' = @return_value

GO
DECLARE	@return_value int

EXEC	@return_value = [dbo].[Add_Subscription]
		@Fees = 200,
		@Class = N'C',
		@No_Trips = 100

SELECT	'Return Value' = @return_value

GO
DECLARE	@return_value int

EXEC	@return_value = [dbo].[Add_Subscription]
	    @Fees = 200,
		@Class = N'C',
		@No_Trips = 100

SELECT	'Return Value' = @return_value

GO
DECLARE	@return_value int

EXEC	@return_value = [dbo].[Add_Subscription]
		@Fees = 200,
		@Class = N'C',
		@No_Trips = 100

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertTrain]
		@Model = N'MKT',
		@Status = 1,
		@Color = N'White',
		@No_Seats = 200,
		@Speed = 100,
		@No_Cars = 5,
		@Date = '10/11/1950',
		@Driver_ID = NULL,
		@Repair_Yard_ID = NULL,
		@Coach_Yard_ID = 1,
		@BoughtByID = NULL

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertTrain]
		@Model = N'LOL',
		@Status = 1,
		@Color = N'Yellow',
		@No_Seats = 20,
		@Speed = 10,
		@No_Cars = 2,
		@Date = '10/11/1960',
		@Driver_ID = NULL,
		@Repair_Yard_ID = NULL,
		@Coach_Yard_ID = 1,
		@BoughtByID = NULL

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertTrain]
		@Model = N'MKT3',
		@Status = 1,
		@Color = N'Black',
		@No_Seats = 23,
		@Speed = 15,
		@No_Cars = 2,
		@Date = '10/11/1970',
		@Driver_ID = NULL,
		@Repair_Yard_ID = NULL,
		@Coach_Yard_ID = 1,
		@BoughtByID = NULL

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertTrain]
		@Model = N'MK',
		@Status = 1,
		@Color = N'Black',
		@No_Seats = 300,
		@Speed = 50,
		@No_Cars = 6,
		@Date = '10/11/1999',
		@Driver_ID = NULL,
		@Repair_Yard_ID = NULL,
		@Coach_Yard_ID = 1,
		@BoughtByID = NULL

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertTrain]
		@Model = N'JP212',
		@Status = 1,
		@Color = N'Black',
		@No_Seats = 2000,
		@Speed = 300,
		@No_Cars = 10,
		@Date = '10/11/2005',
		@Driver_ID = NULL,
		@Repair_Yard_ID = NULL,
		@Coach_Yard_ID = 1,
		@BoughtByID = NULL

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertTrain]
		@Model = N'JP1',
		@Status = 1,
		@Color = N'Black',
		@No_Seats = 30,
		@Speed = 500,
		@No_Cars = 2,
		@Date = '10/11/2010',
		@Driver_ID = NULL,
		@Repair_Yard_ID = NULL,
		@Coach_Yard_ID = 1,
		@BoughtByID = NULL

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertTrain]
		@Model = N'MKT',
		@Status = 1,
		@Color = N'Black',
		@No_Seats = 2000,
		@Speed = 10,
		@No_Cars = 2,
		@Date = '10/11/1940',
		@Driver_ID = NULL,
		@Repair_Yard_ID = NULL,
		@Coach_Yard_ID = 1,
		@BoughtByID = NULL

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertTrain]
		@Model = N'GRM234',
		@Status = 1,
		@Color = N'Black',
		@No_Seats = 20,
		@Speed = 10,
		@No_Cars = 2,
		@Date = '10/11/1930',
		@Driver_ID = NULL,
		@Repair_Yard_ID = NULL,
		@Coach_Yard_ID = 1,
		@BoughtByID = NULL

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertTrain]
		@Model = N'US245',
		@Status = 1,
		@Color = N'Black',
		@No_Seats = 20,
		@Speed = 10,
		@No_Cars = 2,
		@Date = '10/11/1999',
		@Driver_ID = NULL,
		@Repair_Yard_ID = NULL,
		@Coach_Yard_ID = 1,
		@BoughtByID = NULL

SELECT	'Return Value' = @return_value

GO