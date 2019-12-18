use RailWaySystemDB
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 12/18/2019
-- Description:	Check that username exists in database
-- =============================================
CREATE PROCEDURE CheckUsername
	-- Add the parameters for the stored procedure here
	@Username varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF (EXISTS (SELECT * FROM [USER] WHERE Username=@Username))
	BEGIN 
		SELECT 1
	END
	ELSE
		SELECT 0
END
GO
