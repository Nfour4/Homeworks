USE Academy

--№11 - Вывести полные имена преподавателей и лекции, которые они читают(названия дисциплин и групп),
--причем отобрать только те лекции, которые читаются в аудитории "B103"

--заменил B103 на Room6

SELECT T.TeacherName + ' ' + T.TeacherSurname AS [Full Name], S.SubjectName, G.GroupName, L.LectureRoom
FROM Subjects S JOIN Lectures L ON S.id = L.SubjectID
JOIN Teachers T ON L.TeacherID = T.id
JOIN GroupLectures GS ON GS.LectureID = L.id
JOIN Groups G ON GS.GroupID = G.id
WHERE L.LectureRoom = 'Room6' 
GROUP BY T.TeacherName, T.TeacherSurname, S.SubjectName, G.GroupName, L.LectureRoom