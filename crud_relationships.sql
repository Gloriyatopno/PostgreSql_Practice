-- Create courses table with primary key and unique constraint
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert course records
INSERT INTO courses (course_name, course_code)
VALUES
('BSc IT', 'BSCIT'),
('BCA', 'BCA'),
('BSc CS', 'BSCCS'),
('BTech', 'BTECH');

-- Create enrollment table with foreign keys
CREATE TABLE enrollments (
    id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Add enrollment records
INSERT INTO enrollments (student_id, course_id)
VALUES
(1, 4),
(2, 3),
(3, 1),
(4, 1),
(5, 4);

-- View enrollment records
SELECT * FROM enrollments;

-- Join students with their courses
SELECT
    students.first_name,
    students.last_name,
    courses.course_name
FROM enrollments
INNER JOIN students
    ON enrollments.student_id = students.id
INNER JOIN courses
    ON enrollments.course_id = courses.id;

-- Find students without an enrollment
SELECT
    students.id,
    students.first_name,
    students.last_name
FROM students
LEFT JOIN enrollments
    ON students.id = enrollments.student_id
WHERE enrollments.student_id IS NULL;

-- Update an enrollment
UPDATE enrollments
SET course_id = 2
WHERE student_id = 5;

-- Delete an enrollment
DELETE FROM enrollments
WHERE id = 5;

-- Ignore duplicate course codes
INSERT INTO courses (course_name, course_code)
VALUES ('Bachelor of Computer Applications', 'BCA')
ON CONFLICT (course_code) DO NOTHING;

-- Insert or update an existing course
INSERT INTO courses (course_name, course_code)
VALUES ('Bachelor of Computer Applications', 'BCA')
ON CONFLICT (course_code)
DO UPDATE SET course_name = EXCLUDED.course_name;

-- Check sequence values
SELECT last_value FROM courses_id_seq;
SELECT last_value FROM enrollments_id_seq;

-- Generate a UUID
SELECT gen_random_uuid();

-- Create a table using UUID as the primary key
CREATE TABLE uuid_students (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Insert records with automatically generated UUIDs
INSERT INTO uuid_students (name, email)
VALUES
('Rahul', 'rahul.uuid@example.com'),
('Priya', 'priya.uuid@example.com');

-- View UUID records
SELECT * FROM uuid_students;