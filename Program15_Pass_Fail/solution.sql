USE CollegeDB;

DROP PROCEDURE IF EXISTS CheckResult;

DELIMITER $$

CREATE PROCEDURE CheckResult(IN p_marks INT)
BEGIN


END $$

DELIMITER ;

CALL CheckResult(75);



SET SERVEROUTPUT ON;

DECLARE
    marks NUMBER := 65;
BEGIN
    IF marks >= 40 THEN
        DBMS_OUTPUT.PUT_LINE('Student Passed');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Student Failed');
    END IF;
END;
/




