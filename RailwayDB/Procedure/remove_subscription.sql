USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new clerk into the DB
Create Procedure [dbo].[Remove_Subscription]

	@Subscription_ID int
As
Begin

	
	-- Inserting into the Trip table
	Delete from [Subscription] where Subscription.ID=@Subscription_ID
End

GO

