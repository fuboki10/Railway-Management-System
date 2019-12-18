Use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohaemd Abobakr
-- =============================================
CREATE PROCEDURE UpdateRepSize 
	-- Add the parameters for the stored procedure here
	@id int,
	@size int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update Repair_Yard set Size = @size where ID = @id
	return @@rowcount
END
GO
