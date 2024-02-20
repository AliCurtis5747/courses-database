USE  courses;
DROP TRIGGER IF EXISTS courses_update_audit;
DROP TABLE IF EXISTS course_audit;
-- Ali Donald Curtis

-- Creates a table that contains a record of all edits to the courses table
CREATE TABLE course_audit(

	course_number INT,
    course_name VARCHAR(20),
    course_description VARCHAR(60),
    instructor_id INT,
    IsOld VARCHAR(10),
    edit_time DATETIME
);

DELIMITER // 
-- Create a trigger to determine if the courses table was edited 
CREATE TRIGGER courses_update_audit
		AFTER update ON courses
        FOR EACH ROW
BEGIN
		INSERT INTO course_audit
         VALUES (old.course_number, old.course_name,
        old.course_description, old.instructor_id, 
        "OLD", NOW());
        INSERT INTO course_audit
        VALUES (new.course_number, new.course_name,
        new.course_description, new.instructor_id, 
        "UPDATED", NOW());
END// 

DELIMITER ;

UPDATE courses
SET course_description = "Chemical engineering"  WHERE course_number = 1120;

SELECT * FROM course_audit;