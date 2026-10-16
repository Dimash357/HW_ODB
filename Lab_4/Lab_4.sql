-- Laboratory Work 4
-- Sarsen Dimash SIS-2412CS

CREATE DATABASE "University";

CREATE TABLE students (
    student_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(30),
    group_id INTEGER NOT NULL REFERENCES groups(group_id)
);

CREATE TABLE teachers (
    teacher_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    last_name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    email VARCHAR(255),
    phone_number VARCHAR(30),
    academic_degree VARCHAR(100),
    department_id INTEGER NOT NULL REFERENCES departments(department_id)
);

CREATE TABLE groups (
    group_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    group_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    year_of_study INTEGER NOT NULL CHECK (year_of_study BETWEEN 1 AND 6)
);

CREATE TABLE departments (
    department_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    faculty_name VARCHAR(100) NOT NULL
);

CREATE TABLE classrooms (
    classroom_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    building VARCHAR(50) NOT NULL,
    room_number VARCHAR(20) NOT NULL,
    capacity INTEGER NOT NULL CHECK (capacity > 0)
);

CREATE TABLE courses (
    course_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_name VARCHAR(150) NOT NULL,
    credits INTEGER NOT NULL CHECK (credits BETWEEN 1 AND 10),
    semester INTEGER NOT NULL CHECK (semester IN (1, 2)),
    department_id INTEGER NOT NULL REFERENCES departments(department_id)
);

CREATE TABLE enrollments (
    enrollment_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id INTEGER NOT NULL REFERENCES students(student_id),
    course_id INTEGER NOT NULL REFERENCES courses(course_id),
    semester INTEGER NOT NULL,
    grade NUMERIC(5,2)
);

CREATE TABLE schedule (
    schedule_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    course_id INTEGER NOT NULL REFERENCES courses(course_id),
    teacher_id INTEGER NOT NULL REFERENCES teachers(teacher_id),
    group_id INTEGER NOT NULL REFERENCES groups(group_id),
    classroom_id INTEGER NOT NULL REFERENCES classrooms(classroom_id),
    day_of_week VARCHAR(15) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    CONSTRAINT valid_schedule_time CHECK (start_time < end_time)
);

CREATE TABLE test_table (
    test_id INTEGER PRIMARY KEY,
    test_name VARCHAR(50)
);

ALTER TABLE test_table ADD COLUMN test_description VARCHAR(100);

DROP TABLE test_table;

