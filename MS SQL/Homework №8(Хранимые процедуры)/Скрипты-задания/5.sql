USE SportsShop

-- 5. �������� ��������� ��������� ���� �� ���� ���� ����� ���������� ������������� � �������. 
--�������� ������������� ��������� � �������� ���������. 
--�� ������ ������ �������� ��������� ������ ������� yes � ��� ������, ���� ����� ����, � no, ���� ������ ���.

GO
CREATE PROCEDURE CheckProductByManufacturer(
    @Manufacturer NVARCHAR(MAX),
    @Result NVARCHAR(10) OUTPUT
)
AS
BEGIN
    IF EXISTS (SELECT *
			   FROM Products P JOIN Makers M ON M.MakerID = P.MakerID  
			   WHERE M.MakerName = @Manufacturer AND P.AvailableQuantity > 0)
        SET @Result = 'yes';
    ELSE
        SET @Result = 'no';
	SELECT MakerName, @Result AS Result
	FROM Makers
	WHERE MakerName = @Manufacturer
END
