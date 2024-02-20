USE courses;
-- A script that creates all the views for this database

-- Shows courses that do not hve an instructor assigned
DROP VIEW IF EXISTS seeUntaught;
CREATE VIEW seeUntaught AS

SELECT course_number, course_description, course_name FROM courses WHERE instructor_id IS NULL;

-- Shows students that are not enrolled in any courses
DROP VIEW IF EXISTS seeUnenrolled;
CREATE VIEW seeUnenrolled AS

SELECT student_id, first_name, last_name FROM students WHERE student_id NOT IN (SELECT student_ID FROM enrollments); 
SELECT * FROM seeUnenrolled; 

-- Shows courses that are STEM
DROP VIEW IF EXISTS seeSTEM;
CREATE VIEW seeSTEM AS

SELECT * FROM courses WHERE course_number < 2000; 
