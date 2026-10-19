-- Laboratory Work 5
-- Sarsen Dimash SIS-2412CS

-- Task 1
INSERT INTO departments (department_name, faculty_name)
VALUES
('Computer Science', 'Information Technology'),
('Mathematics', 'Natural Sciences'),
('Economics', 'Business');

INSERT INTO groups (group_name, specialty, year_of_study)
VALUES
('SIS-2412CS', 'Computer Science', 2),
('SIS-2311CS', 'Computer Science', 3),
('ECO-2410', 'Economics', 2);

INSERT INTO classrooms (building, room_number, capacity)
VALUES
('A', '101', 30),
('B', '205', 45),
('C', '310', 25);

INSERT INTO students
(last_name, first_name, date_of_birth, email, phone_number, group_id)
VALUES
('Sarsen', 'Dimash', '2005-04-15', 'sarsendimas@gmail.com', '+77010000001', 1),
('Ivanov', 'Ivan', '2004-08-22', 'ivan.ivanov@example.com', '+77010000002', 2),
('Kim', 'Anna', '2005-11-03', 'anna.kim@example.com', '+77010000003', 3);

INSERT INTO teachers
(last_name, first_name, email, phone_number, academic_degree, department_id)
VALUES
('Akhmetov', 'Arman', 'arman.akhmetov@example.com', '+77020000001', 'PhD', 1),
('Petrova', 'Maria', 'maria.petrova@example.com', '+77020000002', 'MSc', 2),
('Lee', 'Alex', 'alex.lee@example.com', '+77020000003', 'PhD', 3);

INSERT INTO courses (course_name, credits, semester, department_id)
VALUES
('Databases', 5, 1, 1),
('Calculus', 4, 2, 2),
('Microeconomics', 3, 1, 3);

INSERT INTO enrollments (student_id, course_id, semester, grade)
VALUES
(1, 1, 1, 92),
(2, 2, 2, 86),
(3, 3, 1, 89);

INSERT INTO schedule
(course_id, teacher_id, group_id, classroom_id, day_of_week, start_time, end_time)
VALUES
(1, 1, 1, 1, 'Monday', '09:00', '10:30'),
(2, 2, 2, 2, 'Tuesday', '11:00', '12:30'),
(3, 3, 3, 3, 'Wednesday', '14:00', '15:30');

-- Task 2
UPDATE students
SET phone_number = '+77019999999'
WHERE student_id = 1;

-- Task 3
DELETE FROM enrollments
WHERE enrollment_id = 1;