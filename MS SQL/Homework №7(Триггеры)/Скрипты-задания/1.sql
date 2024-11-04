USE SportsShop

-- 1. При добавлении нового товара триггер проверяет его наличие на складе, если такой товар есть и новые данные о товаре совпадают с уже существующими данными, вместо добавления происходит обновление информации о количестве товара.

GO
CREATE TRIGGER CheckProductAvailabilityTrigger
ON Products
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM Products P
        INNER JOIN Inserted I ON P.ProductName = I.ProductName AND P.CategoryID = I.CategoryID AND P.MakerID = I.MakerID
    )
    BEGIN
        UPDATE Products
        SET AvailableQuantity = I.AvailableQuantity + 1
        FROM Products P
        INNER JOIN Inserted I ON P.ProductName = I.ProductName AND P.CategoryID = I.CategoryID AND P.MakerID = I.MakerID
    END
    ELSE
    BEGIN
        INSERT INTO Products(ProductName, CategoryID, AvailableQuantity, NetPrice, SellPrice, MakerID)
        SELECT ProductName, CategoryID, AvailableQuantity, NetPrice, SellPrice, MakerID FROM Inserted;
    END
END
GO