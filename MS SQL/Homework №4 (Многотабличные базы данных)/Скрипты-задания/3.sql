USE Academy

--�3 - ������� ������� ��������� ����� � �������� �����, ������� ��� ��������

SELECT C.CuratorName + ' ' + C.CuratorSurname AS [Full Name], G.GroupName
FROM Curators AS C JOIN GroupsCurators AS GC ON C.id = GC.CuratorID
JOIN Groups AS G ON G.id = GC.GroupID
