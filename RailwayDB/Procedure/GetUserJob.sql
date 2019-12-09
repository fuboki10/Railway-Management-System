-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
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
	@UserID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF ((SELECT IsAdmin FROM [USER] WHERE ID=@UserID) = 1)
	BEGIN
		SELECT 'Admin'
	END
	ELSE
	BEGIN
		DECLARE @EmpID INT = (SELECT EmployeeID FROM [USER] WHERE ID=@UserID)
		DECLARE @JobID INT = (SELECT JobID FROM Employee WHERE ID=@EmpID)
		SELECT Job_Description FROM JOB WHERE ID=@JobID 
	END
END
GO
