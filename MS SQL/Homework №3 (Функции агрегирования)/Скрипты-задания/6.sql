USE Academy

-- №6 - вывести среднюю ставку преподавателей факультета "Computer Science"
-- заменил на HistoryFaculty

SELECT F.FacultyName, AVG(T.Salary) AS [Average Salary]
FROM Teachers AS T JOIN Lectures AS L ON T.id = L.TeacherID
JOIN GroupLectures AS GS ON L.id = GS.LectureID
JOIN Groups AS G ON GS.GroupID = G.id
JOIN Departments AS D ON D.id = G.DepartmentID
JOIN Faculties AS F ON F.id = D.FacultyID
WHERE F.FacultyName = 'HistoryFaculty'
GROUP BY F.FacultyName;