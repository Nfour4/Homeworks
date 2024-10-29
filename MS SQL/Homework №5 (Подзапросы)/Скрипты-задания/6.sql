USE Academy2

-- 6. ������� �������� �����, ������� ������� (������� ������� ���� ��������� ������) ������, ��� ����������� ������� ����� 5-�� �����
-- ������� <=, ��� ��� ����� ������ �������� �� �����, ������ 0 �������� �� ������

SELECT G.GroupName, AVG(S.Rating) AS AvgRat,
( SELECT MIN(S.Rating) 
  FROM Groups G JOIN GroupsStudents GS ON G.Id = GS.GroupId 
  JOIN Students S ON GS.StudentId = S.Id
  WHERE G.GroupYear = 5) AS Avg5
FROM Groups G JOIN GroupsStudents GS ON G.Id = GS.GroupId 
JOIN Students S ON GS.StudentId = S.Id
GROUP BY G.GroupName
HAVING AVG(S.Rating) <= 
( SELECT MIN(S.Rating) 
  FROM Groups G JOIN GroupsStudents GS ON G.Id = GS.GroupId 
  JOIN Students S ON GS.StudentId = S.Id
  WHERE G.GroupYear = 5);