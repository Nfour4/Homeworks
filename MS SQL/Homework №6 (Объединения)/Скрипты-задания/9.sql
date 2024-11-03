USE Academy3

-- 9. ������� ��� ������ (��� ����������), � ������� ������� ������� � ���������� �A311� � �A104� ������� 6.
--������ 6 �� ��������, ������ ��� ���������� ������, �� ����������, ����� � ��� ��������, ������� ������� �� 5.
--��������� ������� �� 'Room36' � 'Room33'

SELECT S.SDayOFWeek AS [DAY]
FROM LectureRooms LR JOIN Schedules S ON LR.Id = S.LectureRoomId
WHERE LR.Building = 5 AND LR.Name = 'Room36' OR LR.Name = 'Room33'
GROUP BY S.SDayOFWeek;