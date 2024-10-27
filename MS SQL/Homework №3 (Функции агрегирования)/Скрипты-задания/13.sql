USE Academy

--№13 - вывести кол-во лекций для каждой пары преподаватель-аудитория

SELECT T.TeacherName + ' ' + T.TeacherSurname AS [FullName],
	   L.LectureRoom, COUNT(DISTINCT L.SubjectID) AS [Count]
FROM Teachers AS T, Lectures AS L, Subjects AS S
WHERE L.TeacherID = T.id
GROUP BY T.TeacherName, T.TeacherSurname, L.LectureRoom
