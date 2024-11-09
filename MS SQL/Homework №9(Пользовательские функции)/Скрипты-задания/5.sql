USE SportsShop

--5. ���������������� ������� ���������� ���������� � ������ ��������� ������. �������� ����������� ������� ���������� ������: ���� �������

GO
CREATE FUNCTION GetMinDate()
RETURNS DATE
AS
BEGIN
	DECLARE @SaleDate DATE
	SELECT TOP 1 @SaleDate = S.SaleDate
	FROM Products P JOIN SalersProducts SP ON SP.ProductID = P.ProductID
	JOIN Sales S ON S.SaleID = SP.SaleID
	ORDER BY S.SaleDate ASC
	RETURN @SaleDate;
END;