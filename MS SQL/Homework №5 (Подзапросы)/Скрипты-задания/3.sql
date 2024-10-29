USE Academy2

-- 3. ¬ывести названи€ групп, имеющих рейтинг (средний рейтинг всех студентов группы) больше, чем рейтинг группы УD221Ф
--замнил на 'ETH3'

SELECT G.GroupName, AVG(S.Rating) AS AvgRating
FROM Groups G JOIN GroupsStudents AS GS ON GS.GroupId = G.Id
JOIN Students AS S ON S.Id = GS.StudentId
GROUP BY G.GroupName
HAVING AVG(S.Rating) > (
	SELECT AVG(S.Rating)
	FROM Groups G JOIN GroupsStudents AS GS ON GS.GroupId = G.Id
	JOIN Students AS S ON S.Id = GS.StudentId
	WHERE G.GroupName = 'ETH3'
)