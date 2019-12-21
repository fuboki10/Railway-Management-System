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
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE GetUserStationName
@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF ((SELECT IsAdmin FROM [USER] WHERE ID=@id) = 1)
	BEGIN
		SELECT 'admin'
	END
	ELSE
	BEGIN
		DECLARE @EmpID INT = (SELECT EmployeeID FROM [USER] WHERE ID=@id)
		select S.Name from Station S where ID = (SELECT E.StationID  FROM Employee E WHERE ID=@EmpID)
	 
	END
    
	
END
GO
