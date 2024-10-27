USE Academy

--№2 - вывести количество лекций, которые читает преподаватель "Dave McQueen"
--вместо Dave McQueen у меня Chickie Nesby

SELECT T.TeacherName + ' ' + T.TeacherSurname AS 'Full Name', COUNT(*) AS [Lecture's Count]
FROM Teachers AS T JOIN Lectures AS L ON T.id = L.TeacherID
WHERE T.TeacherSurname = 'Nesby'
GROUP BY T.TeacherName, T.TeacherSurname


