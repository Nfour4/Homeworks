USE Academy

--№2 - вывести названия факультетов, фонд финансирования кафедр которых превышает фонд финансирования факультета

SELECT F.FacultyName
FROM Faculties F, Departments D
WHERE F.id = D.FacultyID 
AND F.Financing < (SELECT SUM(D.Financing) 
				   FROM Departments D 
				   WHERE D.FacultyID = F.id)
GROUP BY F.FacultyName