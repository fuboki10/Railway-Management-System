Use RailWaySystemDB

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE getAllEmps 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
	SELECT E.ID as 'ID', First_name as 'First Name', Last_name as 'Last Name',
	 CAST(Birth_Date AS varchar(10)) AS 'Birth Date',
	 CAST(DATEDIFF(DD, Birth_Date, GETDATE()) / 365.25 AS INT) AS 'Age', 
	 Salary, Working_Hours, Job_Description AS 'Job', S.Name AS 'Station'  
	FROM (Employee E INNER JOIN Job J ON E.JobID=J.ID) INNER JOIN Station S ON S.ID=E.StationID 
END
GO