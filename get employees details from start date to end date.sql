set serveroutput on;
create or replace package XX_EMPLOYEE_2332976_PKG AS
    PROCEDURE EMP_DETAILS(
    P_start_date date,
    P_end_date date
    );
END XX_EMPLOYEE_2332976_PKG;
/

CREATE OR REPLACE PACKAGE BODY XX_EMPLOYEE_2332976_PKG AS
    
    PROCEDURE EMP_DETAILS( P_start_date date, P_end_date date) IS
        CURSOR EMP_DATA IS 
            select * from employees where hire_date between p_start_date and p_end_date;
        EMP_ROW EMP_DATA%ROWTYPE;
    
    BEGIN
        OPEN EMP_DATA;
        LOOP
            FETCH EMP_DATA INTO EMP_ROW;
            EXIT WHEN EMP_DATA%NOTFOUND;
            dbms_output.put_line('Employee id ' || EMP_ROW.employee_id);
            dbms_output.put_line('Name ' || EMP_ROW.first_name || ' ' || EMP_ROW.last_name);
            dbms_output.put_line('DOJ ' || EMP_ROW.hire_date);
            dbms_output.put_line('Department ' || EMP_ROW.department_id);
            dbms_output.put_line('Manager ' || EMP_ROW.manager_id);
            dbms_output.put_line('Email ' || EMP_ROW.email);
            dbms_output.put_line('Phone Number ' || EMP_ROW.employee_id);
        END LOOP;
        CLOSE EMP_DATA;
    END;
    
END XX_EMPLOYEE_2332976_PKG;
/

set serveroutput on;
Declare
    start_date date := TO_DATE('&date1', 'DD-MON-YYYY');
    end_date date := TO_DATE('&date2', 'DD-MON-YYYY');
Begin
    XX_EMPLOYEE_2332976_PKG.EMP_DETAILS(start_date,end_date);
End;
/
