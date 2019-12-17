use RailWaySystemDB
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		ali abozied
-- Create date: 16/12/2019
-- Description:	getallPassengers
-- =============================================
CREATE PROCEDURE GetALLPassengers 
	
AS
BEGIN
	SELECT * from Passenger
END
GO