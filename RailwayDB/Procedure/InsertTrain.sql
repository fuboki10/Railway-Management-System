-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE InsertTrain
	-- Add the parameters for the stored procedure here
	@Model varchar(50),
	@Status BIT=1,
	@Color varchar(50),
	@No_Seats int,
	@Speed int,
	@No_Cars int,
	@Date date,
	@Driver_ID int,
	@Repair_Yard_ID int,
	@Coach_Yard_ID int,
	@BoughtByID int  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Train 
	(Model, [Status], Color, No_Seats, Speed, No_Cars, [Date], Driver_ID, Repair_Yard_ID, Coach_Yard_ID, BoughtByID)
	VALUES
	(@Model, @Status, @Color, @No_Seats, @Speed, @No_Cars, @Date, @Driver_ID, @Repair_Yard_ID, @Coach_Yard_ID, @BoughtByID)
END
GO
