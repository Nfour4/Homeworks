USE Academy2

-- 4. ������� ������� � ����� ��������������, ������ ������� ���� ������� ������ �����������.

SELECT T.TeacherName + ' ' + T.TeacherSurname AS FullName, T.Salary AS Salary, 
(SELECT AVG(Salary)
		FROM Teachers
		WHERE IsProfessor = 1) AS AvgProfessorSalary
FROM Teachers T
WHERE T.Salary > (SELECT AVG(Salary)
				  FROM Teachers
				  WHERE IsProfessor = 1)

