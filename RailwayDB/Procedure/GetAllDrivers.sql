Use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE GetAllDrivers
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT (First_name + ' ' + Last_name) as name, Employee.ID from Employee left join Train on employee.ID = Driver_ID  
	where Employee.JobID = 4 and Model is null
END
GO
