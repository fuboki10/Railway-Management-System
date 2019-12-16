USE [RailWaySystemDB]
GO

/****** Object:  StoredProcedure [dbo].[GetUsercontact]    Script Date: 16/12/2019 19:59:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE [dbo].[GetUserAddress]
	-- Add the parameters for the stored procedure here
	@userid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @id int = (SELECT EmployeeID from dbo.[USER] where ID = @userid)
    -- Insert statements for procedure here
	exec [dbo].[GetEAddress] @id = @id

END


GO


