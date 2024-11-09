USE SportsShop

-- 4. �������� ��������� ���������� ���������� � ����� �������� ��������. ���������� ������������ �� ����� ����� ������ �� �� �����.

GO
CREATE PROCEDURE GetMostSuccessfulEmployee
AS
BEGIN
    SELECT TOP 1 E.FirstName + ' ' + E.MiddleName + ' ' + E.LastName AS FullName , COUNT(S.SaleID) as TotalQuantity
    FROM Employees E JOIN Sales S ON E.EmployeeID = S.EmployeeID
	GROUP BY E.FirstName, E.MiddleName, E.LastName
    ORDER BY TotalQuantity DESC;
END