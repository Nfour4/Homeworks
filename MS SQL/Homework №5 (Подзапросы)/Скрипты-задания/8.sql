USE Academy2

-- 8. ������� �������� ��������� � ������ ����� ��������������, �������� ���������� ���������� ������ �� ���.

SELECT S.SubjectName, T.TeacherName +' '+ T.TeacherSurname AS FullName, COUNT(*) AS NumberLectures
FROM Subjects S JOIN Lectures L ON L.SubjectId = S.Id
JOIN Teachers T ON T.Id = L.TeacherId
GROUP BY S.SubjectName, T.TeacherName, T.TeacherSurname
ORDER BY COUNT(*) DESC