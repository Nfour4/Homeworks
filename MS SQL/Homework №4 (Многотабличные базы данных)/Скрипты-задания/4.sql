USE Academy

--�4 - ������� ����� � ������� ��������������, ������� ������ ������ � ������ "P107"
--������� P107 �� PSL1

SELECT T.TeacherName + ' ' + T.TeacherSurname AS [Full Name], G.GroupName
FROM Teachers AS T JOIN Lectures AS L ON L.TeacherID = T.id
JOIN GroupLectures AS GS ON GS.LectureID = L.id
JOIN Groups AS G ON G.id = GS.GroupID
WHERE G.GroupName = 'PSL1'