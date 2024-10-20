USE Academy2
-- немного изменил условия под себя, т.к. таблицы заполнял сам
SELECT Surname, Position, Salary, Premium
FROM Teachers
WHERE Premium > 1600 AND Premium < 5500;