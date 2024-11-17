USE [OfficeSupplies]
GO

/****** Объект: SqlProcedure [dbo].[GetSales] Дата скрипта: 17.11.2024 17:16:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetSales]
AS
	SELECT S.Id,
		   E.Id,
		   E.FirstName,
		   E.LastName,
		   P.Id,
		   P.ProductName,
		   P.ProductType,
		   P.Cost,
		   P.Price,
		   P.Quantity,
		   S.CustomerName,
		   S.Quantity
	FROM Sales S JOIN Products P ON P.Id = S.ProductId
	JOIN Employees E ON S.EmployeeId = E.Id
RETURN 0
