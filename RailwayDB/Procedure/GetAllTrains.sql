use RailWaySystemDB
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 14/12/2019
-- Description:	GetAllTrains
-- =============================================
CREATE PROCEDURE GetAllTrains	
	-- Add the parameters for the stored procedure here
	@StationID INT = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF (@StationID IS NOT NULL)
	BEGIN
		SELECT T.ID AS 'ID', Model, [Status], Color, No_Seats, Speed,
		No_Cars, CAST([Date] AS varchar(10)) AS 'Date', Driver_ID, Repair_Yard_ID, Coach_Yard_ID, BoughtByID 
		FROM 
		Train T
		WHERE 
		Driver_ID IS NULL AND 
		(EXISTS(SELECT * FROM Coach_Yard C WHERE C.ID=T.Coach_Yard_ID AND C.Station_ID=@StationID)
		OR
		EXISTS(SELECT * FROM Repair_Yard R WHERE R.ID=T.Repair_Yard_ID AND R.Station_ID=@StationID))
	END
	ELSE
		SELECT ID AS 'ID', Model, [Status], Color, No_Seats, Speed,
		No_Cars, CAST([Date] AS varchar(10)) AS 'Date', Driver_ID, Repair_Yard_ID, Coach_Yard_ID, BoughtByID FROM Train
END
GO
