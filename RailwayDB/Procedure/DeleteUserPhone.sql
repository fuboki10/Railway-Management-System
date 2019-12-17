Use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE DeleteUserPhone
	-- Add the parameters for the stored procedure here
	@id int,
	@number varchar(50),
	@code varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Delete from Employee_Phone where @number = Number and @code = Code and Employee_ID in
	(select EmployeeID from [USER] where @id = ID)
END
GO
