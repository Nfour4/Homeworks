USE Academy

--№12 - вывести названия факультетов и кол-во дисциплин, которые на них читаются

SELECT F.FacultyName, COUNT(S.id) AS [Count]
FROM Subjects AS S JOIN Lectures AS L ON S.id = L.SubjectID
JOIN GroupLectures AS GS ON L.id = GS.LectureID
JOIN Groups AS G ON G.id = GS.GroupID
JOIN Departments AS D ON D.id = G.DepartmentID
JOIN Faculties AS F ON F.id = D.FacultyID
GROUP BY F.FacultyName