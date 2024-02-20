DROP DATABASE IF EXISTS courses;
CREATE DATABASE courses;
USE courses;

CREATE TABLE students (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL
);

CREATE TABLE instructors (
	instructor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL
);

CREATE TABLE courses (
	course_number INT PRIMARY KEY,
    course_name VARCHAR(20) NOT NULL,
    course_description VARCHAR(60),
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES instructors (instructor_id)
);

CREATE TABLE enrollments (
	student_id INT,
    course_number INT,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES students (student_id),
    FOREIGN KEY (course_number) REFERENCES courses (course_number)
);

INSERT INTO students (first_name, last_name)
VALUES
('Alice', 'A'),
('Bob', 'B'),
('Cindy', 'C'),
('Daniel', 'D');

INSERT INTO instructors (first_name, last_name)
VALUES
('Elise', 'E'),
('Frank', 'F'),
('Pain', 'T'),
('Gus', 'G');

INSERT INTO courses
VALUES
(1000, 'Math 101', 'Intro math', 1),
(1010, 'Math 102', 'Statistics', 1),
(1100, 'Science 101', 'Intro science', 2),
(1110, 'Science 102', 'Biology', 2),
(2000, 'English 101', 'Intro to Literature', 3),
(2010, 'English 102', 'American Literature', 3),
(2020, 'English 200', 'Classical Literature', 4);

INSERT INTO courses (course_number, course_name, course_description)
VALUES
(1120, 'Science 103', 'Chemistry'),
(1130, 'Science 104', 'Geology');

INSERT INTO enrollments
VALUES
(1, 1000, 'B'),
(1, 1100, 'A'),
(2, 1000, 'B'),
(2, 1010, 'A');
