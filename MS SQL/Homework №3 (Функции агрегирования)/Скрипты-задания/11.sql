USE Academy

--№11 - вывести номера аудиторий и кол-во кафедр, чьи лекции в них читаются

SELECT L.LectureRoom, COUNT(D.id) AS [Count]
FROM Lectures AS L JOIN GroupLectures AS GS ON L.id = GS.LectureID
JOIN Groups AS G ON GS.GroupID = G.id
JOIN Departments AS D ON D.id = G.DepartmentID
GROUP BY L.LectureRoom, L.id
ORDER BY L.id ASC