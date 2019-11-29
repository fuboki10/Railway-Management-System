USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Insert manager Procedure

Create Procedure [dbo].[InsertManager]
	@fname varchar(50),
	@lname varchar(50),
	@age int,
	@bd date,
	@salary int,
	@working_hours int,
	@username varchar(20),
	@password varchar(20)

As
Begin

-- Inserting The manger's Basic info in the employee table
	declare @id int, @userid int, @response varchar(250) 
	Exec @id = dbo.InsertEmp
	@fname,
	@lname,
	@age,
	@bd,
	@salary,
	@working_hours
	
	-- Inserting the Manager into Manager table
	exec @userid = InsertUser
	@username,
	@password,
	@response output
	
	insert into [Manager] values(@id, @userid)
End


GO


