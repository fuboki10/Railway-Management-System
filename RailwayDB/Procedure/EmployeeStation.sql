USE RailWaySystemDB
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman
-- Create date: 21/12/2019
-- Description:	Get Station the Employee Works In
-- =============================================
CREATE PROCEDURE EmployeeStation
	-- Add the parameters for the stored procedure here
	@EmpID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT StationID FROM Employee WHERE ID=@EmpID
END
GO
