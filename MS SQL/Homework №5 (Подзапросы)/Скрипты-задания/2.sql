USE Academy2

--№2 - вывести назания групп 5-ого курса кафедры "Software Development", 
--которые имеют более 10 пар в первую неделю

--такую задачу я посчитал невыполнимой в условиях моей базы данных, 
--поэтому сделал свое условие - вывести назания групп 5-ого курса ВСЕХ кафедр, у которых больше 2-х лекций

SELECT D.DepartmentName, G.GroupName, GS.LectCount, G.GroupYear
FROM (SELECT GroupId, COUNT(*) AS [LectCount]
	  FROM GroupsLectures
	  GROUP BY GroupId) AS GS JOIN Groups AS G ON G.Id = GS.GroupId
	  JOIN Departments D ON D.Id = G.DepartmentId
WHERE GS.LectCount > 2 AND G.GroupYear = 5;