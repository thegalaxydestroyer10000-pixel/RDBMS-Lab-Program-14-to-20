DECLARE
    CURSOR student_cursor IS
        SELECT StudentID, StudentName, DepartmentID
        FROM Student;

    v_StudentID Student.StudentID%TYPE;
    v_StudentName Student.StudentName%TYPE;
    v_DepartmentID Student.DepartmentID%TYPE;

BEGIN
    OPEN student_cursor;

    LOOP
        FETCH student_cursor
        INTO v_StudentID, v_StudentName, v_DepartmentID;

        EXIT WHEN student_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Student ID: ' || v_StudentID ||
            ', Student Name: ' || v_StudentName ||
            ', Department ID: ' || v_DepartmentID
        );
    END LOOP;

    CLOSE student_cursor;
END;
/
