USE SportsShop

--1. - ���������������� ������� ���������� ���������� ���������� �����������
--�� �����, ��� �������, ������, ��� ����; ��������, �� ���-�� �� ���, ������ �����

GO
CREATE FUNCTION GetUniqueCount()
RETURNS INT
AS
BEGIN
	DECLARE @Count INT
	SELECT @Count = COUNT(*)
	FROM (
		SELECT ClientID FROM Clients
		GROUP BY ClientID HAVING COUNT(ClientID) = 1
	) AS C
	RETURN @Count;
END;
	