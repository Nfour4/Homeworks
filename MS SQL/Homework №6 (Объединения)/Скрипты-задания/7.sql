USE Academy3

-- 7. ������� ������ ������� ���� ��������, ������� ������� � �������� �����������, ������ � ���������.

SELECT Building, FName, 'Faculty' AS Names
FROM Faculties
UNION ALL
SELECT Building, DName, 'Departments'
FROM Departments
UNION ALL
SELECT Building, Name, 'LectureRoom'
FROM LectureRooms
ORDER BY Building;
