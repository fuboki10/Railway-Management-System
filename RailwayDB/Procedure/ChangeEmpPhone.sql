USE [RailWaySystemDB]
GO
/****** Object:  StoredProcedure [dbo].[ChangePhone]    Script Date: 12/15/2019 6:03:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[ChangeEmpPhone]
	@code int,
	@id int,
	@phone int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update Employee_Phone
	set Code = @code, Number = @phone
	where Employee_ID = @id;
END
