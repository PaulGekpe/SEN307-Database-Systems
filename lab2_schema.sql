-- VUA-SEN307 Week 4 Practical: Database Design and Normalization
-- Student: Paul Kelechi | Matric No: VUG/SEN/24/12934
-- Schema follows the 3NF design in lab2_normalization.pdf.
-- Lecturer-to-course pairings are not seeded because the supplied sheet does not
-- unambiguously map every lecturer to each course; avoid inventing assignments.

CREATE DATABASE IF NOT EXISTS `sen307_VUG_SEN_24_12934`;
USE `sen307_VUG_SEN_24_12934`;

CREATE TABLE Department (
  dept_id INT AUTO_INCREMENT PRIMARY KEY,
  dept_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Student (
  student_id INT AUTO_INCREMENT PRIMARY KEY,
  matric_no VARCHAR(20) NOT NULL UNIQUE,
  full_name VARCHAR(100) NOT NULL,
  dept_id INT NOT NULL,
  CONSTRAINT fk_student_department FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Lecturer (
  lecturer_id INT AUTO_INCREMENT PRIMARY KEY,
  lecturer_name VARCHAR(100) NOT NULL,
  dept_id INT NOT NULL,
  CONSTRAINT fk_lecturer_department FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Course (
  course_id INT AUTO_INCREMENT PRIMARY KEY,
  course_code VARCHAR(20) NOT NULL UNIQUE,
  course_title VARCHAR(150) NOT NULL
);

-- One row represents one lecturer teaching one course in one academic session.
CREATE TABLE CourseOffering (
  offering_id INT AUTO_INCREMENT PRIMARY KEY,
  course_id INT NOT NULL,
  lecturer_id INT NOT NULL,
  session VARCHAR(20) NOT NULL,
  CONSTRAINT uq_course_lecturer_session UNIQUE (course_id, lecturer_id, session),
  CONSTRAINT fk_offering_course FOREIGN KEY (course_id) REFERENCES Course(course_id),
  CONSTRAINT fk_offering_lecturer FOREIGN KEY (lecturer_id) REFERENCES Lecturer(lecturer_id)
);

-- Composite primary key prevents duplicate enrolment in the same offering.
CREATE TABLE Enrolment (
  student_id INT NOT NULL,
  offering_id INT NOT NULL,
  PRIMARY KEY (student_id, offering_id),
  CONSTRAINT fk_enrolment_student FOREIGN KEY (student_id) REFERENCES Student(student_id),
  CONSTRAINT fk_enrolment_offering FOREIGN KEY (offering_id) REFERENCES CourseOffering(offering_id)
);

-- Supported department/student/course/lecturer facts from the supplied sample.
INSERT INTO Department (dept_name) VALUES
 ('Software Engineering'), ('Computer Science');

INSERT INTO Student (matric_no, full_name, dept_id) VALUES
 ('20231234', 'Ada Obi', (SELECT dept_id FROM Department WHERE dept_name='Software Engineering')),
 ('20231235', 'John Musa', (SELECT dept_id FROM Department WHERE dept_name='Computer Science')),
 ('20231236', 'Grace Okon', (SELECT dept_id FROM Department WHERE dept_name='Software Engineering'));

INSERT INTO Lecturer (lecturer_name, dept_id) VALUES
 ('Dr A. Okafor', (SELECT dept_id FROM Department WHERE dept_name='Software Engineering')),
 ('Dr M. Bello', (SELECT dept_id FROM Department WHERE dept_name='Software Engineering')),
 ('Mrs F. Eze', (SELECT dept_id FROM Department WHERE dept_name='Computer Science'));

INSERT INTO Course (course_code, course_title) VALUES
 ('SEN307', 'Database Systems'),
 ('SEN301', 'Software Architecture'),
 ('COS301', 'Operating Systems');
