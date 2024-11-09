USE SportsShop

GO
CREATE FUNCTION GetSaleDate
(
	@SaleDate DATE
)
RETURNS INT
AS
BEGIN
	DECLARE @Date INT;

	SET @Date = DATEDIFF(YEAR, @SaleDate, GETDATE())

	RETURN @Date;
END;

