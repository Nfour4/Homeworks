USE Academy2

-- 10. Вывести количество студентов и читаемых дисциплин на кафедре “Software Development”.
--заменил на NationalHistory

SELECT (SELECT COUNT(*)
FROM Students S JOIN GroupsStudents GS ON S.Id = GS.StudentId
JOIN Groups G ON GS.GroupId = G.Id
JOIN Departments D ON D.Id = G.DepartmentId
WHERE D.DepartmentName = 'NationalHistory') AS NumberStudents, 
(SELECT COUNT(*) 
FROM Subjects SB JOIN Lectures L ON L.SubjectId = SB.Id
JOIN GroupsLectures GL ON GL.LectureId = L.Id 
JOIN Groups G ON G.Id = GL.GroupId
JOIN Departments D ON D.Id = G.DepartmentId
WHERE D.DepartmentName = 'NationalHistory') AS NumberSubjects
