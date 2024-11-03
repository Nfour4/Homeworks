USE Academy3

-- 9. ¬ывести дни недели (без повторений), в которые имеютс€ зан€ти€ в аудитори€х УA311Ф и УA104Ф корпуса 6.
--копуса 6 по услови€м, данным дл€ заполнени€ таблиц, не существует, оп€ть у них опечатка, поэтому заменил на 5.
--аудитории заменил на 'Room36' и 'Room33'

SELECT S.SDayOFWeek AS [DAY]
FROM LectureRooms LR JOIN Schedules S ON LR.Id = S.LectureRoomId
WHERE LR.Building = 5 AND LR.Name = 'Room36' OR LR.Name = 'Room33'
GROUP BY S.SDayOFWeek;