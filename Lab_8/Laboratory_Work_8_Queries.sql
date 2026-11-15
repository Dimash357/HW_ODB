-- Task 1
SELECT COUNT(*) AS total_students
FROM Students;

-- Task 2
SELECT AVG(final) AS average_final
FROM Progress;

-- Task 3
SELECT proc_id, AVG(final) AS average_final
FROM Progress
GROUP BY proc_id;

-- Task 4
SELECT proc_id, AVG(final) AS average_final
FROM Progress
GROUP BY proc_id
HAVING AVG(final) >= 80;

-- Task 5
SELECT proc_id, AVG(final) AS average_final
FROM Progress
GROUP BY proc_id
HAVING AVG(final) >= 80
ORDER BY average_final DESC;

-- Task 6
SELECT g.group_name, sub.subj_name, sch.room,
       sch.sch_time, sch.day_of_week, c.class_type,
       t.lname AS teacher_lname
FROM Schedule AS sch
INNER JOIN Ed_process AS ep ON sch.proc_id = ep.proc_id
INNER JOIN Groups AS g ON ep.group_id = g.group_id
INNER JOIN Subjects AS sub ON ep.subj_id = sub.subj_id
INNER JOIN Classes AS c ON sch.class_id = c.class_id
INNER JOIN Teachers AS t ON sch.teach_id = t.teach_id;

-- Task 7
-- Run these INSERT statements ONCE before task 7:
INSERT INTO Ed_process (proc_id, group_id, subj_id, term) VALUES
(7, 7, 1, 4), (8, 8, 2, 4), (9, 1, 2, 4);

INSERT INTO Progress (progress_id, proc_id, stud_id, rk1, rk2, rk_avg, exam, final) VALUES
(4, 4, 4, 80, 82, 81, 85, 83),
(5, 5, 5, 95, 97, 96, 94, 95),
(6, 6, 6, 76, 80, 78, 82, 80),
(7, 7, 7, 91, 93, 92, 96, 94),
(8, 8, 8, 70, 74, 72, 78, 75),
(9, 9, 1, 96, 98, 97, 95, 96);

-- The single SELECT query for task 7:
SELECT s.fname || ' ' || s.lname AS "Full name",
       sub.subj_name AS "Subject name",
       p.rk1 AS "RK1", p.rk2 AS "RK2",
       p.rk_avg AS "RK average",
       p.exam AS "Exam", p.final AS "Final"
FROM Progress AS p
INNER JOIN Students AS s ON p.stud_id = s.stud_id
INNER JOIN Ed_process AS ep ON p.proc_id = ep.proc_id
INNER JOIN Subjects AS sub ON ep.subj_id = sub.subj_id;

-- Task 8
SELECT s.fname || ' ' || s.lname AS "Full name",
       sub.subj_name AS "Subject name",
       p.rk1 AS "RK1", p.rk2 AS "RK2",
       p.rk_avg AS "RK average",
       p.exam AS "Exam", p.final AS "Final"
FROM Progress AS p
INNER JOIN Students AS s ON p.stud_id = s.stud_id
INNER JOIN Ed_process AS ep ON p.proc_id = ep.proc_id
INNER JOIN Subjects AS sub ON ep.subj_id = sub.subj_id
WHERE p.final BETWEEN 75 AND 90;

-- Task 9
SELECT g.group_name AS "Group name",
       sub.subj_name AS "Subject name",
       AVG(p.final) AS "Average final"
FROM Ed_process AS ep
INNER JOIN Groups AS g ON ep.group_id = g.group_id
INNER JOIN Subjects AS sub ON ep.subj_id = sub.subj_id
INNER JOIN Progress AS p ON ep.proc_id = p.proc_id
GROUP BY g.group_id, g.group_name, sub.subj_id, sub.subj_name
ORDER BY g.group_name, sub.subj_name;

-- Task 10
SELECT s.fname || ' ' || s.lname AS "Full name",
       AVG(p.final) AS "Average final"
FROM Students AS s
INNER JOIN Progress AS p ON s.stud_id = p.stud_id
GROUP BY s.stud_id, s.fname, s.lname
HAVING AVG(p.final) >= 90
ORDER BY s.lname ASC, s.fname ASC;