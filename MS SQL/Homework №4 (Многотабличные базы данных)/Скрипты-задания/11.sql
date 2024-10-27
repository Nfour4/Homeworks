USE Academy

--�11 - ������� ������ ����� �������������� � ������, ������� ��� ������(�������� ��������� � �����),
--������ �������� ������ �� ������, ������� �������� � ��������� "B103"

--������� B103 �� Room6

SELECT T.TeacherName + ' ' + T.TeacherSurname AS [Full Name], S.SubjectName, G.GroupName, L.LectureRoom
FROM Subjects S JOIN Lectures L ON S.id = L.SubjectID
JOIN Teachers T ON L.TeacherID = T.id
JOIN GroupLectures GS ON GS.LectureID = L.id
JOIN Groups G ON GS.GroupID = G.id
WHERE L.LectureRoom = 'Room6' 
GROUP BY T.TeacherName, T.TeacherSurname, S.SubjectName, G.GroupName, L.LectureRoom