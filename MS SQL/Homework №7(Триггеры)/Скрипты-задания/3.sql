USE SportsShop

-- 3. ������� ��������� ��������� ������ ��������, ���� ���������� ������������ ��������� ������ 6.

GO
CREATE TRIGGER MaxSalesmanCountTrigger
ON Employees 
INSTEAD OF INSERT
AS
BEGIN
    IF (
        SELECT COUNT(*) FROM Employees
        ) >= 6
    BEGIN
        RAISERROR('���������� ������ �������� ���������! ��������� ������������ ���������� ��������� � 6!', 16, 1);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO Employees(FirstName, MiddleName, LastName, PositionID, HireDate, Gender, Salary)
        SELECT FirstName, MiddleName, LastName, PositionID, HireDate, Gender, Salary 
		FROM INSERTED;
    END
END
GO