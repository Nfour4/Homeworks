USE Academy

--�7 - ������� ����������� � ������������ ���-�� ��������� ����� ���� �����

--����� ��������, ������� ����� ���! 
--���������� ��������� ����������� � ������������� ���-�� ������ �� ������ ���������� - �� ����������
--���������� ������ ��������� ���-��; ���, ��� ���� - �������

SELECT F.FacultyName, COUNT(D.FacultyID) AS [Count]
FROM Departments AS D JOIN Faculties AS F ON D.FacultyID = F.id
GROUP BY F.FacultyName
