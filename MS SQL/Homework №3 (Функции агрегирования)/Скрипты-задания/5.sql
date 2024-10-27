USE Academy

--�5 - ������� ���-�� ���������, ���������� ������ ������������� "Jack Underhill"

-- c��������? ��� � ���� ���� ������, ��� ���������, ��� ����� ���������? ��������� ������������ ������������,
-- ������ � ��� ������ �� ��������... ������� "���������" �� ���-�� �����, ������� �������� ������
-- ������������� "Kerby Edards"(������ Jack Underhill)

SELECT T.TeacherName + ' ' + T.TeacherSurname AS 'Full Name', COUNT(G.id) AS [Group's Count]
FROM Teachers AS T JOIN Lectures AS L ON T.id = L.TeacherID
JOIN GroupLectures AS GS ON L.id = GS.LectureID
JOIN Groups AS G ON GS.GroupID = G.id
WHERE T.TeacherSurname = 'Edards'
GROUP BY T.TeacherName, T.TeacherSurname
