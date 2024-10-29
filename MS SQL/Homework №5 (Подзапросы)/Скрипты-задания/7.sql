USE Academy2

-- 7. ¬ывести названи€ факультетов, суммарный фонд финансировани€ кафедр которых больше суммарного фонда финансировани€ кафедр факультета УComputer ScienceФ.
-- заменил на EconomyFaculty

SELECT F.FacultyName, SUM(D.Financing) AS SumFin, 
(SELECT SUM(D.Financing)
 FROM Departments D JOIN Faculties F ON F.Id = D.FacultyId
 WHERE F.FacultyName = 'EconomyFaculty') AS SumEconomyFac
FROM Faculties F JOIN Departments D ON D.FacultyId = F.Id
GROUP BY F.FacultyName
HAVING SUM(D.Financing) > (SELECT SUM(D.Financing)
						   FROM Departments D JOIN Faculties F ON F.Id = D.FacultyId
						   WHERE F.FacultyName = 'EconomyFaculty')