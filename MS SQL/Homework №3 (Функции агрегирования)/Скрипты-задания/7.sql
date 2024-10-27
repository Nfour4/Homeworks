USE Academy

--№7 - вывести минимальное и максимальное кол-во студентов среди всех групп

--опять студенты, которых здесь нет! 
--попробовал посчитать минимальное и масксимальное кол-во кафедр на каждом факультете - не получилось
--получилось только посчитать кол-во; все, что смог - написал

SELECT F.FacultyName, COUNT(D.FacultyID) AS [Count]
FROM Departments AS D JOIN Faculties AS F ON D.FacultyID = F.id
GROUP BY F.FacultyName
