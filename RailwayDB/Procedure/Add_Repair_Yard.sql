use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- Create date: 7/12/2019
-- Description:	Add a new repair yard
-- =============================================
CREATE PROCEDURE AddRepairYard
	-- Add the parameters for the stored procedure here
	@station_id int,
	@size int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Repair_Yard values(@station_id, @size)
END
GO
