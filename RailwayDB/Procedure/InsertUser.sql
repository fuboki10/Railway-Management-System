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
USE [RailWaySystemDB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 11/29/2019
-- Description:	Add User with SHA2_512 Algorithm
-- =============================================
CREATE PROCEDURE InsertUser
    @Username varchar(20), 
    @Password varchar(20),
    @responseMessage varchar(250) OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @salt UNIQUEIDENTIFIER=NEWID()
    BEGIN TRY

        INSERT INTO dbo.[User] (Username, PasswordHash, Salt)
        VALUES(@Username, HASHBYTES('SHA2_512', @Password+CAST(@salt AS VARCHAR(36))), @salt)

       SET @responseMessage='Success'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

	SELECT @responseMessage as response

END
