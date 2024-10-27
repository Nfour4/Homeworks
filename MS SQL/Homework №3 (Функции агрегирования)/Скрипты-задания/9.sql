USE Academy

--№9 - вывести полные имена преподавателей и кол-во читаемых ими дисциплин

SELECT T.TeacherName + ' ' + T.TeacherSurname AS [Full Name], COUNT(*) AS [Subjects Count]
FROM Teachers AS T JOIN Lectures AS L ON T.id = L.TeacherID
JOIN Subjects AS S ON S.id = L.SubjectID
GROUP BY T.TeacherName, T.TeacherSurname