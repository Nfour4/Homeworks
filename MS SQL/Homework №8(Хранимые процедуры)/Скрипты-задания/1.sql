USE SportsShop

-- 1. Хранимая процедура отображает полную информацию о всех товарах.

GO
CREATE PROCEDURE GetAllProducts
AS
BEGIN
	SELECT *
	FROM Products;
END