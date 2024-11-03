USE Academy3

-- 5. ������� �������� ���������, � ��������� �� ��������, � ������� ��� ������ � ����� ������ ������ �� ������� ����.

SELECT LR.Name, LR.Building, SC.SWeek AS [Week], SC.SDayOFWeek AS [Day Of Week], SC.Class
FROM LectureRooms LR JOIN Schedules SC ON LR.Id = SC.LectureRoomId
WHERE SC.SDayOFWeek != 3 AND SC.SWeek != 2 AND SC.Class != 3;