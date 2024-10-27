USE Academy

--№9 - вывести названия групп, которые относятся к факультету "Сomputer Science"
--заменил Сomputer Science на PhilosophyFaculty

SELECT G.GroupName, F.FacultyName
FROM Faculties F JOIN Departments D ON F.id = D.FacultyID
JOIN Groups G ON D.id = G.DepartmentID
WHERE F.FacultyName = 'PhilosophyFaculty'
GROUP BY G.GroupName, F.FacultyName