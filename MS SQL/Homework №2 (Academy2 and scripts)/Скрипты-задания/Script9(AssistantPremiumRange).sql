USE Academy2
-- ������� ������� ������� ��� ����, �.�. ������� �������� ���
SELECT Surname, Position, Salary, Premium
FROM Teachers
WHERE Premium > 1600 AND Premium < 5500;