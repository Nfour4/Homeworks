USE Academy2
-- ������� ������� ��� ���� �.�.
SELECT Surname
FROM Teachers
WHERE IsAssistant = 1 AND (Premium+Salary) < 28000