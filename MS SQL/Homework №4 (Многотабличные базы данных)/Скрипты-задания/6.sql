USE Academy

--�6 - ������� �������� ������ � �������� �����, ������� � ��� ���������

SELECT D.DepartmentName, G.GroupName
FROM Departments D JOIN Groups G ON G.DepartmentID = D.id
GROUP BY D.DepartmentName, G.GroupName