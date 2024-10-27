USE Academy

--№4 - вывести названия аудиторий и кол-во лекций, проводимых в них

SELECT L.LectureRoom, COUNT(*) AS [Lecture's Count]
FROM Lectures AS L JOIN GroupLectures AS GS ON L.id = GS.LectureID
GROUP BY L.LectureRoom, L.id
ORDER BY L.id ASC