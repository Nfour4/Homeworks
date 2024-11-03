USE Academy3

-- 1. ������� �������� ���������, � ������� ������ ������ ������������� �Edward Hopper�.
-- ������� �� 'Demetris Bovey'

SELECT LR.Name, T.TeacherName
FROM LectureRooms LR JOIN Schedules S ON LR.Id = S.LectureRoomId
JOIN Lectures L ON L.Id = S.LectureId
JOIN Teachers T ON T.Id = L.TeacherId
WHERE T.TeacherName = 'Demetris'
GROUP BY LR.Name, T.TeacherName;