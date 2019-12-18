use RailWaySystemDB
go

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 12/9/2019
-- Description:	Get Employee Job
-- =============================================
CREATE PROCEDURE GetUserJob
	-- Add the parameters for the stored procedure here
	@UserID INT,
	@out VARCHAR(20)='' OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF ((SELECT IsAdmin FROM [USER] WHERE ID=@UserID) = 1)
	BEGIN
		SET @out = (SELECT 'Admin')
	END
	ELSE
	BEGIN
		DECLARE @EmpID INT = (SELECT EmployeeID FROM [USER] WHERE ID=@UserID)
		DECLARE @JobID INT = (SELECT JobID FROM Employee WHERE ID=@EmpID)
		SET @out = (SELECT Job_Description FROM JOB WHERE ID=@JobID)
	END
	SELECT @out
END
GO
