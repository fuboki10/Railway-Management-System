use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- Create date: 7/12/2019
-- Description:	Update the name of the station with the provided id
-- =============================================
CREATE PROCEDURE UpdateStation 
	-- Add the parameters for the stored procedure here
	@old_name varchar(50),
	@new_name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Station set Name = @new_name where Name = @old_name
	 return @@rowcount 
END
GO
