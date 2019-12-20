USE [RailWaySystemDB]
GO

/****** Object:  StoredProcedure [dbo].[Insert_Emp_Phone]    Script Date: 16/12/2019 19:08:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mohamed Abobakr
-- =============================================
create PROCEDURE [dbo].[Insert_Emp_Phone]
	@id int,
	@code varchar(10),
	@number varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	insert into Employee_Phone values (@id, @code, @number)
	return @@rowcount
END
GO


