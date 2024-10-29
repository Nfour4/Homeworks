USE Academy2

--№1 - вывести номера корпусов, если суммарный фонд финансирования расположенных в них кафедр превышает 100000
-- у меня - 1500000

SELECT F.Id, D.AllFinancing
FROM (SELECT FacultyId, SUM(Financing) AS [AllFinancing]
	  FROM Departments
	  GROUP BY FacultyId) AS D JOIN Faculties AS F ON F.Id = D.FacultyId
WHERE D.AllFinancing > 1500000;
	  