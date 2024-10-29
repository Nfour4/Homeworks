USE Academy2

--�2 - ������� ������� ����� 5-��� ����� ������� "Software Development", 
--������� ����� ����� 10 ��� � ������ ������

--����� ������ � �������� ������������ � �������� ���� ���� ������, 
--������� ������ ���� ������� - ������� ������� ����� 5-��� ����� ���� ������, � ������� ������ 2-� ������

SELECT D.DepartmentName, G.GroupName, GS.LectCount, G.GroupYear
FROM (SELECT GroupId, COUNT(*) AS [LectCount]
	  FROM GroupsLectures
	  GROUP BY GroupId) AS GS JOIN Groups AS G ON G.Id = GS.GroupId
	  JOIN Departments D ON D.Id = G.DepartmentId
WHERE GS.LectCount > 2 AND G.GroupYear = 5;