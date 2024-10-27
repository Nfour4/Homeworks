USE Academy

--�9 - ������� ������ ����� �������������� � ���-�� �������� ��� ���������

SELECT T.TeacherName + ' ' + T.TeacherSurname AS [Full Name], COUNT(*) AS [Subjects Count]
FROM Teachers AS T JOIN Lectures AS L ON T.id = L.TeacherID
JOIN Subjects AS S ON S.id = L.SubjectID
GROUP BY T.TeacherName, T.TeacherSurname