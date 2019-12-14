USE [master]
GO
/****** Object:  Database [RailWaySystemDB]    Script Date: 12/14/2019 11:42:13 PM ******/
CREATE DATABASE [RailWaySystemDB]
GO

SET ANSI_NULLS ON

SET ANSI_PADDING ON

SET ANSI_WARNINGS ON

SET ARITHABORT ON

SET CONCAT_NULL_YIELDS_NULL ON

SET NUMERIC_ROUNDABORT OFF

SET QUOTED_IDENTIFIER ON

USE [RailWaySystemDB]
GO
/****** Object:  Table [dbo].[Coach_Yard]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coach_Yard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Station_ID] [int] NOT NULL,
	[Size] [int] NOT NULL,
 CONSTRAINT [PK_COACH_YARD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [varchar](50) NOT NULL,
	[Last_name] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Birth_Date] [date] NOT NULL,
	[Salary] [int] NOT NULL,
	[Working_Hours] [int] NOT NULL,
	[JobID] [int] NOT NULL,
	[StationID] [int] NULL,
 CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee_Contact]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee_Contact](
	[Employee_ID] [int] NOT NULL,
	[Email] [varchar](50) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Street] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EMPLOYEE_CONTACT] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee_Phone]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Phone](
	[Employee_ID] [int] NOT NULL,
	[Code] [int] NOT NULL,
	[Number] [int] NOT NULL,
 CONSTRAINT [PK_EMPLOYEE_PHONE] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC,
	[Code] ASC,
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Job]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Job](
	[ID] [int] NOT NULL,
	[Job_Description] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Job_Description] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Passenger]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Passenger](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[First_name] [varchar](50) NOT NULL,
	[Last_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PASSENGER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[First_name] ASC,
	[Last_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Passenger_Contact]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Passenger_Contact](
	[Passenger_ID] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Street] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PASSENGER_CONTACT] PRIMARY KEY CLUSTERED 
(
	[Passenger_ID] ASC,
	[Email] ASC,
	[City] ASC,
	[State] ASC,
	[Street] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Passenger_Phone]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger_Phone](
	[Passenger_ID] [int] NOT NULL,
	[Code] [int] NOT NULL,
	[Number] [int] NOT NULL,
 CONSTRAINT [PK_PASSENGER_PHONE] PRIMARY KEY CLUSTERED 
(
	[Passenger_ID] ASC,
	[Code] ASC,
	[Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Passenger_Subscription]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Passenger_Subscription](
	[Passenger_ID] [int] NOT NULL,
	[Subscription_ID] [int] NOT NULL,
	[Exp_Date] [date] NOT NULL,
 CONSTRAINT [PK_PASSENGER_SUBSCRIPTION] PRIMARY KEY CLUSTERED 
(
	[Passenger_ID] ASC,
	[Subscription_ID] ASC,
	[Exp_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Repair_Yard]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repair_Yard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Station_ID] [int] NOT NULL,
	[Size] [int] NOT NULL,
 CONSTRAINT [PK_REPAIR_YARD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Route]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Route](
	[Source_ID] [int] NOT NULL,
	[Destination_ID] [int] NOT NULL,
	[Distance] [int] NOT NULL,
 CONSTRAINT [PK_ROUTE] PRIMARY KEY CLUSTERED 
(
	[Source_ID] ASC,
	[Destination_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Station]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Station](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Street] [int] NOT NULL,
 CONSTRAINT [PK_STATION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subscription](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fees] [int] NOT NULL,
	[Class] [varchar](1) NOT NULL,
	[No_Trips] [int] NOT NULL,
 CONSTRAINT [PK_SUBSCRIPTION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ticket](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Class] [char](1) NOT NULL,
	[Price] [int] NOT NULL,
	[Date] [date] NULL,
	[Booking_Clerk_ID] [int] NULL,
	[Passenger_ID] [int] NULL,
	[Trip_ID] [int] NOT NULL,
 CONSTRAINT [PK_TICKET] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Train]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Train](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
	[Color] [varchar](50) NOT NULL,
	[No_Seats] [int] NOT NULL,
	[Speed] [int] NOT NULL,
	[No_Cars] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Driver_ID] [int] NULL,
	[Repair_Yard_ID] [int] NULL,
	[Coach_Yard_ID] [int] NULL,
	[BoughtByID] [int] NULL,
 CONSTRAINT [PK_TRAIN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Trip]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trip](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Dept_Time] [date] NOT NULL,
	[Arr_Time] [date] NOT NULL,
	[Type] [int] NOT NULL,
	[Source_ID] [int] NOT NULL,
	[Destintaion_ID] [int] NOT NULL,
	[Train_ID] [int] NOT NULL,
	[StManager_ID] [int] NULL,
 CONSTRAINT [PK_TRIP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USER]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[PasswordHash] [binary](64) NOT NULL,
	[EmployeeID] [int] NULL,
	[IsAdmin] [bit] NULL,
	[Salt] [uniqueidentifier] NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON

SET ANSI_PADDING ON

SET ANSI_WARNINGS ON

SET ARITHABORT ON

SET CONCAT_NULL_YIELDS_NULL ON

SET NUMERIC_ROUNDABORT OFF

SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Index [Driver_ID_UNQUE]    Script Date: 12/14/2019 11:42:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Driver_ID_UNQUE] ON [dbo].[Train]
(
	[Driver_ID] ASC
)
WHERE ([Driver_ID] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [EmployeeID_UNQUE]    Script Date: 12/14/2019 11:42:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [EmployeeID_UNQUE] ON [dbo].[USER]
(
	[EmployeeID] ASC
)
WHERE ([EmployeeID] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Coach_Yard]  WITH CHECK ADD FOREIGN KEY([Station_ID])
REFERENCES [dbo].[Station] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([JobID])
REFERENCES [dbo].[Job] ([ID])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([StationID])
REFERENCES [dbo].[Station] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Employee_Contact]  WITH CHECK ADD FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee_Phone]  WITH CHECK ADD FOREIGN KEY([Employee_ID])
REFERENCES [dbo].[Employee] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Passenger_Contact]  WITH CHECK ADD FOREIGN KEY([Passenger_ID])
REFERENCES [dbo].[Passenger] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Passenger_Phone]  WITH CHECK ADD FOREIGN KEY([Passenger_ID])
REFERENCES [dbo].[Passenger] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Passenger_Subscription]  WITH CHECK ADD FOREIGN KEY([Passenger_ID])
REFERENCES [dbo].[Passenger] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Passenger_Subscription]  WITH CHECK ADD FOREIGN KEY([Subscription_ID])
REFERENCES [dbo].[Subscription] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Repair_Yard]  WITH CHECK ADD FOREIGN KEY([Station_ID])
REFERENCES [dbo].[Station] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Route]  WITH CHECK ADD FOREIGN KEY([Destination_ID])
REFERENCES [dbo].[Station] ([ID])
GO
ALTER TABLE [dbo].[Route]  WITH CHECK ADD FOREIGN KEY([Source_ID])
REFERENCES [dbo].[Station] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([Booking_Clerk_ID])
REFERENCES [dbo].[Employee] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([Passenger_ID])
REFERENCES [dbo].[Passenger] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD FOREIGN KEY([Trip_ID])
REFERENCES [dbo].[Trip] ([ID])
GO
ALTER TABLE [dbo].[Train]  WITH CHECK ADD FOREIGN KEY([BoughtByID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Train]  WITH CHECK ADD FOREIGN KEY([Coach_Yard_ID])
REFERENCES [dbo].[Coach_Yard] ([ID])
GO
ALTER TABLE [dbo].[Train]  WITH CHECK ADD FOREIGN KEY([Driver_ID])
REFERENCES [dbo].[Employee] ([ID])
GO
ALTER TABLE [dbo].[Train]  WITH CHECK ADD FOREIGN KEY([Repair_Yard_ID])
REFERENCES [dbo].[Repair_Yard] ([ID])
GO
ALTER TABLE [dbo].[Trip]  WITH CHECK ADD FOREIGN KEY([Source_ID], [Destintaion_ID])
REFERENCES [dbo].[Route] ([Source_ID], [Destination_ID])
GO
ALTER TABLE [dbo].[Trip]  WITH CHECK ADD FOREIGN KEY([StManager_ID])
REFERENCES [dbo].[Employee] ([ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Trip]  WITH CHECK ADD FOREIGN KEY([Train_ID])
REFERENCES [dbo].[Train] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[USER]  WITH CHECK ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employee] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Route]  WITH CHECK ADD  CONSTRAINT [RouteCheck] CHECK  (([Destination_ID]<>[Source_ID]))
GO
ALTER TABLE [dbo].[Route] CHECK CONSTRAINT [RouteCheck]
GO
ALTER TABLE [dbo].[Train]  WITH CHECK ADD  CONSTRAINT [TrainCheck] CHECK  (([Driver_ID] IS NOT NULL AND [Repair_Yard_ID] IS NULL AND [Coach_Yard_ID] IS NULL OR [Driver_ID] IS NULL AND [Repair_Yard_ID] IS NOT NULL AND [Coach_Yard_ID] IS NULL OR [Driver_ID] IS NULL AND [Repair_Yard_ID] IS NULL AND [Coach_Yard_ID] IS NOT NULL))
GO
ALTER TABLE [dbo].[Train] CHECK CONSTRAINT [TrainCheck]
GO
ALTER TABLE [dbo].[USER]  WITH CHECK ADD  CONSTRAINT [USER_CHECK] CHECK  (([IsAdmin]=(1) AND [EmployeeID] IS NULL OR [IsAdmin]=(0) AND [EmployeeID] IS NOT NULL))
GO
ALTER TABLE [dbo].[USER] CHECK CONSTRAINT [USER_CHECK]
GO
/****** Object:  StoredProcedure [dbo].[Add_Subscription]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new clerk into the DB
Create Procedure [dbo].[Add_Subscription]

	@Fees int,
	@Class varchar(1),
	@No_Trips int
As
Begin
	
	
	-- Inserting into the Trip table
	INSERT INTO [Subscription]  values(@Fees,@Class,@No_Trips)
End


GO
/****** Object:  StoredProcedure [dbo].[AddCoachYard]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[AddCoachYard]
	@size int,
	@stid int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	insert into Coach_Yard (Station_ID, Size)
	values(@stid, @size)
END

GO
/****** Object:  StoredProcedure [dbo].[AddRepairYard]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- Create date: 7/12/2019
-- Description:	Add a new repair yard
-- =============================================
CREATE PROCEDURE [dbo].[AddRepairYard]
	-- Add the parameters for the stored procedure here
	@station_id int,
	@size int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Repair_Yard values(@station_id, @size)
END

GO
/****** Object:  StoredProcedure [dbo].[AddRoute]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- Create date: 7/12/2019
-- Description:	Add a new route
-- =============================================
CREATE PROCEDURE [dbo].[AddRoute] 
	-- Add the parameters for the stored procedure here
	@source_id int,
	@dest_id int,
	@distance int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into Route values(@source_id, @dest_id, @distance)

	return @@rowcount
END

GO
/****** Object:  StoredProcedure [dbo].[Book_Seat]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new clerk into the DB
Create Procedure [dbo].[Book_Seat]

	@Class varchar(1), 
	@Date date,
	@Price int,
	@Trip_ID int,
	@Booking_Clerk_ID int,
	@Passenger_ID int
As
Begin

	
	-- Inserting into the Trip table
	insert into [Ticket] values(@Class , @Price ,@Date , @Trip_ID ,@Booking_Clerk_ID,@Passenger_ID )
End


GO
/****** Object:  StoredProcedure [dbo].[Cancel_Ticket]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new clerk into the DB
Create Procedure [dbo].[Cancel_Ticket]

	@Ticket_ID int
As
Begin

	
	-- Inserting into the Trip table
	Delete from [Ticket] where Ticket.ID=@Ticket_ID
End


GO
/****** Object:  StoredProcedure [dbo].[ChangePassword]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 13/12/2019
-- Description:	Change Password
-- =============================================
CREATE PROCEDURE [dbo].[ChangePassword]
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
/****** Object:  StoredProcedure [dbo].[ChangeUsername]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 13/12/2019
-- Description:	ChangeUsername
-- =============================================
CREATE PROCEDURE [dbo].[ChangeUsername]
	-- Add the parameters for the stored procedure here
	@ID INT,
	@Username varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [USER] SET Username=@Username WHERE ID=@ID
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteStation]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteStation]
	@id int
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM Station
	WHERE ID = @id;
	DELETE FROM Route
	WHERE Destination_ID = @id;

	
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 13/12/2019
-- Description:	Delete user by id
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUser]
	-- Add the parameters for the stored procedure here
	@ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [USER] WHERE ID=@ID
END

GO
/****** Object:  StoredProcedure [dbo].[get_emp_id_userId]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new driver into the DB
Create Procedure [dbo].[get_emp_id_userId]
@UserID int
As
Begin

	-- Inserting Driver's basic info in the Employee table

	
	-- Inserting the Driver into the Driver table
	select EmployeeID from dbo.[USER] where dbo.[USER].ID=@UserID
End

GO
/****** Object:  StoredProcedure [dbo].[GetAllAdmins]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 13/12/2019
-- Description:	GetAllAdmins
-- =============================================
CREATE PROCEDURE [dbo].[GetAllAdmins]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT ID, Username FROM [USER] WHERE IsAdmin=1
END

GO
/****** Object:  StoredProcedure [dbo].[getAllEmps]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAllEmps] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from Employee
	return @@rowcount
END

GO
/****** Object:  StoredProcedure [dbo].[GetAllTrains]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 14/12/2019
-- Description:	GetAllTrains
-- =============================================
CREATE PROCEDURE [dbo].[GetAllTrains]	
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Train
END

GO
/****** Object:  StoredProcedure [dbo].[GetUserJob]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 12/9/2019
-- Description:	Get Employee Job
-- =============================================
CREATE PROCEDURE [dbo].[GetUserJob]
	-- Add the parameters for the stored procedure here
	@UserID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF ((SELECT IsAdmin FROM [USER] WHERE ID=@UserID) = 1)
	BEGIN
		SELECT 'Admin'
	END
	ELSE
	BEGIN
		DECLARE @EmpID INT = (SELECT EmployeeID FROM [USER] WHERE ID=@UserID)
		DECLARE @JobID INT = (SELECT JobID FROM Employee WHERE ID=@EmpID)
		SELECT Job_Description FROM JOB WHERE ID=@JobID 
	END
END

GO
/****** Object:  StoredProcedure [dbo].[GetUsername]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 12/4/2019
-- Description:	GetUsername
-- =============================================
CREATE PROCEDURE [dbo].[GetUsername]
	-- Add the parameters for the stored procedure here
	@ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Username FROM [USER] WHERE ID=@ID
END

GO
/****** Object:  StoredProcedure [dbo].[InsertEmp]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new employee into the Employee table
CREATE PROCEDURE [dbo].[InsertEmp] 

	@fname varchar(50),
	@lname varchar(50),
	@age int,
	@bd date,
	@salary int,
	@working_hours int,
	@jobid int,
	@station_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Inserting the employee into Employee table
	Insert into Employee 
	values (@fname, @lname, @age, @bd, @salary, @working_hours,@jobid, @station_id);

	-- Returning the id of the inserted employee
	return @@identity
END

GO
/****** Object:  StoredProcedure [dbo].[InsertPassenger]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertPassenger]
	@fname varchar(50),
	@lname varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into Passenger
	values(@fname, @lname);
END

GO
/****** Object:  StoredProcedure [dbo].[InsertStation]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertStation]
	@name varchar(50),
	@state varchar(50),
	@city varchar(50),
	@street int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO Station
	values (@name, @city, @state, @street);

	return @@identity
	
END

GO
/****** Object:  StoredProcedure [dbo].[InsertTrain]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[InsertTrain]
	-- Add the parameters for the stored procedure here
	@Model varchar(50),
	@Status BIT=1,   -- 0 Needs Fixing
	@Color varchar(50),
	@No_Seats integer,
	@Speed integer,
	@No_Cars integer,
	@Date date,
	@Driver_ID integer=null,
	@Repair_Yard_ID integer=null,
	@Coach_Yard_ID integer=null,
	@BoughtByID int=null         
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Train
	(Model, [Status], Color, No_Seats, Speed, No_Cars, [Date], Driver_ID, Repair_Yard_ID, Coach_Yard_ID, BoughtByID)
	VALUES
	(@Model, @Status, @Color, @No_Seats, @Speed, @No_Cars, @Date, @Driver_ID, @Repair_Yard_ID, @Coach_Yard_ID, @BoughtByID)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertTrip]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new clerk into the DB
Create Procedure [dbo].[InsertTrip]
	@Dept_Time date, 
	@Arr_Time date,
	@Type int, 
	@Destination_ID int,
	@Source_ID int,
	@Train_ID int,
	@St_Manager_ID int

As
Begin

	
	-- Inserting into the Trip table
	insert into [Trip] values(@Dept_Time , @Arr_Time ,@Type , @Source_ID ,@Destination_ID,@Train_ID ,@St_Manager_ID )
End


GO
/****** Object:  StoredProcedure [dbo].[InsertUser]    Script Date: 12/14/2019 11:42:13 PM ******/
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

GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Abdelrahman Tarek
-- Create date: 11/29/2019
-- Description:	Login
-- =============================================
CREATE PROCEDURE [dbo].[Login]
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
	
	SELECT @responseMessage as response, @ID as ID

END
	
GO
/****** Object:  StoredProcedure [dbo].[Remove_Subscription]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Inserting a new clerk into the DB
Create Procedure [dbo].[Remove_Subscription]

	@Subscription_ID int
As
Begin

	
	-- Inserting into the Trip table
	Delete from [Subscription] where Subscription.ID=@Subscription_ID
End


GO
/****** Object:  StoredProcedure [dbo].[RemoveCoachYard]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[RemoveCoachYard] 
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Coach_Yard where ID = @id

	return @@rowcount
END

GO
/****** Object:  StoredProcedure [dbo].[RemoveRepairYard]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- Create date: 7/12/2019
-- Description:	Removes a repair yard
-- =============================================
CREATE PROCEDURE	[dbo].[RemoveRepairYard] 
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from Repair_Yard where ID = @id

	return @@rowcount
END

GO
/****** Object:  StoredProcedure [dbo].[RemoveRoute]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- Create date: 7/12/2019
-- Description:	Remove the route joining the two provided stations
-- =============================================
CREATE PROCEDURE [dbo].[RemoveRoute] 
	-- Add the parameters for the stored procedure here
	@source_id int,
	@dest_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Delete from Route where Source_ID = @source_id and Destination_ID = @dest_id
	
END

GO
/****** Object:  StoredProcedure [dbo].[RemoveTrain]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RemoveTrain]
	-- Add the parameters for the stored procedure here
	@ID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Train WHERE ID=@ID 
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateSalary]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateSalary] 
	@id int,
	@sal int 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Employee 
	SET Salary = @sal
	WHERE ID = @id

END

GO
/****** Object:  StoredProcedure [dbo].[UpdateStation]    Script Date: 12/14/2019 11:42:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Mohamed Abobakr
-- Create date: 7/12/2019
-- Description:	Update the name of the station with the provided id
-- =============================================
CREATE PROCEDURE [dbo].[UpdateStation] 
	-- Add the parameters for the stored procedure here
	@id int,
	@name varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Station set Name = @name where id = @id
	 
END

GO
USE [master]
GO
ALTER DATABASE [RailWaySystemDB] SET  READ_WRITE 
GO
