set serveroutput on;
DECLARE
    emp_id number := &employee_id;
    emp_salary number := 0;
BEGIN
    select salary into emp_salary from employees where employee_id = emp_id;
    DBMS_OUTPUT.PUT_LINE('Salary of the employee is ' || emp_salary);
END;
/
