Use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
CREATE PROCEDURE InsertEcontact
		@id int,
		@email varchar(50),
		@city varchar(50),
		@state varchar(50),
		@street varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into Employee_Contact values(@id, @email, @city, @state, @street)
	
	return @@rowcount
END
GO
