use RailWaySystemDB
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		abdelrahman
-- Create date: <Create Date,,>
-- Description:	ChangeTrainStatus
-- =============================================
CREATE PROCEDURE ChangeTrainStatus
	-- Add the parameters for the stored procedure here
	@TrainID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Declare @Status BIT = (SELECT [Status] FROM Train WHERE ID=@TrainID)
	DECLARE @StationID INT
	IF @Status=1  -- Go To Repair / Change it to 0
	BEGIN
		SET @StationID = (SELECT C.Station_ID FROM Train T INNER JOIN Coach_Yard C ON T.Coach_Yard_ID=C.ID AND T.ID=@TrainID)
		DECLARE @RepairYardID INT = (SELECT TOP 1 R.ID FROM Repair_Yard R
				WHERE Station_ID=@StationID AND 
				EXISTS(SELECT COUNT(*) FROM Train T WHERE T.Repair_Yard_ID=R.ID HAVING COUNT(*) < R.Size))
		UPDATE Train SET [Status]=0, Repair_Yard_ID=@RepairYardID, Coach_Yard_ID=NULL
		WHERE ID=@TrainID  
	END
	ELSE
	BEGIN
		SET @StationID = (SELECT R.Station_ID FROM Train T INNER JOIN Repair_Yard R ON T.Repair_Yard_ID=R.ID AND T.ID=@TrainID)
		DECLARE @CoachYardID INT = (SELECT TOP 1 C.ID FROM Coach_Yard C
				WHERE Station_ID=@StationID AND 
				EXISTS(SELECT COUNT(*) FROM Train T WHERE T.Coach_Yard_ID=C.ID HAVING COUNT(*) < C.Size))
		UPDATE Train SET [Status]=1, Repair_Yard_ID=NULL, Coach_Yard_ID=@CoachYardID
		WHERE ID=@TrainID  
	END
	SELECT @@ROWCOUNT
END
GO
