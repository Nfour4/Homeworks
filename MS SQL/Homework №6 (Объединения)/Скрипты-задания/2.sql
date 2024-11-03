USE Academy3

-- 2. ¬ывести фамилии ассистентов, читающих лекции в группе УF505Ф.
-- заменил на ST3

SELECT T.TeacherName + ' ' + T.TeacherSurname AS FullName , G.GroupName
FROM Assistants A JOIN Teachers T ON A.TeacherId = T.Id
JOIN Lectures L ON L.TeacherId = T.Id
JOIN GroupsLectures GS ON GS.LectureId = L.Id
JOIN Groups G ON G.Id = GS.GroupId
WHERE G.GroupName = 'ST3'
GROUP BY T.TeacherName, T.TeacherSurname, G.GroupName;