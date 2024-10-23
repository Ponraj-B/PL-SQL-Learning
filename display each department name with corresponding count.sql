set serveroutput on;
declare
    cursor dept is
        SELECT d.department_name, COUNT(e.employee_id) AS employee_count FROM departments d LEFT JOIN employees e ON d.department_id = e.department_id GROUP BY d.department_name ORDER BY d.department_name;
    dept_details dept%rowtype;   
    count number;
    dept_name varchar2(30);
begin
    open dept;
    loop
        fetch dept into dept_details;
        exit when dept%notfound;
        dbms_output.put_line('department ' || dept_details.department_name || '; Count ' || dept_details.employee_count);
    end loop;
    close dept;
end;
/
