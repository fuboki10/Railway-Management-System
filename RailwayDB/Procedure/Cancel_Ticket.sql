
use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 21/12/2019
-- Description:	cancel ticket
-- =============================================
CREATE PROCEDURE CancelTicket
@ticketID int
AS
BEGIN
	update Ticket set Passenger_ID=null,Passenger_ID=null,Date=null where ID=@ticketID
END
GO
