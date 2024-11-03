USE Academy3

-- 4. ¬ывести фамилии преподавателей, которые не читают лекции по понедельникам.

SELECT T.TeacherSurname, SC.SDayOFWeek
FROM Teachers T JOIN Lectures L ON T.Id = L.TeacherId
JOIN Schedules SC ON SC.LectureId = L.Id
WHERE SC.SDayOFWeek != 1;
