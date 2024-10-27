USE Academy

--№7 - вывести названия дисциплин, которые читает преподаватель "Samantha Adams"
--вместо Samantha Adams у меня Katerina Oppy

SELECT T.TeacherName + ' ' + T.TeacherSurname AS [Full Name], S.SubjectName
FROM Teachers T JOIN Lectures L ON T.id = L.TeacherID
JOIN Subjects S ON S.id = L.SubjectID
WHERE T.TeacherName = 'Katerina' AND T.TeacherSurname = 'Oppy'
GROUP BY T.TeacherName, T.TeacherSurname, S.SubjectName;