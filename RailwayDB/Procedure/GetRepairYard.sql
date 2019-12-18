USE [RailWaySystemDB]
GO

/****** Object:  StoredProcedure [dbo].[GetCoachYard]    Script Date: 18/12/2019 18:05:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE [dbo].[GetRepairYard]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Coach_Yard where Station_ID = @id
END

GO


