USE SportsShop

-- 6. �������� ��������� ���������� ���������� � ����� ���������� ������������� ����� �����������. 
--������������ ����� ����������� ������������ �� ����� ����� ������.

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