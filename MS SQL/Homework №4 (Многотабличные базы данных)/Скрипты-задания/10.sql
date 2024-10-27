USE Academy

--№10 - вывести названия групп 5-ого курса, а также название факультетов, к которым они относятся

SELECT G.GroupYear, G.GroupName, F.FacultyName
FROM Faculties F JOIN Departments D ON F.id = D.FacultyID
JOIN Groups G ON G.DepartmentID = D.id
WHERE G.GroupYear = 5
GROUP BY G.GroupYear, G.GroupName, F.FacultyName