USE CollegeDB;

CREATE TABLE IF NOT EXISTS Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50) NOT NULL,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

INSERT IGNORE INTO Department
VALUES
(1, 'Computer Science'),
(2, 'Commerce');

DROP PROCEDURE IF EXISTS InsertStudent;

DELIMITER $$

CREATE PROCEDURE InsertStudent(
    IN p_student_id INT,
    IN p_student_name VARCHAR(50),
    IN p_department_id INT
)
BEGIN
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE Insert_Student(
    p_id IN INT,
    p_name IN VARCHAR,
    p_dept IN INT
)
AS
BEGIN
    INSERT INTO Student(StudentID, StudentName, DepartmentID)
    VALUES(p_id, p_name, p_dept);

    DBMS_OUTPUT.PUT_LINE('Student record inserted successfully');
END;
/
    -- Insert the student record

END $$

DELIMITER ;

-- Test
CALL InsertStudent(105, 'Kavin', 1);

SELECT * FROM Student;




