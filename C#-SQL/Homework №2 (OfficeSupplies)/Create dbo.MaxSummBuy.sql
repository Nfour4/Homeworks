USE [OfficeSupplies]
GO

/****** Объект: SqlProcedure [dbo].[MaxSummBuy] Дата скрипта: 17.11.2024 18:57:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MaxSummBuy]
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
		   S.Quantity,
		   (S.Quantity * P.Price * P.Quantity) AS [SUMMA]
FROM Sales S JOIN Products P ON P.Id = S.ProductId
JOIN Employees E ON S.EmployeeId = E.Id
WHERE S.Quantity * P.Price * P.Quantity IN (SELECT MAX(S.Quantity * P.Price * P.Quantity)
					 FROM Sales S JOIN Products P ON P.Id = S.ProductId)
RETURN 0
