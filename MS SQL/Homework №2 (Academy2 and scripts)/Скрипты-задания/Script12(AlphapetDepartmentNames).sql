USE Academy2
-- ������� ������� ��� ����, �.�. �������� ������� ���
SELECT DepartmentName AS [Name of Department]
FROM Departments
WHERE DepartmentName < 'MechanicalDept'
ORDER BY DepartmentName;