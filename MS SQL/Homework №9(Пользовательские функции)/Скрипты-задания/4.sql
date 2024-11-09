USE SportsShop

--4. ���������������� ������� ���������� ���������� � ��������� ��������� ������. �������� ����������� ���������� ���������� ������: ���� �������
GO
CREATE FUNCTION GetMaxDate()
RETURNS DATE
AS
BEGIN
	DECLARE @SaleDate DATE
	SELECT TOP 1 @SaleDate = S.SaleDate
	FROM Products P JOIN SalersProducts SP ON SP.ProductID = P.ProductID
	JOIN Sales S ON S.SaleID = SP.SaleID
	ORDER BY S.SaleDate DESC
	RETURN @SaleDate;
END;