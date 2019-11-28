USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create Procedure [dbo].[InsertManager]
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
	
	insert into [Manager] values(@id, null)
End


GO


