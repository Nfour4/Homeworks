USE SportsShop

-- 2. �������� ��������� ���������� ������ ���������� � ������ ����������� ����. 
--��� ������ ��������� � �������� ���������. ��������, ���� � �������� ��������� ������� �����, 
--����� �������� ��� �����, ������� ���� � �������.

GO
CREATE PROCEDURE GetProductsByCategory
    @CategoryID INT
AS
BEGIN
    SELECT P.ProductName, C.CategoryName
    FROM Products P JOIN Categories C ON C.CategoryID = P.CategoryID
    WHERE P.CategoryID = @CategoryID;
END