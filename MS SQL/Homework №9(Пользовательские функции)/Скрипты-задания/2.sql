USE SportsShop

--2. Пользовательская функция возвращает среднюю цену товара конкретного вида. 
--Вид товара передаётся в качестве параметра. Например, среднюю цену обуви

GO
CREATE FUNCTION GetAvgPrice
(
	@Category NVARCHAR(50)
)
RETURNS DECIMAL(7,2)
AS
BEGIN
	DECLARE @Avg DECIMAL(7,2)
	SELECT @Avg = AVG(P.SellPrice)
	FROM Products P JOIN Categories C ON C.CategoryID = P.CategoryID
	WHERE C.CategoryName = @Category
	GROUP BY P.SellPrice
	RETURN @Avg;
END;