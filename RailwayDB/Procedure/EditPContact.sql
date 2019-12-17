use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 16/12/2019
-- Description:	Edit Passenger contact
-- =============================================
CREATE PROCEDURE EditPContact 
	-- Add the parameters for the stored procedure here
	@City varchar(50),
	@Email varchar(50),
	@State varchar(50),
	@Street varchar(50)

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if(@City!='')
	begin
	update   Passenger_Contact   set City = @City  where Email=@Email
	end  
	if(@State!='')
	begin
	update   Passenger_Contact   set  State=@State where Email=@Email
	end  
	if(@Street!='')
	begin
	update   Passenger_Contact   set  Street = @Street where Email=@Email
	end  
	select Passenger_ID from Passenger_Contact where Email=@Email
END
GO 