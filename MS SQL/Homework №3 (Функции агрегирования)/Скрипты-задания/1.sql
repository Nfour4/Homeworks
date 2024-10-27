USE Academy

--�1 - ������� ���������� �������������� ������� "Software Development"
--������ 'Software Developement' � ���� ������� 'Ethics'

SELECT 'Ethics' AS [Department Name], COUNT(*) AS [Count], T.TeacherName, T.TeacherSurname, T.id
FROM Teachers AS T JOIN Lectures AS L ON T.id = L.TeacherID
JOIN GroupLectures AS GS ON L.id = GS.LectureID
JOIN Groups AS G ON GS.GroupID = G.id
JOIN Departments AS D ON G.DepartmentID = D.id
WHERE D.DepartmentName = 'Ethics'
GROUP BY T.TeacherName, T.TeacherSurname, T.id
