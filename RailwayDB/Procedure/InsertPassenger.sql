USE [RailWaySystemDB]
GO
/****** Object:  StoredProcedure [dbo].[InsertEmp]    Script Date: 11/29/2019 4:26:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    -- Inserting the passenger into passenger table
CREATE PROCEDURE [dbo].[InsertPas] 

	@fname varchar(50),
	@lname varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Inserting the passenger into passenger table
	Insert into Passenger
	values (@fname, @lname);

	-- Returning the id of the inserted passenger
	return @@identity
END
