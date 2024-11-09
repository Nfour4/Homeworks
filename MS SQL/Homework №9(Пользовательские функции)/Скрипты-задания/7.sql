USE SportsShop

--6. ���������������� ������� ���������� ���������� � �����������, ������� � ���� ���� ���������� 45 ���

--������� � ����� �� ��� ������� ����������, ������� � ������� ��� �� "������� ������ ����� ���� �������������, ������� ��������� ������� ������ 2-� ��� �����"
--������� GetSaleDate ����������� � ��������� �������

GO
CREATE FUNCTION GetMoreThanTwo()
RETURNS TABLE
AS
RETURN(
	SELECT C.FirstName + ' ' + C.MiddleName + ' ' + C.LastName AS FullName, dbo.GetSaleDate(SaleDate) AS SaleDate
	FROM Sales S JOIN Clients C ON C.ClientID = S.SaleID
	WHERE dbo.GetSaleDate(SaleDate) > 2
);