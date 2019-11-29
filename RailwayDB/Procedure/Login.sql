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
use [RailWaySystemDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 11/29/2019
-- Description:	Login
-- =============================================
CREATE PROCEDURE [Login]
    @UserName VARCHAR(20),
    @Password VARCHAR(20),
    @responseMessage VARCHAR(250)='' OUTPUT
AS
BEGIN

    SET NOCOUNT ON

    DECLARE @ID INT

    IF EXISTS (SELECT ID FROM [USER] WHERE Username=@UserName)
    BEGIN
        SET @ID=(SELECT ID FROM [USER] WHERE Username=@UserName AND PasswordHash=HASHBYTES('SHA2_512', @Password+CAST(Salt AS VARCHAR(36))))

       IF(@ID IS NULL)
           SET @responseMessage='Incorrect password'
       ELSE 
           SET @responseMessage='User successfully logged in'
    END
    ELSE
       SET @responseMessage='Invalid login'

END
	