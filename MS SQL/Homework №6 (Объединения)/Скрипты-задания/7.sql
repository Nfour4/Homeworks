USE Academy3

-- 7. Вывести список номеров всех корпусов, которые имеются в таблицах факультетов, кафедр и аудиторий.

SELECT Building, FName, 'Faculty' AS Names
FROM Faculties
UNION ALL
SELECT Building, DName, 'Departments'
FROM Departments
UNION ALL
SELECT Building, Name, 'LectureRoom'
FROM LectureRooms
ORDER BY Building;
