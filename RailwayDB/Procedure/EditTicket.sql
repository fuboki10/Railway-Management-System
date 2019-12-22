use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 21/12/2019
-- Description:	edit ticket
-- =============================================
alter PROCEDURE EditTicket
@ticketID int,
@class varchar(50),
@date varchar(50),
@BookingClerkID int
AS
BEGIN
	declare @Tripid int ;
	set @Tripid=(select Trip_ID from Ticket where ID =@ticketID)
	if(select count(*) from Ticket where Trip_ID=@Tripid and Class=@class and Passenger_ID is null)>0
	
	begin
		if(select Passenger_id from Ticket where ID=@ticketID) is null
		begin
		select -1;
		end
		else
		begin
		declare @passngerID int ;
		set @passngerID=(select Passenger_id from Ticket where ID=@ticketID);
		exec CancelTicket2
		@ticketID=@ticketID;
		declare @newticketid int ;
		set @newticketid =(select top 1 ID from Ticket where Trip_ID=@Tripid and Class=@class);
		exec connectTicket
		@PassengerID =@passngerID,
		@BookingeClerkID =@BookingClerkID,
		@Date =@date,
		@ID =@newticketid
		end
	end 
END
GO
