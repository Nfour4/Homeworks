USE Academy

--№1 - вывести все возможные пары строк преподавателей и групп

SELECT T.TeacherName + ' ' + T.TeacherSurname AS FullName, G.GroupName
FROM Teachers AS T JOIN Lectures AS L ON T.id = L.TeacherID
JOIN GroupLectures AS GS ON L.id = GS.LectureID
JOIN Groups AS G ON GS.GroupID = G.id
GROUP BY T.TeacherName, T.TeacherSurname, G.GroupName