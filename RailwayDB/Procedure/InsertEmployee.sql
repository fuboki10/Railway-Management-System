use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE InsertEmp 

	@id int, @fname varchar(50), @lname varchar(50), @age int, @bd date, @salary int, @working_hours int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into Employee 
	values (@id, @fname, @lname, @age, @bd, @salary, @working_hours);
END
GO
