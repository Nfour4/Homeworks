USE SportsShop

-- 2. При увольнении сотрудника триггер переносит информацию об уволенном сотруднике в таблицу «Архив сотрудников».

GO
CREATE TRIGGER EmployeeArchiveTrigger
ON Employees
AFTER DELETE
AS
INSERT INTO EmployeeArchive(NoteDate, Note)
SELECT GETDATE(), 'An employee with ID ' + CONVERT(NVARCHAR, EmployeeID) + ' - ' + FirstName + ' ' + MiddleName + ' ' + LastName + ' was deleted'
FROM DELETED;
