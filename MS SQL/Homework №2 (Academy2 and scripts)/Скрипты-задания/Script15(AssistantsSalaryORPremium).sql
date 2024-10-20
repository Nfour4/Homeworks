USE Academy2
-- изменил условия под свою б.д.
SELECT Surname AS [Assistant's Surname]
FROM Teachers
WHERE IsAssistant = 1 AND (Salary < 28000 OR Premium < 4000)