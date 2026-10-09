USE CollegeDB;

DROP FUNCTION IF EXISTS CountStudentsByDepartment;

DELIMITER $$

CREATE FUNCTION CountStudentsByDepartment(
    p_department_id INT
)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN

    DECLARE student_count INT;

    SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION Count_Students(
    p_dept IN INT
)
RETURN INT
AS
    total INT;
BEGIN
    SELECT COUNT(*)
    INTO total
    FROM Student
    WHERE DepartmentID = p_dept;

    RETURN total;
END;
/-- Count students belonging to the given department

   DECLARE
    result INT;
BEGIN
    result := Count_Students(10);
    DBMS_OUTPUT.PUT_LINE('Number of Students = ' || result);
END;
/ -- Return the count

END $$

DELIMITER ;

-- Test
SELECT CountStudentsByDepartment(1) AS StudentCount;



