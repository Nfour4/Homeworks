USE Academy

--№10 - вывести кол-во лекций в каждый день недели

SELECT GS.LDayOfWeek AS [Day Of Week], COUNT(*) AS [Count]
FROM GroupLectures AS GS JOIN Lectures AS L ON L.id = GS.LectureID
GROUP BY GS.LDayOfWeek