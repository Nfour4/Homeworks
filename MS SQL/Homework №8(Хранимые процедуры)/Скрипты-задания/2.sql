USE SportsShop

-- 2. Хранимая процедура показывает полную информацию о товаре конкретного вида. 
--Вид товара передаётся в качестве параметра. Например, если в качестве параметра указана обувь, 
--нужно показать всю обувь, которая есть в наличии.

GO
CREATE PROCEDURE GetProductsByCategory
    @CategoryID INT
AS
BEGIN
    SELECT P.ProductName, C.CategoryName
    FROM Products P JOIN Categories C ON C.CategoryID = P.CategoryID
    WHERE P.CategoryID = @CategoryID;
END