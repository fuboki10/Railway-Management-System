USE [RailWaySystemDB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new clerk into the DB
Create Procedure [dbo].[Book_Seat]

	@Class varchar(1), 
	@Date date,
	@Price int,
	@Trip_ID int,
	@Booking_Clerk_ID int,
	@Passenger_ID int
As
Begin

	
	-- Inserting into the Trip table
	insert into [Ticket] values(@Class , @Price ,@Date , @Trip_ID ,@Booking_Clerk_ID,@Passenger_ID )
End

GO


