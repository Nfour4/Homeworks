USE Academy2
-- ������� ������� ��� ���� �.�.
SELECT Surname AS [Assistant's Surname]
FROM Teachers
WHERE IsAssistant = 1 AND (Salary < 28000 OR Premium < 4000)