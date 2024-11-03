USE Academy3

-- 6. ������� ������ ����� �������������� ���������� �Computer Science�, ������� �� �������� ������ ������� �Software Development�.
--������� 'Computer Science' �� 'HistoryFaculty', a 'Software Development' �� 'Museology'

SELECT T.TeacherName + ' ' + T.TeacherSurname AS [Full Name], F.FName, D.DName 
FROM Teachers T JOIN Curators C ON T.Id = C.TeacherId
JOIN GroupsCurators GC ON GC.CuratorId = C.Id
JOIN Groups G ON G.Id = GC.GroupId
JOIN Departments D ON D.Id = G.DepartmrntId
JOIN Faculties F ON D.FacultyId = F.Id
WHERE F.FName = 'HistoryFaculty' AND D.DName != 'Museology';

