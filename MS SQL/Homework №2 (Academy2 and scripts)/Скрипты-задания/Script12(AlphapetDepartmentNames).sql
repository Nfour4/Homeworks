USE Academy2
-- изменил условия под себя, т.к. заполнял таблицы сам
SELECT DepartmentName AS [Name of Department]
FROM Departments
WHERE DepartmentName < 'MechanicalDept'
ORDER BY DepartmentName;