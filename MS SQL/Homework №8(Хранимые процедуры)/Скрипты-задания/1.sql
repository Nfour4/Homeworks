USE SportsShop

-- 1. �������� ��������� ���������� ������ ���������� � ���� �������.

GO
CREATE PROCEDURE GetAllProducts
AS
BEGIN
	SELECT *
	FROM Products;
END