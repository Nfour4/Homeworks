USE Academy

--�2 - ������� �������� �����������, ���� �������������� ������ ������� ��������� ���� �������������� ����������

SELECT F.FacultyName
FROM Faculties F, Departments D
WHERE F.id = D.FacultyID 
AND F.Financing < (SELECT SUM(D.Financing) 
				   FROM Departments D 
				   WHERE D.FacultyID = F.id)
GROUP BY F.FacultyName