use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 21/12/2019
-- Description:	get ticket with specifec attributes
-- =============================================
Create PROCEDURE getticketatt
@date1 varchar(50),
@date2 varchar(50),
@source int,
@Destination int,
@class varchar(50)
AS
BEGIN
select top 1 T.ID from Ticket T where T.Trip_ID = (select TR.ID from Trip Tr where @source=Tr.Source_ID and
@Destination=Tr.Destintaion_ID and Tr.Arr_Time>CAST(@date1 as Date) and Tr.Arr_Time<CAST(@date2 as Date) ) and Passenger_ID=null and @class=Class
END
GO
