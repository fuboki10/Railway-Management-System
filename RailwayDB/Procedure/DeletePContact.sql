use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 17/12/2019
-- Description:	Delete Passenger Contact
-- =============================================
create PROCEDURE DeletePContact 
	@Email varchar(50)
AS
BEGIN
	declare @passenger int;
	set @passenger=(select Passenger_ID from Passenger_Contact where Passenger_Contact.Email=@Email)
	if (select count(*) from Passenger_Contact where Passenger_ID =@passenger) > 1 
	Begin
	select Passenger_ID from Passenger_Contact where Passenger_Contact.Email=@Email
	Delete from Passenger_Contact where @Email=Passenger_Contact.Email
	End
	else 
	begin
	select -1
	end
END
GO