USE SportsShop

-- 6. ’ранима€ процедура отображает информацию о самом попул€рном производителе среди покупателей. 
--ѕопул€рность среди покупателей определ€етс€ по общей сумме продаж.

GO
CREATE PROCEDURE GetMostPopularManufacturer
AS
BEGIN
    SELECT TOP 1 M.MakerName, COUNT(SP.SaleID) AS TotalQuantity
    FROM Makers M JOIN Products P ON M.MakerID = P.MakerID
	JOIN SalersProducts SP ON P.ProductID = SP.ProductID
    GROUP BY M.MakerName
    ORDER BY TotalQuantity DESC;
END