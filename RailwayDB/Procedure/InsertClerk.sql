USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new clerk into the DB
Create Procedure [dbo].[InsertClerk]
	@fname varchar(50), 
	@lname varchar(50),
	@age int, 
	@bd date, 
	@salary int,
	@working_hours int,
	@Username varchar(20), 
    @Password varchar(20)
As
Begin

-- Inserting basic info in employee table
	declare @id int
	Exec @id = dbo.InsertEmp
	@fname,
	@lname,
	@age,
	@bd,
	@salary,
	@working_hours
	
	-- Inserting a new user
	declare @userid int, @response varchar(250)
	exec @userid = InsertUser
	@username,
	@password,
	@response output

	-- Inserting into the booking clerk table
	insert into [Booking Clerk] values(@id, @userid)
End

GO


