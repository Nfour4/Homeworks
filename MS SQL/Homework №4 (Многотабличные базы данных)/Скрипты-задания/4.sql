USE Academy

--№4 - вывести имена и фамилии преподавателей, которые читают лекции у группы "P107"
--заменил P107 на PSL1

SELECT T.TeacherName + ' ' + T.TeacherSurname AS [Full Name], G.GroupName
FROM Teachers AS T JOIN Lectures AS L ON L.TeacherID = T.id
JOIN GroupLectures AS GS ON GS.LectureID = L.id
JOIN Groups AS G ON G.id = GS.GroupID
WHERE G.GroupName = 'PSL1'