USE Academy2

-- 6. ¬ывести названи€ групп, имеющих рейтинг (средний рейтинг всех студентов группы) меньше, чем минимальный рейтинг групп 5-го курса
-- добавил <=, так как иначе ничего выводить не будет, меньше 0 рейтинга не бывает

SELECT G.GroupName, AVG(S.Rating) AS AvgRat,
( SELECT MIN(S.Rating) 
  FROM Groups G JOIN GroupsStudents GS ON G.Id = GS.GroupId 
  JOIN Students S ON GS.StudentId = S.Id
  WHERE G.GroupYear = 5) AS Avg5
FROM Groups G JOIN GroupsStudents GS ON G.Id = GS.GroupId 
JOIN Students S ON GS.StudentId = S.Id
GROUP BY G.GroupName
HAVING AVG(S.Rating) <= 
( SELECT MIN(S.Rating) 
  FROM Groups G JOIN GroupsStudents GS ON G.Id = GS.GroupId 
  JOIN Students S ON GS.StudentId = S.Id
  WHERE G.GroupYear = 5);