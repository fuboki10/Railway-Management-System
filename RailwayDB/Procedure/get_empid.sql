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
