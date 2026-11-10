-- VUA-SEN307 Database Systems - Week 6 Practical
-- Lab 4: Data Manipulation Language (INSERT, UPDATE, DELETE)
-- Student: Paul Kelechi
-- Matric No.: VUG/SEN/24/12934
--
-- IMPORTANT:
-- This is a record of the statements used to populate the Week 6 database.
-- Run it only against a fresh/empty Week 5 schema. Do NOT run it again
-- against the database that already contains the completed Week 6 data,
-- because duplicate-key errors will occur.
--
-- Subqueries are used for department, course, lecturer and student IDs so
-- the script does not depend on AUTO_INCREMENT values starting at 1.

USE sen307_VUG_SEN_24_12934;

-- =========================================================
-- PART 1: DEPARTMENTS
-- =========================================================

INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

-- =========================================================
-- PART 1: COURSES
-- Course descriptions are kept exactly as specified in the handout.
-- =========================================================

INSERT INTO Course
(course_code, course_title, credit_units, description, dept_id)
VALUES
('SEN307', 'Database Systems', 3,
 'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),

('SEN301', 'Software Architecture', 3,
 'Architectural styles, design patterns, microservices and how to structure large software systems.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),

('COS301', 'Operating Systems', 3,
 'Processes, threads, CPU scheduling, memory management and file systems.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),

('COS305', 'Computer Networks', 3,
 'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),

('AIN301', 'Introduction to Artificial Intelligence', 3,
 'Intelligent agents, search algorithms, knowledge representation and reasoning.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),

('AIN305', 'Machine Learning', 3,
 'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),

('AIN307', 'Natural Language Processing', 3,
 'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),

('DTS301', 'Data Visualization and Analytics', 2,
 'Exploratory data analysis, charts, dashboards and telling stories with data.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),

('DTS305', 'Big Data Technologies', 3,
 'Distributed storage and processing of very large datasets with Hadoop and Spark.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),

('CYB301', 'Network Security', 3,
 'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

-- Optional Part 1 verification
SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d
LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

SELECT dept_id, dept_name FROM Department;
SELECT course_id, course_code FROM Course;

-- =========================================================
-- PART 2, STEP 1: TEN LECTURERS
-- =========================================================

INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUA/ST/103', 'Prof Chinedu Eze', 'c.eze@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUA/ST/104', 'Dr Fatima Ibrahim', 'f.ibrahim@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUA/ST/105', 'Dr Ngozi Nwosu', 'n.nwosu@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUA/ST/106', 'Dr Samuel Okoro', 's.okoro@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUA/ST/107', 'Dr Grace Adeyemi', 'g.adeyemi@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUA/ST/108', 'Dr Tunde Bakare', 't.bakare@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUA/ST/109', 'Dr Aisha Mohammed', 'a.mohammed@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
('VUA/ST/110', 'Dr David Etim', 'd.etim@vua.edu.ng',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

-- =========================================================
-- PART 2, STEP 2: TWENTY STUDENTS
-- Includes the student's own name and matriculation number.
-- =========================================================

INSERT INTO Student
(matric_no, full_name, gender, date_of_birth, dept_id)
VALUES
('VUG/SEN/24/12934', 'Paul Kelechi', 'M', '2004-06-15',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUG/SEN/24/12001', 'Ada Obi', 'F', '2005-03-14',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUG/SEN/24/12002', 'John Musa', 'M', '2004-11-02',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUG/SEN/24/12003', 'Grace Eze', 'F', '2006-01-20',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUG/SEN/24/12004', 'Chinedu Okafor', 'M', '2003-08-12',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUG/SEN/24/12005', 'Fatima Bello', 'F', '2005-07-25',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUG/SEN/24/12006', 'Samuel Etim', 'M', '2004-02-18',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUG/SEN/24/12007', 'Ngozi Nwosu', 'F', '2006-09-10',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUG/SEN/24/12008', 'David James', 'M', '2007-04-05',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
('VUG/SEN/24/12009', 'Aisha Mohammed', 'F', '2005-12-11',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
('VUG/SEN/24/12010', 'Emeka Okoro', 'M', '2003-05-19',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUG/SEN/24/12011', 'Blessing Daniel', 'F', '2004-10-22',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('VUG/SEN/24/12012', 'Ibrahim Sani', 'M', '2006-03-08',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUG/SEN/24/12013', 'Mercy Johnson', 'F', '2007-06-16',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('VUG/SEN/24/12014', 'Peter Udo', 'M', '2005-01-30',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUG/SEN/24/12015', 'Esther James', 'F', '2004-08-09',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('VUG/SEN/24/12016', 'Daniel Ekong', 'M', '2003-11-27',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUG/SEN/24/12017', 'Ruth Adeyemi', 'F', '2006-05-13',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('VUG/SEN/24/12018', 'Michael Bassey', 'M', '2005-09-21',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),
('VUG/SEN/24/12019', 'Joy Samuel', 'F', '2007-02-14',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

-- =========================================================
-- PART 2, STEP 3: FORTY ENROLMENTS
-- Michael Bassey and Joy Samuel intentionally have no enrolments.
-- CYB301 intentionally has no enrolled students.
-- =========================================================

INSERT INTO Enrolment (student_id, course_id) VALUES
-- SEN307: eight students
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12934'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12001'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12002'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12003'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12004'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12005'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12006'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN307')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12007'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN307')),

-- SEN301: four students
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12934'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN301')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12001'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN301')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12002'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN301')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12003'),
 (SELECT course_id FROM Course WHERE course_code = 'SEN301')),

-- COS301: four students
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12004'),
 (SELECT course_id FROM Course WHERE course_code = 'COS301')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12005'),
 (SELECT course_id FROM Course WHERE course_code = 'COS301')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12006'),
 (SELECT course_id FROM Course WHERE course_code = 'COS301')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12007'),
 (SELECT course_id FROM Course WHERE course_code = 'COS301')),

-- COS305: four students
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12008'),
 (SELECT course_id FROM Course WHERE course_code = 'COS305')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12009'),
 (SELECT course_id FROM Course WHERE course_code = 'COS305')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12010'),
 (SELECT course_id FROM Course WHERE course_code = 'COS305')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12011'),
 (SELECT course_id FROM Course WHERE course_code = 'COS305')),

-- AIN301: four students
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12012'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN301')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12013'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN301')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12014'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN301')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12015'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN301')),

-- AIN305: four students
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12016'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN305')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12017'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN305')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12934'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN305')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12001'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN305')),

