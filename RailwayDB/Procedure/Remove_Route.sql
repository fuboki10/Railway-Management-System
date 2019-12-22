use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- Create date: 7/12/2019
-- Description:	Remove the route joining the two provided stations
-- =============================================
CREATE PROCEDURE RemoveRoute 
	-- Add the parameters for the stored procedure here
	@source_id int,
	@dest_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Delete from Route where Source_ID = @source_id and Destination_ID = @dest_id

	
END
GO
