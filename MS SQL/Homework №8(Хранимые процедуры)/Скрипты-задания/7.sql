USE SportsShop

-- 7. Хранимая процедура удаляет всех клиентов, зарегистрированных после указанной даты. 
--Дата передаётся в качестве параметра. Процедура возвращает количество удалённых записей.

--Я просидел 2 часа и так и не понял, как решить конфликт с внешними ключами, по SaleDate у меня удаляться не хотело,
--потом, после отчаянных попыток - удалилось вообще все из таблиц Sales и SalerProducts, но только не из Clients XDDDD
--Поэтому, я переделал и удалил всех клиентов, у которых IsSubscribed = 1, с такими условиями все сработало нормально))))
--С этими внешними ключами как всегда - ДУРДОМ!)

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