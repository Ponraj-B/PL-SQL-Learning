set serveroutput on;
DECLARE
  date1 date := &in1;
  date2 date := &in2;
BEGIN 
  dbms_output.put_line('Days between ' || date1 || ' and ' || 'date2 is ' || 
  (date1-date2)); 
END;
/
