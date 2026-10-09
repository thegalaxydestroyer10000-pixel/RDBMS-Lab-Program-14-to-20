USE CollegeDB;

CREATE TABLE IF NOT EXISTS Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50) NOT NULL,
    Department VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Employee_Log (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    Message VARCHAR(255),
    LogTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS AfterEmployeeInsert;

DELIMITER $$

CREATE TRIGGER AfterEmployeeInsert
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN

 SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER Employee_Insert_Trigger
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('New employee record inserted successfully');
END;
/
    INSERT INTO Employee
VALUES(101, 'Arun');
-- Insert an automatic message into Employee_Log

END $$

DELIMITER ;

-- Test the trigger

INSERT INTO Employee
VALUES (1, 'Arun', 'Computer Science');

SELECT * FROM Employee;

SELECT * FROM Employee_Log;



