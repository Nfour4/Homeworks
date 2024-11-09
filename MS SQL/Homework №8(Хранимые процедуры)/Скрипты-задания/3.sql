USE SportsShop

-- 3. �������� ��������� ���������� ���-3 ����� ������ ��������. ���-3 ������������ �� ���� �����������.
-- � ������� �� ����� ���-3 ����� ������ �������� �� �� ���� �����������, � �� ���� ����������� �������.

GO
CREATE PROCEDURE GetOldestCustomers
AS
BEGIN
    SELECT TOP 3 C.FirstName + ' ' + C.MiddleName + ' ' + C.LastName AS FullName, S.SaleDate
    FROM Clients C JOIN Sales S ON C.ClientID = S.ClientID
    ORDER BY S.SaleDate ASC;
END