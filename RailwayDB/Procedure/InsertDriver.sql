USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure InsertDriver
	@id int, @fname varchar(50), @lname varchar(50), @age int, @bd date, @salary int, @working_hours int
As
Begin
	Exec dbo.InsertEmp
	@id = @id ,
	@fname = @fname,
	@lname = @lname,
	@age = @age,
	@bd = @bd,
	@salary = @salary,
	@working_hours = @working_hours
	
	insert into Driver values(@id)
End
Go
