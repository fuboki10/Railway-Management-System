-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 13/12/2019
-- Description:	Change Password
-- =============================================
CREATE PROCEDURE ChangePassword
	-- Add the parameters for the stored procedure here
	@ID INT,
	@OldPassword varchar(20),
	@NewPassword varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [USER] SET PasswordHash=HASHBYTES('SHA2_512', @NewPassword + CAST(Salt AS varchar(36)))
	WHERE ID=@ID AND PasswordHash=HASHBYTES('SHA2_512', @OldPassword+CAST(Salt AS VARCHAR(36)))
	
END
GO
