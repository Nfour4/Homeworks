USE SportsShop

--6. Пользовательская функция возвращает информацию о покупателях, которым в этом году исполнится 45 лет

--сделать с нашей БД это задание невозможно, поэтому я заменил его на "вывести полные имена всех пользователей, которые совершали покупки больше 2-х лет назад"
--функцию GetSaleDate прикладываю в отдельном скрипте

GO
CREATE FUNCTION GetMoreThanTwo()
RETURNS TABLE
AS
RETURN(
	SELECT C.FirstName + ' ' + C.MiddleName + ' ' + C.LastName AS FullName, dbo.GetSaleDate(SaleDate) AS SaleDate
	FROM Sales S JOIN Clients C ON C.ClientID = S.SaleID
	WHERE dbo.GetSaleDate(SaleDate) > 2
);