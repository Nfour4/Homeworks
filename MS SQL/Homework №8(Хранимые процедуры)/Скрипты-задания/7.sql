USE SportsShop

-- 7. �������� ��������� ������� ���� ��������, ������������������ ����� ��������� ����. 
--���� ��������� � �������� ���������. ��������� ���������� ���������� �������� �������.

--� �������� 2 ���� � ��� � �� �����, ��� ������ �������� � �������� �������, �� SaleDate � ���� ��������� �� ������,
--�����, ����� ��������� ������� - ��������� ������ ��� �� ������ Sales � SalerProducts, �� ������ �� �� Clients XDDDD
--�������, � ��������� � ������ ���� ��������, � ������� IsSubscribed = 1, � ������ ��������� ��� ��������� ���������))))
--� ����� �������� ������� ��� ������ - ������!)

GO
CREATE PROCEDURE DeleteClientsIsSub
    @IsSub INT
AS
BEGIN
	DECLARE @DeletedCount INT
	SELECT @DeletedCount = COUNT(*)
	FROM Clients C
	WHERE IsSubscribed = @IsSub;
	
	DELETE
	FROM Clients
	WHERE IsSubscribed = @IsSub
	
	RETURN @DeletedCount;
END