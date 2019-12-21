use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 21/12/2019
-- Description:	get all subscription
-- =============================================
CREATE PROCEDURE InsertPsub
@PassengerID int,
@SubID int,
@expire varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Passenger_Subscription values(@PassengerID,@SubID,@expire);
END
GO
