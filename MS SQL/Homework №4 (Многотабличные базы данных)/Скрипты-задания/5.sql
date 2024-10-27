USE Academy

--№5 - вывести фамилии преподавателей и названия факультетов, на которых они читают лекции 

SELECT T.TeacherName + ' ' + T.TeacherSurname AS [Full Name], F.FacultyName
FROM Teachers T JOIN Lectures L ON T.id = L.TeacherID
JOIN GroupLectures GS ON GS.LectureID = L.id
JOIN Groups G ON G.id = GS.GroupID
JOIN Departments D ON D.id = G.DepartmentID
JOIN Faculties F ON F.id = D.FacultyID
GROUP BY T.TeacherName, T.TeacherSurname, F.FacultyName