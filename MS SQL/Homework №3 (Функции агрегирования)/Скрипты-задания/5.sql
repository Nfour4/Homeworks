USE Academy

--№5 - вывести кол-во студентов, посещающих лекции преподавателя "Jack Underhill"

-- cтудентов? где в этой базе данных, мне интересно, они нашли студентов? очередная неадекватная формулировка,
-- ошибки у них никуда не деваются... заменил "студентов" на кол-во групп, которые посещают лекции
-- преподавателя "Kerby Edards"(вместо Jack Underhill)

SELECT T.TeacherName + ' ' + T.TeacherSurname AS 'Full Name', COUNT(G.id) AS [Group's Count]
FROM Teachers AS T JOIN Lectures AS L ON T.id = L.TeacherID
JOIN GroupLectures AS GS ON L.id = GS.LectureID
JOIN Groups AS G ON GS.GroupID = G.id
WHERE T.TeacherSurname = 'Edards'
GROUP BY T.TeacherName, T.TeacherSurname
