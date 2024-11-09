USE SportsShop

--2. ���������������� ������� ���������� ������� ���� ������ ����������� ����. 
--��� ������ ��������� � �������� ���������. ��������, ������� ���� �����

GO
CREATE FUNCTION GetAvgPrice
(
	@Category NVARCHAR(50)
)
RETURNS DECIMAL(7,2)
AS
BEGIN
	DECLARE @Avg DECIMAL(7,2)
	SELECT @Avg = AVG(P.SellPrice)
	FROM Products P JOIN Categories C ON C.CategoryID = P.CategoryID
	WHERE C.CategoryName = @Category
	GROUP BY P.SellPrice
	RETURN @Avg;
END;