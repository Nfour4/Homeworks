USE Academy

--№3 - вывести кол-во занятий, проводимых в аудитории "D201"
--вместо D201 у меня Room10

SELECT L.LectureRoom, COUNT(*) AS [Lecture's Count]
FROM Lectures AS L JOIN GroupLectures AS GS ON L.id = GS.LectureID
WHERE L.LectureRoom = 'Room10'
GROUP BY L.LectureRoom

