USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new clerk into the DB
CREATE Procedure [dbo].[InsertTrip]
	@Dept_Time datetime, 
	@Type int, 
	@Destination_ID int,
	@Source_ID int,
	@Train_ID int,
	@DriverID int,
	@St_Manager_ID int,
	@NumClassA int,
	@PriceClassA int,
	@NumClassB int,
	@PriceClassB int,
	@NumClassC int,
	@PriceClassC int
As
Begin
	DECLARE @I int
	
	-- Inserting into the Trip table
	DECLARE @Arr_Time datetime;
	DECLARE @Distance INT = (SELECT Distance FROM [Route] WHERE Source_ID=@Source_ID AND Destination_ID=@Destination_ID)
	DECLARE @Speed INT = (SELECT Speed FROM Train WHERE ID=@Train_ID)
	DECLARE @T float = (CAST(@Distance AS float) / CAST(@Speed AS float)) -- HOURS IN FLOAT
	SET @T = @T * 60 * 60
	SET @Arr_Time = DATEADD(SECOND, @T, @Dept_Time)
	insert into [Trip] values(@Dept_Time , @Arr_Time ,@Type , @Source_ID ,@Destination_ID,@Train_ID ,@St_Manager_ID )
	---------------------------------
	DECLARE @ID INT = @@IDENTITY

	-- Insert All Class A Tickets
	SET @I = @NumClassA
	WHILE @I > 0
	BEGIN
		EXEC	[dbo].[InsertTicket]
		@class = N'A',
		@price = @PriceClassA,
		@date = NULL,
		@bid = NULL,
		@pid = NULL,
		@tid = @ID
		SET @I = @I - 1
	END
	------------------------------

	-- Insert All Class B Tickets
	SET @I = @NumClassB
	WHILE @I > 0
	BEGIN
		EXEC	[dbo].[InsertTicket]
		@class = N'B',
		@price = @PriceClassB,
		@date = NULL,
		@bid = NULL,
		@pid = NULL,
		@tid = @ID
		SET @I = @I - 1
	END
	------------------------------

	-- Insert All Class A Tickets
	SET @I = @NumClassC
	WHILE @I > 0
	BEGIN
		EXEC	[dbo].[InsertTicket]
		@class = N'C',
		@price = @PriceClassC,
		@date = NULL,
		@bid = NULL,
		@pid = NULL,
		@tid = @ID
		SET @I = @I - 1
	END
	------------------------------
	UPDATE Train SET Driver_ID=@DriverID, Coach_Yard_ID=null
	WHERE ID=@Train_ID
End

GO


