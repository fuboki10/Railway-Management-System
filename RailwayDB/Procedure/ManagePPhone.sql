use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 16/12/2019
-- Description:	Add Passenger Phone
-- =============================================
CREATE PROCEDURE AddPPhone 
	-- Add the parameters for the stored procedure here
	@fname varchar(50),
	@lname varchar(50),
	@code int,
	@number int

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Insert into Passenger_Phone Values((select ID from Passenger where First_name=@fname and Last_name=@lname),@code,@number)
END
GO 
use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 16/12/2019
-- Description:	edit Passenger Phone
-- =============================================
CREATE PROCEDURE EditPPhone 
	-- Add the parameters for the stored procedure here
	@fname varchar(50),
	@lname varchar(50),
	@code int,
	@number int

	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	update  Passenger_Phone
	set Code=@code , Number=@number
	where (select ID from Passenger where First_name=@fname and Last_name=@lname)=Passenger_ID	
END
GO 
use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 16/12/2019
-- Description:	Delete Passenger Phone
-- =============================================
Create PROCEDURE DeletePPhone 
	-- Add the parameters for the stored procedure here
	@fname varchar(50),
	@lname varchar(50),
	@code int,
	@number int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Delete from Passenger_Phone where (select ID from Passenger where First_name=@fname and Last_name=@lname)=Passenger_ID and @code =Code and @number=Number
	END
GO


 
use RailWaySystemDB
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 16/12/2019
-- Description:	veiw Passenger Phone
-- =============================================
Create PROCEDURE VeiwPPhone 
	-- Add the parameters for the stored procedure here
	@fname varchar(50),
	@lname varchar(50)
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	select @fname "First Name",@lname "Last Name",* from Passenger_Phone where (select ID from Passenger where First_name=@fname and Last_name=@lname)=Passenger_ID	
END
GO 

