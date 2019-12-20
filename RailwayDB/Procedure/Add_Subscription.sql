USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new clerk into the DB
Create Procedure [dbo].[Add_Subscription]

	@Fees int,
	@Class varchar(1),
	@No_Trips int
As
Begin
	
	
	-- Inserting into the Trip table
	INSERT INTO [Subscription]  values(@Fees,@Class,@No_Trips)
	return @@rowcount
End

GO

