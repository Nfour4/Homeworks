USE Academy

--№3 - вывести фамилию кураторов групп и названия групп, которые они курируют

SELECT C.CuratorName + ' ' + C.CuratorSurname AS [Full Name], G.GroupName
FROM Curators AS C JOIN GroupsCurators AS GC ON C.id = GC.CuratorID
JOIN Groups AS G ON G.id = GC.GroupID
