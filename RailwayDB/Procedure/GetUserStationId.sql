USE [RailWaySystemDB]
GO
/****** Object:  StoredProcedure [dbo].[GetUserJob]    Script Date: 12/17/2019 9:06:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 12/9/2019
-- Description:	Get Employee Job
-- =============================================
create PROCEDURE [dbo].[GetUserstId]
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
		(SELECT E.StationID  FROM Employee E WHERE ID=@EmpID)
	 
	END
END
