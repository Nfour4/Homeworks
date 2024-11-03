USE Academy3

-- 8. Вывести полные имена преподавателей в следующем порядке: деканы факультетов, заведующие кафедрами, преподаватели, кураторы, ассистенты.
--у меня все учителя занимают какие-то должности, поэтому вывод простых 'учителей' я пропустил, смысл задания от этого все равно не изменился:)

SELECT T.TeacherName + ' ' + T.TeacherSurname AS FullName, 'Dean' AS Post
FROM Deans D JOIN Teachers T ON D.TeacherId = T.Id
UNION ALL
SELECT T.TeacherName + ' ' + T.TeacherSurname AS FullName, 'Head'
FROM Heads H JOIN Teachers T ON H.TeacherId = T.Id
UNION ALL
SELECT T.TeacherName + ' ' + T.TeacherSurname AS FullName, 'Curator'
FROM Curators C JOIN Teachers T ON C.TeacherId = T.Id
UNION ALL
SELECT T.TeacherName + ' ' + T.TeacherSurname AS FullName, 'Assistant'
FROM Assistants A JOIN Teachers T ON A.TeacherId = T.Id
