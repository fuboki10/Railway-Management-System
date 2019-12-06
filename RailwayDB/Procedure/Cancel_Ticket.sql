USE [RailWaySystemDB]
GO

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

