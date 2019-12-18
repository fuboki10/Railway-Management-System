USE [RailWaySystemDB]
GO

/*DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertManager]
		@fname = N'Ihab',
		@lname = N'Talkhan',
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
		@bd = '9-7-1992',
		@salary = 29000,
		@working_hours = 30,
		@jobid = 3,
		@station_id = 2
SELECT	'Return Value' = @return_value

GO


USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertEmp]
		@fname = 'Hamdy',
		@lname = 'Ismael',
		@bd = '05-05-1975',
		@salary = 30000,
		@working_hours = 30,
		@jobid = 3,
		@station_id = 3
SELECT	'Return Value' = @return_value


EXEC	@return_value = [dbo].[InsertEmp]
		@fname = 'Sayed',
		@lname = 'Othman',
		@bd = '05-02-1978',
		@salary = 30000,
		@working_hours = 30,
		@jobid = 3,
		@station_id = 4



EXEC	@return_value = [dbo].[InsertEmp]
		@fname = 'Zeyad',
		@lname = 'Ramadan',
		@bd = '04-09-1975',
		@salary = 30000,
		@working_hours = 30,
		@jobid = 3,
		@station_id = 5
GO

USE [RailWaySystemDB]
GO

EXEC	[dbo].[InsertEmp]
declare @return_value int
EXEC	@return_value = [dbo].[InsertEmp]
		@fname = 'Ihab',
		@lname = 'Sayed',
		@bd = '11-9-1979',
		@salary = 4000,
		@working_hours = 40,
		@jobid = 4,
		@station_id = 1

GO


USE [RailWaySystemDB]
GO


EXEC	[dbo].[InsertEmp]
		@fname = 'Tamer',
		@lname = 'Zaghlol',
		@bd = '5-3-1976',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4,
		@station_id = 1


GO

USE [RailWaySystemDB]
GO


EXEC	[dbo].[InsertEmp]
		@fname = 'Yasser',
		@lname = 'Farag',
		@bd = '9-17-1973',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4,
		@station_id = 2


GO

USE [RailWaySystemDB]
GO

EXEC	[dbo].[InsertEmp]
		@fname = 'Boraie', 
		@lname = 'Elsayed',
		@bd = '1-17-1970',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4,
		@station_id = 2

GO

USE [RailWaySystemDB]
GO

EXEC	[dbo].[InsertEmp]
		@fname = 'Ahmed',
		@lname = 'Arafat',
		@bd = '1-29-1972',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4,
		@station_id = 3

EXEC	[dbo].[InsertEmp]
		@fname = 'Ahmed',
		@lname = 'Azzam',
		@bd = '3-31-1970',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4,
		@station_id = 3

EXEC	[dbo].[InsertEmp]
		@fname = 'Magdy',
		@lname = 'Saeed',
		@bd = '2-23-1979',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4,
		@station_id = 4


EXEC	[dbo].[InsertEmp]
		@fname = 'Ahmed',
		@lname = 'Walaa',
		@bd = '10-17-1980',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4,
		@station_id = 4


EXEC	[dbo].[InsertEmp]
		@fname = 'Omar',
		@lname = 'Saedd',
		@bd = '5-6-1967',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4,
		@station_id = 5

EXEC	[dbo].[InsertEmp]
		@fname = 'Omar',
		@lname = 'Khaled',
		@bd = '6-10-1973',
		@salary = 4000,
		@working_hours = 40
		, @jobid = 4,
		@station_id = 5

GO


USE [RailWaySystemDB]
GO

EXEC	[dbo].[InsertEmp]
		@fname = 'Kaled',  
		@lname = 'Sorady',
		@bd = '5-21-1974',
		@salary = 60000,
		@working_hours = 35,
		@jobid = 2,
		@station_id = 1

EXEC	[dbo].[InsertUser]
		@Username = N'sorady',
		@Password = N'1234',
		@EmployeeID = 9,
		@IsAdmin = 0
GO

USE [RailWaySystemDB]
GO

EXEC	[dbo].[InsertEmp]
		@fname = 'Alaa',
		@lname = 'Korany',
		@bd = '3-2-1969',
		@salary = 60000,
		@working_hours = 35,
	    @jobid = 2,
		@station_id = 2

GO

USE [RailWaySystemDB]
GO

EXEC	[dbo].[InsertEmp]
		@fname = 'Hassan',
		@lname = 'Mohamed',
		@bd = '7-30-1970',
		@salary = 60000,
		@working_hours = 35,
	    @jobid = 2,
		@station_id = 3

EXEC	[dbo].[InsertEmp]
		@fname = 'Abdo',
		@lname = 'Ebrahim',
		@bd = '8-31-1969',
		@salary = 60000,
		@working_hours = 35,
	    @jobid = 2,
		@station_id = 5

EXEC	[dbo].[InsertEmp]
		@fname = 'Mohamed',
		@lname = 'Hassan',
		@bd = '7-14-1964',
		@salary = 60000,
		@working_hours = 35,
	    @jobid = 2,
		@station_id = 5
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
EXEC	[dbo].[InsertUser]
		@Username = N'Hossam',
		@Password = N'1234',
		@EmployeeID = 1,
		@IsAdmin = 0

USE [RailWaySystemDB]
GO
EXEC [dbo].InsertTrip
	@Dept_Time =N'11/12/2019 8:15:09 PM', 
	@Arr_Time =N'11/13/2019 2:15:09 AM',
	@Type=1 , 
	@Destination_ID= 1,
	@Source_ID= 2,
	@Train_ID = 1 ,
	@St_Manager_ID =1
EXEC [dbo].InsertTrip
	@Dept_Time =N'11/10/2019 9:00:09 PM', 
	@Arr_Time =N'11/11/2019 3:00:09 AM',
	@Type=2 , 
	@Destination_ID= 5,
	@Source_ID= 3,
	@Train_ID=2 ,
	@St_Manager_ID =1
EXEC [dbo].InsertTrip
	@Dept_Time =N'11/15/2019 5:00:09 PM', 
	@Arr_Time =N'11/15/2019 9:00:09 PM',
	@Type=1 , 
	@Destination_ID= 5,
	@Source_ID= 1,
	@Train_ID=1 ,
	@St_Manager_ID =1
EXEC [dbo].InsertTrip
	@Dept_Time =N'11/12/2019 8:30:09 PM', 
	@Arr_Time =N'11/13/2019 2:45:09 AM',
	@Type=3 , 
	@Destination_ID= 2,
	@Source_ID= 4,
	@Train_ID=3 ,
	@St_Manager_ID =1
EXEC [dbo].InsertTrip
	@Dept_Time =N'11/12/2019 11:00:09 PM', 
	@Arr_Time =N'11/13/2019 5:00:09 AM',
	@Type=2 , 
	@Destination_ID= 3,
	@Source_ID= 5,
	@Train_ID=4 ,
	@St_Manager_ID =1
EXEC [dbo].InsertTrip
	@Dept_Time =N'11/12/2019 11:30 PM', 
	@Arr_Time =N'11/13/2019 4:00 AM',
	@Type=1 , 
	@Destination_ID= 1,
	@Source_ID= 2,
	@Train_ID=4 ,
	@St_Manager_ID =1

EXEC [dbo].InsertTrip
	@Dept_Time =N'12/12/2019 11:30 PM', 
	@Arr_Time =N'12/13/2019 4:00 AM',
	@Type=1 , 
	@Destination_ID= 1,
	@Source_ID= 2,
	@Train_ID=4 ,
	@St_Manager_ID =1

	USE [RailWaySystemDB]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'A',
		@price = 200,
		@date = '1-1-2019',
		@bid = 1,
		@pid = 1,
		@tid = 1

SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'B',
		@price = 120,
		@date = '1-1-2019',
		@bid = 1,
		@pid = 2,
		@tid = 1

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'C',
		@price = 80,
		@date = '1-1-2019',
		@bid = 1,
		@pid = 3,
		@tid = 1

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'A',
		@price = 200,
		@date = '2-1-2019',
		@bid = 1,
		@pid = 1,
		@tid = 2

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'B',
		@price = 120,
		@date = '2-1-2019',
		@bid = 1,
		@pid = 2,
		@tid = 2

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'C',
		@price = 80,
		@date = '1-1-2019',
		@bid = 1,
		@pid = 3,
		@tid = 2

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'A',
		@price = 200,
		@date = '3-1-2019',
		@bid = 1,
		@pid = 1,
		@tid = 3

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'B',
		@price = 120,
		@date = '3-1-2019',
		@bid = 1,
		@pid = 1,
		@tid = 3

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'C',
		@price = 80,
		@date = '3-1-2019',
		@bid = 1,
		@pid = 3,
		@tid = 3

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'A',
		@price = 200,
		@date = '4-1-2019',
		@bid = 1,
		@pid = 1,
		@tid = 4

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'B',
		@price = 120,
		@date = '4-1-2019',
		@bid = 1,
		@pid = 2,
		@tid = 4

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'C',
		@price = 80,
		@date = '4-1-2019',
		@bid = 1,
		@pid = 3,
		@tid = 4

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'A',
		@price = 200,
		@date = '5-1-2019',
		@bid = 1,
		@pid = 1,
		@tid = 5

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'B',
		@price =120,
		@date = '5-1-2019',
		@bid = 1,
		@pid = 2,
		@tid = 5

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'C',
		@price = 80,
		@date = '5-1-2019',
		@bid = 1,
		@pid = 3,
		@tid = 5

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'A',
		@price = 200,
		@date = '6-1-2019',
		@bid = 1,
		@pid = 1,
		@tid = 6

SELECT	'Return Value' = @return_value

EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'B',
		@price = 120,
		@date = '6-1-2019',
		@bid = 1,
		@pid = 2,
		@tid = 6

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'C',
		@price = 80,
		@date = '6-1-2019',
		@bid = 1,
		@pid = 3,
		@tid = 6

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'A',
		@price = 200,
		@date = '7-1-2019',
		@bid = 1,
		@pid = 1,
		@tid = 7

SELECT	'Return Value' = @return_value
EXEC	@return_value = [dbo].[InsertTicket]
		@class = N'B',
		@price = 120,
		@date = '7-1-2019',
		@bid = 1,
		@pid = 2,
		@tid = 7

SELECT	'Return Value' = @return_value
GO
EXEC	[dbo].[Insert_Emp]
		@fname = N'Mohamed',
		@lname = N'bakr',
		@bd = '1999-2-13',
		@salary = 23,
		@working_hours = 15,
		@jobid = 1,
		@Username = N'mng',
		@Password = N'1234',
		@IsAdmin = 0
		
GO
