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
CREATE PROCEDURE InsertTrain
	-- Add the parameters for the stored procedure here
	@Model varchar(50),
	@Status BIT=1,   -- 0 Needs Fixing
	@Color varchar(50),
	@No_Seats integer,
	@Speed integer,
	@No_Cars integer,
	@Date date,
	@Driver_ID integer=null,
	@Repair_Yard_ID integer=null,
	@Coach_Yard_ID integer=null,
	@BoughtByID int=null         
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @NO_TRAINS INT = (SELECT COUNT(*) FROM Train WHERE Coach_Yard_ID=@Coach_Yard_ID)
	IF @NO_TRAINS < (SELECT Size FROM Coach_Yard WHERE ID=@Coach_Yard_ID)
	BEGIN
		INSERT INTO Train
		(Model, [Status], Color, No_Seats, Speed, No_Cars, [Date], Driver_ID, Repair_Yard_ID, Coach_Yard_ID, BoughtByID)
		VALUES
		(@Model, @Status, @Color, @No_Seats, @Speed, @No_Cars, @Date, @Driver_ID, @Repair_Yard_ID, @Coach_Yard_ID, @BoughtByID)
	END
	SELECT @@rowcount
END
GO