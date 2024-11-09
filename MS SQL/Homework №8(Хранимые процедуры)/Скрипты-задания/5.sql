USE SportsShop

-- 5. Хранимая процедура проверяет есть ли хоть один товар указанного производителя в наличии. 
--Название производителя передаётся в качестве параметра. 
--По итогам работы хранимая процедура должна вернуть yes в том случае, если товар есть, и no, если товара нет.

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
