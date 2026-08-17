CREATE DATABASE postgresql_practice;

-- Connect using: \c postgresql_practice

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT CHECK (age >= 18),
    course VARCHAR(100) NOT NULL
);

-- Insert a few records for practice
INSERT INTO students (first_name, last_name, email, age, course)
VALUES
('Rahul', 'Sharma', 'rahul@example.com', 20, 'BSc IT'),
('Priya', 'Singh', 'priya@example.com', 21, 'BCA'),
('Aman', 'Kumar', 'aman@example.com', 22, 'BSc CS'),
('Sneha', 'Verma', 'sneha@example.com', 20, 'BTech');

SELECT * FROM students;

SELECT first_name, last_name, course
FROM students
LIMIT 10;

SELECT *
FROM students
WHERE age >= 20
LIMIT 10;

SELECT *
FROM students
WHERE course = 'BSc IT'
LIMIT 10;

SELECT *
FROM students
ORDER BY age DESC
LIMIT 10;

SELECT COUNT(*) FROM students;

-- Testing the age constraint
-- This gives an error because age cannot be less than 18:
-- INSERT INTO students (first_name, last_name, email, age, course)
-- VALUES ('Test', 'Student', 'test@example.com', 17, 'BSc IT');

-- Imported the Mockaroo CSV using:
-- \copy students(first_name, last_name, email, age, course) FROM 'MOCK_DATA.csv' WITH (FORMAT csv, HEADER true);