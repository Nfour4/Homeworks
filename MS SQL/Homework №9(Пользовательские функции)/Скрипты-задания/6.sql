USE SportsShop

--6. Пользовательская функция возвращает информацию о заданном виде товаров конкретного производителя. Вид товара и название производителя передаются в качестве параметров

GO
CREATE FUNCTION GetProductInfo(
	@CategoryName NVARCHAR(50),
	@MakerName NVARCHAR(50)
)
RETURNS TABLE
AS
RETURN(
	SELECT P.ProductName, P.AvailableQuantity, P.SellPrice, P.NetPrice, M.MakerName, C.CategoryName
	FROM Products P JOIN Categories C ON C.CategoryID = P.CategoryID
	JOIN Makers M ON M.MakerID = P.MakerID
	WHERE C.CategoryName = @CategoryName AND M.MakerName = @MakerName
	GROUP BY P.ProductName,  P.AvailableQuantity, P.SellPrice, P.NetPrice, M.MakerName, C.CategoryName
);