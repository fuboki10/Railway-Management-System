USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new driver into the DB
Create Procedure InsertDriver
	@fname varchar(50),
	@lname varchar(50),
	@age int, @bd date,
	@salary int,
	@working_hours int
As
Begin

	-- Inserting Driver's basic info in the Employee table
	declare @id int
	Exec @id = dbo.InsertEmp
	@fname,
	@lname,
	@age,
	@bd,
	@salary,
	@working_hours
	
	-- Inserting the Driver into the Driver table
	insert into Driver values(@id)
End
Go
