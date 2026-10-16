-- Laboratory Work 5
-- Sarsen Dimash SIS-2412CS

-- Task 1
INSERT INTO departments (department_name, faculty_name) VALUES
('Computer Science', 'Information Technology'),
('Mathematics', 'Natural Sciences'),
('Economics', 'Business');

INSERT INTO groups (group_name, specialty, year_of_study) VALUES
('SIS-2412CS', 'Computer Science', 2),
('SIS-2311CS', 'Computer Science', 3),
('ECO-2410', 'Economics', 2);

INSERT INTO classrooms (building, room_number, capacity) VALUES
('A', '101', 30),
('B', '205', 45),
('C', '310', 25);

INSERT INTO students (last_name, first_name, date_of_birth, email, phone_number, group_id) VALUES
('Sarsen', 'Dimash', '2005-04-15', 'sarsendimas@gmail.com', '+77010000001', (SELECT group_id FROM groups WHERE group_name = 'SIS-2412CS' LIMIT 1)),
('Ivanov', 'Ivan', '2004-08-22', 'ivan.ivanov@example.com', '+77010000002', (SELECT group_id FROM groups WHERE group_name = 'SIS-2311CS' LIMIT 1)),
('Kim', 'Anna', '2005-11-03', 'anna.kim@example.com', '+77010000003', (SELECT group_id FROM groups WHERE group_name = 'ECO-2410' LIMIT 1));

INSERT INTO teachers (last_name, first_name, email, phone_number, academic_degree, department_id) VALUES
('Akhmetov', 'Arman', 'arman.akhmetov@example.com', '+77020000001', 'PhD', (SELECT department_id FROM departments WHERE department_name = 'Computer Science' LIMIT 1)),
('Petrova', 'Maria', 'maria.petrova@example.com', '+77020000002', 'MSc', (SELECT department_id FROM departments WHERE department_name = 'Mathematics' LIMIT 1)),
('Lee', 'Alex', 'alex.lee@example.com', '+77020000003', 'PhD', (SELECT department_id FROM departments WHERE department_name = 'Economics' LIMIT 1));

INSERT INTO courses (course_name, credits, semester, department_id) VALUES
('Databases', 5, 1, (SELECT department_id FROM departments WHERE department_name = 'Computer Science' LIMIT 1)),
('Calculus', 4, 2, (SELECT department_id FROM departments WHERE department_name = 'Mathematics' LIMIT 1)),
('Microeconomics', 3, 1, (SELECT department_id FROM departments WHERE department_name = 'Economics' LIMIT 1));

INSERT INTO enrollments (student_id, course_id, semester, grade) VALUES
((SELECT student_id FROM students WHERE email = 'sarsendimas@gmail.com'), (SELECT course_id FROM courses WHERE course_name = 'Databases' LIMIT 1), 1, 92),
((SELECT student_id FROM students WHERE email = 'ivan.ivanov@example.com'), (SELECT course_id FROM courses WHERE course_name = 'Calculus' LIMIT 1), 2, 86),
((SELECT student_id FROM students WHERE email = 'anna.kim@example.com'), (SELECT course_id FROM courses WHERE course_name = 'Microeconomics' LIMIT 1), 1, 89),
((SELECT student_id FROM students WHERE email = 'sarsendimas@gmail.com'), (SELECT course_id FROM courses WHERE course_name = 'Calculus' LIMIT 1), 2, 95);

INSERT INTO schedule (course_id, teacher_id, group_id, classroom_id, day_of_week, start_time, end_time) VALUES
((SELECT course_id FROM courses WHERE course_name = 'Databases' LIMIT 1), (SELECT teacher_id FROM teachers WHERE email = 'arman.akhmetov@example.com'), (SELECT group_id FROM groups WHERE group_name = 'SIS-2412CS' LIMIT 1), (SELECT classroom_id FROM classrooms WHERE building = 'A' AND room_number = '101' LIMIT 1), 'Monday', '09:00', '10:30'),
((SELECT course_id FROM courses WHERE course_name = 'Calculus' LIMIT 1), (SELECT teacher_id FROM teachers WHERE email = 'maria.petrova@example.com'), (SELECT group_id FROM groups WHERE group_name = 'SIS-2311CS' LIMIT 1), (SELECT classroom_id FROM classrooms WHERE building = 'B' AND room_number = '205' LIMIT 1), 'Tuesday', '11:00', '12:30'),
((SELECT course_id FROM courses WHERE course_name = 'Microeconomics' LIMIT 1), (SELECT teacher_id FROM teachers WHERE email = 'alex.lee@example.com'), (SELECT group_id FROM groups WHERE group_name = 'ECO-2410' LIMIT 1), (SELECT classroom_id FROM classrooms WHERE building = 'C' AND room_number = '310' LIMIT 1), 'Wednesday', '14:00', '15:30');

-- Task 2
UPDATE students
SET phone_number = '+77019999999'
WHERE email = 'sarsendimas@gmail.com';

-- Task 3
DELETE FROM enrollments
WHERE student_id = (SELECT student_id FROM students WHERE email = 'sarsendimas@gmail.com')
  AND course_id = (SELECT course_id FROM courses WHERE course_name = 'Calculus' LIMIT 1);