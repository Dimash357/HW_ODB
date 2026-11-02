
-- =====================================================
-- LAB WORK 6
-- =====================================================

-- DATABASE PREPARATION

DROP TABLE IF EXISTS Teachers;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Students (
    stud_id INT PRIMARY KEY,
    fname VARCHAR(20),
    lname VARCHAR(20)
);

CREATE TABLE Departments (
    dep_id INT PRIMARY KEY,
    name VARCHAR(10)
);

CREATE TABLE Teachers (
    teach_id INT PRIMARY KEY,
    fname VARCHAR(20),
    lname VARCHAR(20),
    dep_id INT REFERENCES Departments(dep_id)
);

INSERT INTO Students VALUES
(1, 'A', 'A'),
(2, 'B', 'B');

INSERT INTO Departments VALUES
(1, 'AAA'),
(2, 'BBB');

INSERT INTO Teachers VALUES
(1, 'B', 'B', 2),
(2, 'C', 'C', 2);


-- TASK 1
SELECT *
FROM Teachers;


-- TASK 2
SELECT lname
FROM Students;


-- TASK 3
SELECT lname
FROM Teachers
WHERE fname = 'B';


-- TASK 4
SELECT fname, lname
FROM Teachers
UNION
SELECT fname, lname
FROM Students;


-- TASK 5
SELECT fname, lname
FROM Students
EXCEPT
SELECT fname, lname
FROM Teachers;


-- TASK 6
SELECT fname, lname
FROM Students
INTERSECT
SELECT fname, lname
FROM Teachers;


-- TASK 7
SELECT t.lname, d.name AS department_name
FROM Teachers t
INNER JOIN Departments d
ON t.dep_id = d.dep_id;


-- TASK 8
SELECT t.lname, d.name AS department_name
FROM Teachers t
LEFT JOIN Departments d
ON t.dep_id = d.dep_id;


-- TASK 9
SELECT t.lname, d.name AS department_name
FROM Teachers t
RIGHT JOIN Departments d
ON t.dep_id = d.dep_id;


-- TASK 10
SELECT t.lname, d.name AS department_name
FROM Teachers t
FULL OUTER JOIN Departments d
ON t.dep_id = d.dep_id;
