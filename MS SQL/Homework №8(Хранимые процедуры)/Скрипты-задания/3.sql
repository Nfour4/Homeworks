USE SportsShop

-- 3. ’ранима€ процедура показывает топ-3 самых старых клиентов. “оп-3 определ€етс€ по дате регистрации.
-- я заменил на вывод топ-3 самых старых клиентов не по дате регистрации, а по дате совершенной покупки.

GO
CREATE PROCEDURE GetOldestCustomers
AS
BEGIN
    SELECT TOP 3 C.FirstName + ' ' + C.MiddleName + ' ' + C.LastName AS FullName, S.SaleDate
    FROM Clients C JOIN Sales S ON C.ClientID = S.ClientID
    ORDER BY S.SaleDate ASC;
END