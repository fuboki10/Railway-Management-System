USE [RailWaySystemDB]
GO

/****** Object:  StoredProcedure [dbo].[InsertEmp]    Script Date: 16/12/2019 17:34:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================================
--				Mohamed Abobakr
-- =============================================================
-- Inserting a new employee into the Employee table and a User in the User table if not a driver
CREATE PROCEDURE [dbo].[Insert_Emp] 

	@fname varchar(50),
	@lname varchar(50),
	@bd date,
	@salary int,
	@working_hours int,
	@jobid int,
	@station_id int = null,
	@Username varchar(20) = null, 
    @Password varchar(20) = null,
	@EmployeeID int=null,
	@IsAdmin BIT=null,
    @responseMessage varchar(250)='' OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @job varchar(50)
	set @job= (select Job_Description from Job where id = @jobid)
    -- Inserting the employee into Employee table
	Insert into Employee 
	values (@fname, @lname, @bd, @salary, @working_hours,@jobid, @station_id);

	if (@job != 'Driver')
	begin
	EXEC	[dbo].[InsertUser]
		@Username,
		@Password,
		@EmployeeID = @@IDENTITY,
		@IsAdmin = 0,
		@responseMessage = @responseMessage OUTPUT
	end
	-- Returning the id of the inserted user
	return @@identity
END

GO


