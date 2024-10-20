USE Academy2
-- изменил условия под свою б.д.
SELECT Surname
FROM Teachers
WHERE IsAssistant = 1 AND (Premium+Salary) < 28000