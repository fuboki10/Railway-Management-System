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
alter PROCEDURE GetAllSubs
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 'Price:'+CAST(Fees as varchar(10))+' Class:'+Class+' trips no:'+CAST(No_Trips as varchar(10)) as Atributes , ID from Subscription 
END
GO
