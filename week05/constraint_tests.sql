-- VUA-SEN307 Week 5: Constraint tests
-- Run each intentionally failing statement ONE AT A TIME.
USE sen307_VUG_SEN_24_12934;

-- 1. NOT NULL violation
INSERT INTO Department (dept_name) VALUES (NULL);

-- 2. CHECK violation: allowed credit_units are 1 through 6
INSERT INTO Course (course_code, course_title, credit_units)
VALUES ('TST101', 'Test', 9);

-- 3. FOREIGN KEY violation: department 999 does not exist
INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('TEST001', 'Test', 999);

-- 4. ENUM violation: gender must be 'M' or 'F'
INSERT INTO Student (matric_no, full_name, gender)
VALUES ('TEST002', 'Test', 'X');

-- 5. UNIQUE violation: first insert a valid name once
INSERT INTO Department (dept_name) VALUES ('Test Department');

-- Then run this duplicate insert; it should fail
INSERT INTO Department (dept_name) VALUES ('Test Department');

-- Delete the one valid test row after recording the error
DELETE FROM Department WHERE dept_name = 'Test Department';

-- Counts for the tables specified in the handout
SELECT COUNT(*) FROM Department;
SELECT COUNT(*) FROM Course;
SELECT COUNT(*) FROM Student;
