USE [OfficeSupplies]
GO

/****** Объект: SqlProcedure [dbo].[MaxProfitProduct] Дата скрипта: 17.11.2024 18:57:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MaxProfitProduct]
AS
	SELECT P.Id,
		   P.ProductName,
		   P.ProductType,
		   P.Cost,
		   P.Price,
		   P.Quantity
FROM Sales S JOIN Products P ON P.Id = S.ProductId
JOIN Employees E ON S.EmployeeId = E.Id
WHERE S.Quantity * P.Price * P.Quantity IN (SELECT MAX(S.Quantity * P.Price * P.Quantity)
					 FROM Sales S JOIN Products P ON P.Id = S.ProductId)
RETURN 0
