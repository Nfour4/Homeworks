USE Academy

--�3 - ������� ���-�� �������, ���������� � ��������� "D201"
--������ D201 � ���� Room10

SELECT L.LectureRoom, COUNT(*) AS [Lecture's Count]
FROM Lectures AS L JOIN GroupLectures AS GS ON L.id = GS.LectureID
WHERE L.LectureRoom = 'Room10'
GROUP BY L.LectureRoom

