USE Academy

--�8 - ������� �������� ������, �� ������� �������� ���������� "Database theory"
-- Database theory ������� �� Mental Health

SELECT D.DepartmentName, S.SubjectName
FROM Subjects S JOIN Lectures L ON L.SubjectID = S.id
JOIN GroupLectures GS ON GS.LectureID = L.id
JOIN Groups G ON GS.GroupID = G.id
JOIN Departments D ON D.id = G.DepartmentID
WHERE S.SubjectName = 'Mental Health'
GROUP BY D.DepartmentName, S.SubjectName