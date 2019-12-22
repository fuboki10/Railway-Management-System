use RailWaySystemDB
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		abdelrahman
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE TripArrived
	-- Add the parameters for the stored procedure here
	@ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @Arr_Time DATETIME = (SELECT Arr_Time FROM Trip WHERE ID=@ID)
	IF GETDATE() >= @Arr_Time
	BEGIN
		DECLARE @TrainID INT = (SELECT Train_ID FROM Trip WHERE ID=@ID)
		DECLARE @SourceID INT = (SELECT Source_ID FROM Trip WHERE ID=@ID)
		DELETE Trip WHERE ID=@ID
		DECLARE @CoachYardID INT = (SELECT TOP 1 C.ID FROM Coach_Yard C
				WHERE Station_ID=@SourceID AND 
				EXISTS(SELECT COUNT(*) FROM Train T WHERE T.Coach_Yard_ID=C.ID HAVING COUNT(*) < C.Size))
		UPDATE Train SET Repair_Yard_ID=NULL, Coach_Yard_ID=@CoachYardID, Driver_ID = NULL
		WHERE ID=@TrainID
		SELECT 1   
	END
	ELSE
		SELECT 0
END
GO
