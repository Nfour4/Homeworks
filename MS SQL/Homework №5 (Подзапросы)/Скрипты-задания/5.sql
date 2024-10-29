USE Academy2

-- 5. ������� �������� �����, � ������� ������ ������ ��������.

SELECT G.GroupName, COUNT(GS.CuratorID) AS CuratorsCount
FROM Groups G JOIN GroupsCurators GS ON GS.GroupId = G.Id 
JOIN Curators C ON GS.CuratorId = C.Id
GROUP BY G.GroupName
HAVING COUNT(GS.CuratorId) > 1;