-- AIN307: four students
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12002'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN307')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12003'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN307')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12004'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN307')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12005'),
 (SELECT course_id FROM Course WHERE course_code = 'AIN307')),

-- DTS301: four students
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12006'),
 (SELECT course_id FROM Course WHERE course_code = 'DTS301')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12007'),
 (SELECT course_id FROM Course WHERE course_code = 'DTS301')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12008'),
 (SELECT course_id FROM Course WHERE course_code = 'DTS301')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12009'),
 (SELECT course_id FROM Course WHERE course_code = 'DTS301')),

-- DTS305: four students
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12010'),
 (SELECT course_id FROM Course WHERE course_code = 'DTS305')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12011'),
 (SELECT course_id FROM Course WHERE course_code = 'DTS305')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12012'),
 (SELECT course_id FROM Course WHERE course_code = 'DTS305')),
((SELECT student_id FROM Student WHERE matric_no = 'VUG/SEN/24/12013'),
 (SELECT course_id FROM Course WHERE course_code = 'DTS305'));

-- =========================================================
-- PART 2, STEP 4: COURSE ALLOCATIONS
-- Every course has at least one lecturer; SEN307 has two.
-- =========================================================

INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
((SELECT course_id FROM Course WHERE course_code = 'SEN307'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/101')),
((SELECT course_id FROM Course WHERE course_code = 'SEN307'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/102')),
((SELECT course_id FROM Course WHERE course_code = 'SEN301'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/101')),
((SELECT course_id FROM Course WHERE course_code = 'COS301'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/103')),
((SELECT course_id FROM Course WHERE course_code = 'COS305'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/104')),
((SELECT course_id FROM Course WHERE course_code = 'AIN301'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/105')),
((SELECT course_id FROM Course WHERE course_code = 'AIN305'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/106')),
((SELECT course_id FROM Course WHERE course_code = 'AIN307'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/105')),
((SELECT course_id FROM Course WHERE course_code = 'DTS301'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/107')),
((SELECT course_id FROM Course WHERE course_code = 'DTS305'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/108')),
((SELECT course_id FROM Course WHERE course_code = 'CYB301'),
 (SELECT lecturer_id FROM Lecturer WHERE staff_no = 'VUA/ST/109'));

-- =========================================================
-- PART 3: UPDATE THE STUDENT'S DEPARTMENT
-- Paul Kelechi is moved from Software Engineering to Computer Science.
-- =========================================================

SELECT s.matric_no, s.full_name, d.dept_name
FROM Student s
JOIN Department d ON s.dept_id = d.dept_id
WHERE s.matric_no = 'VUG/SEN/24/12934';

UPDATE Student
SET dept_id = (SELECT dept_id FROM Department
               WHERE dept_name = 'Computer Science')
WHERE matric_no = 'VUG/SEN/24/12934';

SELECT s.matric_no, s.full_name, d.dept_name
FROM Student s
JOIN Department d ON s.dept_id = d.dept_id
WHERE s.matric_no = 'VUG/SEN/24/12934';

-- =========================================================
-- PART 4: REFERENTIAL INTEGRITY
-- Create a temporary department and its dependent student.
-- =========================================================

INSERT INTO Department (dept_name)
VALUES ('Library and Information Science');

INSERT INTO Student (matric_no, full_name, dept_id)
VALUES (
    '20239999',
    'Transfer Student',
    (SELECT dept_id FROM Department
     WHERE dept_name = 'Library and Information Science')
);

-- The following DELETE was deliberately attempted and returned Error 1451
-- because Transfer Student still references this department.
-- It is commented out so the complete script can continue if replayed.
-- DELETE FROM Department
-- WHERE dept_name = 'Library and Information Science';

-- Correct the foreign-key dependency by reassigning the student.
UPDATE Student
SET dept_id = (SELECT dept_id FROM Department
               WHERE dept_name = 'Software Engineering')
WHERE matric_no = '20239999';

-- Now the department can be deleted.
DELETE FROM Department
WHERE dept_name = 'Library and Information Science';

SELECT * FROM Department;

-- =========================================================
-- FINAL VERIFICATION
-- =========================================================

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;
