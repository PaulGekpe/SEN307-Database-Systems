-- VUA-SEN307 Database Systems
-- Week 7 Practical - Lab 5: Querying Data
-- Student: Paul Kelechi
-- Matric Number: VUG/SEN/24/12934
--
-- Run this script in MySQL Workbench.
-- It uses the database created and populated during Week 6.

USE sen307_VUG_SEN_24_12934;


-- =========================================================
-- TASK 1: Retrieve all students in Software Engineering,
--         sorted alphabetically by full name.
-- =========================================================
SELECT
    s.full_name,
    s.matric_no,
    d.dept_name
FROM Student s
INNER JOIN Department d
    ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;


-- =========================================================
-- TASK 2: List all courses with the name of each assigned
--         lecturer. A course with multiple lecturers appears
--         once for each lecturer.
-- =========================================================
SELECT
    c.course_code,
    c.course_title,
    l.full_name AS lecturer_name
FROM Course c
INNER JOIN CourseAllocation ca
    ON c.course_id = ca.course_id
INNER JOIN Lecturer l
    ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_code ASC;


-- =========================================================
-- TASK 3: List every student and their courses, including
--         students who have not enrolled in any course.
--         Students without enrolments have NULL course_title.
-- =========================================================
SELECT
    s.full_name,
    s.matric_no,
    c.course_title
FROM Student s
LEFT JOIN Enrolment e
    ON s.student_id = e.student_id
LEFT JOIN Course c
    ON e.course_id = c.course_id
ORDER BY s.full_name ASC;


-- TASK 3 (continued): Show only students who have not
--                     enrolled in any course.
-- In this database, three rows are expected because the
-- Week 6 Transfer Student record was retained.
SELECT
    s.full_name,
    s.matric_no,
    c.course_title
FROM Student s
LEFT JOIN Enrolment e
    ON s.student_id = e.student_id
LEFT JOIN Course c
    ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name ASC;


-- =========================================================
-- TASK 4: Retrieve female students in Software Engineering
--         or Artificial Intelligence, born between
--         2004-01-01 and 2005-12-31.
--         This query uses AND, IN, and BETWEEN.
-- =========================================================
SELECT
    s.full_name,
    s.matric_no,
    s.gender,
    s.date_of_birth,
    d.dept_name
FROM Student s
INNER JOIN Department d
    ON s.dept_id = d.dept_id
WHERE s.gender = 'F'
  AND d.dept_name IN (
      'Software Engineering',
      'Artificial Intelligence'
  )
  AND s.date_of_birth BETWEEN '2004-01-01' AND '2005-12-31'
ORDER BY s.full_name ASC;


-- =========================================================
-- TASK 5: Pagination - first page (enrolment records 1-10).
-- ORDER BY ensures a consistent order for pagination.
-- =========================================================
SELECT *
FROM Enrolment
ORDER BY enrolment_id ASC
LIMIT 10 OFFSET 0;


-- TASK 5 (continued): Second page (enrolment records 11-20).
SELECT *
FROM Enrolment
ORDER BY enrolment_id ASC
LIMIT 10 OFFSET 10;


-- =========================================================
-- OPTIONAL CHALLENGE: Rewrite Task 3 using RIGHT JOIN.
-- This preserves every Student row by placing Student on
-- the right side of the RIGHT JOIN. It should return the
-- same 43 rows as the Task 3 LEFT JOIN query in this dataset.
-- =========================================================
SELECT
    s.full_name,
    s.matric_no,
    c.course_title
FROM Enrolment e
RIGHT JOIN Student s
    ON e.student_id = s.student_id
LEFT JOIN Course c
    ON e.course_id = c.course_id
ORDER BY s.full_name ASC;


-- END OF WEEK 7 PRACTICAL
