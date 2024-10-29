USE Academy2

-- 9. Вывести название дисциплины, по которой читается меньше всего лекций.

SELECT S.SubjectName, COUNT(*) AS NumberLectures
FROM Subjects S, Lectures L
WHERE L.SubjectId = S.Id
GROUP BY S.SubjectName
HAVING COUNT(*) = (SELECT MIN(R.MinLect)
					FROM (SELECT COUNT(*) AS MinLect
						  FROM Subjects S JOIN Lectures L ON S.id = L.SubjectId
						  GROUP BY S.SubjectName) AS R )