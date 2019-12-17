Use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE InsetUserPhone 
	-- Add the parameters for the stored procedure here
	@userid int,
	@code varchar(50),
	@number varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    declare @id int
	set @id = (select EmployeeID from [dbo].[USER] where (ID = @userid))
	exec Insert_Emp_Phone @id, @number, @code
	return @@rowcount
END
GO
