USE [OfficeSupplies]
GO

/****** Объект: SqlProcedure [dbo].[GetMoreThan2] Дата скрипта: 17.11.2024 17:39:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetMoreThan2]
AS
	SELECT DISTINCT E.Id, E.FirstName, E.LastName  
	FROM Employees E JOIN Sales S ON E.Id = S.EmployeeId
	WHERE S.EmployeeId IN (SELECT EmployeeId 
			   FROM Sales
			   GROUP BY EmployeeId
			   HAVING COUNT(*) > 2)
RETURN 0
