USE SportsShop

--1. - Пользовательская функция возвращает количество уникальных покупателей
--не понял, как сделать, сделал, что смог; работает, но как-то не так, скорее всего

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
	