use RailWaySystemDB
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		abdelrahman tarek
-- Create date: 18/12/2019
-- Description:	GetAllJobs
-- =============================================
CREATE PROCEDURE GetAllJobs	
	-- Add the parameters for the stored procedure here
	@ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE	@Job varchar(20)

	IF ((SELECT IsAdmin FROM [USER] WHERE ID=@ID) = 1)
	BEGIN
		SET @Job = (SELECT 'Admin')
	END
	ELSE
	BEGIN
		DECLARE @EmpID INT = (SELECT EmployeeID FROM [USER] WHERE ID=@ID)
		DECLARE @JobID INT = (SELECT JobID FROM Employee WHERE ID=@EmpID)
		SET @Job = (SELECT Job_Description FROM JOB WHERE ID=@JobID)
	END

    -- Insert statements for procedure here
	IF @Job='Admin'
	BEGIN
		SELECT * FROM Job
	END  
	IF @Job = 'Manager'
	BEGIN
		SELECT * FROM Job WHERE Job_Description != 'Manager' 
	END
	IF @Job = 'Station Manager'
	BEGIN
		SELECT * FROM Job WHERE Job_Description != 'Manager' and Job_Description != 'Station Manager'
	END
END
GO
