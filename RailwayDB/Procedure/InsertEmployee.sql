use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new employee into the Employee table
CREATE PROCEDURE InsertEmp 

	@fname varchar(50),
	@lname varchar(50),
	@age int,
	@bd date,
	@salary int,
	@working_hours int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Inserting the employee into Employee table
	Insert into Employee 
	values (@fname, @lname, @age, @bd, @salary, @working_hours);

	-- Returning the id of the inserted employee
	return @@identity
END
GO
