USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new clerk into the DB
Create Procedure [dbo].[InsertTrip]
	@Dept_Time date, 
	@Arr_Time date,
	@Type int, 
	@Destination_ID int,
	@Source_ID int,
	@Train_ID int,
	@St_Manager_ID int

As
Begin

	
	-- Inserting into the Trip table
	insert into [Trip] values(@Dept_Time , @Arr_Time ,@Type , @Source_ID ,@Destination_ID,@Train_ID ,(select employeeid from [user] where id = @St_Manager_ID))
End

GO


