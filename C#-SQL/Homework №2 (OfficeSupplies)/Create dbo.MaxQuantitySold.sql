USE [OfficeSupplies]
GO

/****** Объект: SqlProcedure [dbo].[MaxQuantitySold] Дата скрипта: 17.11.2024 18:57:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MaxQuantitySold]
AS
	SELECT P.Id,
		   P.ProductName,
		   P.ProductType,
		   P.Cost,
		   P.Price,
		   P.Quantity
FROM Sales S JOIN Products P ON P.Id = S.ProductId
WHERE S.Quantity IN (SELECT MAX(S.Quantity)
					 FROM Sales S)
RETURN 0
