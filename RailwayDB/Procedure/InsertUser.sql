USE [RailWaySystemDB]
GO
/****** Object:  StoredProcedure [dbo].[InsertUser]    Script Date: 12/13/2019 5:12:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new User into the DB
CREATE PROCEDURE [dbo].[InsertUser]
    @Username varchar(20), 
    @Password varchar(20),
	@EmployeeID int=null,
	@IsAdmin BIT=null,
    @responseMessage varchar(250)='' OUTPUT
AS
BEGIN
    SET NOCOUNT ON

    DECLARE @salt UNIQUEIDENTIFIER=NEWID()
    BEGIN TRY

	-- Inserting The user into User table
        INSERT INTO dbo.[User] (Username, PasswordHash, EmployeeID, IsAdmin, Salt)
        VALUES(@Username, HASHBYTES('SHA2_512', @Password+CAST(@salt AS VARCHAR(36))), @EmployeeID, @IsAdmin, @salt)
		
		-- Displaying The status of the insertion
       SET @responseMessage='Success'

    END TRY
    BEGIN CATCH
        SET @responseMessage=ERROR_MESSAGE() 
    END CATCH

	SELECT @responseMessage as response, @@identity as ID

	-- Returning The Id of the inserted user
END
