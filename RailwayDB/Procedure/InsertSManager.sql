USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new Station Manager into the DB

Create Procedure [dbo].[InsertSManager]
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

	-- Inserting the managers basic info into the Employee table
	declare @id int, @userid int, @response varchar(250) 
	Exec @id = dbo.InsertEmp
	@fname,
	@lname,
	@age,
	@bd,
	@salary,
	@working_hours
	
	-- Inserting a new user for the Station Manager
	exec @userid = InsertUser @username, @password, @response output
	
	-- Inserting The manager into Station manager table
	insert into [Station Manager] values(@id, @userid)
End


GO


