USE SportsShop

--3.���������������� ������� ���������� ������� ���� ������� �� ������ ����, ����� �������������� �������

GO
CREATE FUNCTION GetAvgPriceDate(
	@SaleDate DATE
)
RETURNS DECIMAL(7,2)
AS
BEGIN
	DECLARE @Avg DECIMAL(7,2)
	SELECT @Avg = AVG(P.SellPrice)
	FROM Products P JOIN SalersProducts SP ON SP.ProductID = P.ProductID
	JOIN Sales S ON S.SaleID = SP.SaleID
	WHERE S.SaleDate = @SaleDate 
	GROUP BY P.SellPrice
	RETURN @Avg;
END;