USE Academy3

-- 3. ������� ����������, ������� ������ ������������� �Alex Carmack� ��� ����� 5-�� �����.
-- ������� �� 'Demetris Bovey'

SELECT S.Name AS Discipline, T.TeacherName + ' ' + T.TeacherSurname AS FullName, G.GroupName, G.GYear 
FROM Subjects S JOIN Lectures L ON S.Id = L.SubjectId
JOIN Teachers T ON T.Id = L.TeacherId
JOIN GroupsLectures GL ON GL.LectureId = L.Id
JOIN Groups G ON G.Id = GL.GroupId
WHERE G.GYear = 5 AND T.TeacherName = 'Demetris';