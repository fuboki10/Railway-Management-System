use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 21/12/2019
-- Description:	connect ticket to passenger
-- =============================================
alter PROCEDURE connectTicket
@PassengerID int,
@BookingeClerkID int,
@Date varchar(50),
@ID int
AS
BEGIN
Update Ticket set Passenger_ID=@PassengerID , Date=@Date ,Booking_Clerk_ID=@BookingeClerkID where ID=@ID  
END
GO
