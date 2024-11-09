USE SportsShop

--6. ���������������� ������� ���������� ���������� � �������� ���� ������� ����������� �������������. ��� ������ � �������� ������������� ���������� � �������� ����������

GO
CREATE FUNCTION GetProductInfo(
	@CategoryName NVARCHAR(50),
	@MakerName NVARCHAR(50)
)
RETURNS TABLE
AS
RETURN(
	SELECT P.ProductName, P.AvailableQuantity, P.SellPrice, P.NetPrice, M.MakerName, C.CategoryName
	FROM Products P JOIN Categories C ON C.CategoryID = P.CategoryID
	JOIN Makers M ON M.MakerID = P.MakerID
	WHERE C.CategoryName = @CategoryName AND M.MakerName = @MakerName
	GROUP BY P.ProductName,  P.AvailableQuantity, P.SellPrice, P.NetPrice, M.MakerName, C.CategoryName
);