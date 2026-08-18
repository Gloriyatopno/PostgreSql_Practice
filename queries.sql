-- Select all students
SELECT *
FROM students
LIMIT 10;


-- Sort students by age from highest to lowest
SELECT *
FROM students
ORDER BY age DESC
LIMIT 10;


-- Display different courses
SELECT DISTINCT course
FROM students;


-- Find students aged 25 or above
SELECT *
FROM students
WHERE age >= 25
LIMIT 10;


-- Find BSc IT students aged 20 or above
SELECT *
FROM students
WHERE age >= 20
AND course = 'BSc IT'
LIMIT 10;


-- Skip the first 10 records and display the next 10
SELECT *
FROM students
ORDER BY id
LIMIT 10 OFFSET 10;


-- Find students from BSc IT or BCA
SELECT *
FROM students
WHERE course IN ('BSc IT', 'BCA')
LIMIT 10;


-- Find students between 20 and 25 years old
SELECT *
FROM students
WHERE age BETWEEN 20 AND 25
LIMIT 10;


-- Find names starting with A using LIKE
SELECT *
FROM students
WHERE first_name LIKE 'A%'
LIMIT 10;


-- Find emails containing "google"
SELECT *
FROM students
WHERE email LIKE '%google%'
LIMIT 10;


-- Find names starting with A using ILIKE
SELECT *
FROM students
WHERE first_name ILIKE 'a%'
LIMIT 10;


-- Find the youngest student
SELECT MIN(age) AS youngest_age
FROM students;


-- Find the oldest student
SELECT MAX(age) AS oldest_age
FROM students;


-- Find the average age
SELECT AVG(age) AS average_age
FROM students;


-- Find the total of all ages
SELECT SUM(age) AS total_age
FROM students;


-- Count students in each course
SELECT course, COUNT(*) AS student_count
FROM students
GROUP BY course;


-- Find the average age for each course
SELECT course, AVG(age) AS average_age
FROM students
GROUP BY course;


-- Find the youngest and oldest student in each course
SELECT
    course,
    MIN(age) AS youngest,
    MAX(age) AS oldest
FROM students
GROUP BY course;


-- Find courses with more than 200 students
SELECT course, COUNT(*) AS student_count
FROM students
GROUP BY course
HAVING COUNT(*) > 200;


-- Calculate age after 5 years
SELECT
    first_name,
    last_name,
    age,
    age + 5 AS age_after_five_years
FROM students
LIMIT 10;


-- Calculate double the age
SELECT
    first_name,
    age,
    age * 2 AS double_age
FROM students
LIMIT 10;


-- Replace NULL course values with "No course"
SELECT
    first_name,
    last_name,
    COALESCE(course, 'No course') AS course
FROM students
LIMIT 10;


-- Return NULL when both values are equal
SELECT NULLIF(10, 10);


-- Return the value when the values are different
SELECT NULLIF(10, 5);


-- Replace age 18 with NULL
SELECT
    first_name,
    age,
    NULLIF(age, 18) AS age_check
FROM students
LIMIT 10;