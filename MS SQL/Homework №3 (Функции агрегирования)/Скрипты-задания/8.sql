USE Academy

--№8 - вывести средний фонд финансирования кафедр

SELECT 'Avg Financing' AS [AVG], AVG(D.Financing)
FROM Departments AS D