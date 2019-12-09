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

EXEC	@return_value = [dbo].[InsertClerk]
		@fname = 'Hossam',
		@lname = 'Alaa',
		@age = 28,
		@bd = '1-21-1991',
		@salary = 29000,
		@working_hours = 30,
		@Username = 'HossamAlaa',
		@Password = '1234'
		, @jobid = 3
SELECT	'Return Value' = @return_value

GO


USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertClerk]
		@fname = 'Ahmed',
		@lname = 'Gomaa',
		@age = 27,
		@bd = '9-7-1992',
		@salary = 29000,
		@working_hours = 30,
		@Username = 'AhmedGomaa',
		@Password = '1234'
		, @jobid = 3
SELECT	'Return Value' = @return_value

GO


USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertClerk]
		@fname = 'Hamdy',
		@lname = 'Ismael',
		@age = 45,
		@bd = '05-05-1975',
		@salary = 30000,
		@working_hours = 30,
		@Username = 'HamdyIsmael',
		@Password = '1234'
		, @jobid = 3
SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertDriver]
		@fname = 'Ihab',
		@lname = 'Sayed',
		@age = 40,
		@bd = '11-9-1979',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4
SELECT	'Return Value' = @return_value

GO


USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertDriver]
		@fname = 'Tamer',
		@lname = 'Zaghlol',
		@age = 43,
		@bd = '5-3-1976',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertDriver]
		@fname = 'Yasser',
		@lname = 'Farag',
		@age = 46,
		@bd = '9-17-1973',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertDriver]
		@fname = 'Boraie', 
		@lname = 'Elsayed',
		@age = 49,
		@bd = '1-17-1970',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertDriver]
		@fname = 'Ahmed',
		@lname = 'Arafat',
		@age = 47,
		@bd = '1-29-1972',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4

SELECT	'Return Value' = @return_value

GO


USE [RailWaySystemDB]
GO

DECLARE	@return_value int



EXEC	@return_value = [dbo].[InsertSManager]
		@fname = 'Kaled',  
		@lname = 'Sorady',
		@age = 45,
		@bd = '5-21-1974',
		@salary = 60000,
		@working_hours = 35,
		@username = 'KhaledSorady',
		@password = '1234'
		, @jobid = 2

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertSManager]
		@fname = 'Alaa',
		@lname = 'Korany',
		@age = 50,
		@bd = '3-2-1969',
		@salary = 60000,
		@working_hours = 35,
		@username = 'AlaaoKrany',
		@password = '1234'
		, @jobid = 2

SELECT	'Return Value' = @return_value

GO

USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertSManager]
		@fname = 'Hassan',
		@lname = 'Mohamed',
		@age = 49,
		@bd = '7-30-1970',
		@salary = 60000,
		@working_hours = 35,
		@username = 'HassanMohamed',
		@password = '1234'
		, @jobid = 2

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
