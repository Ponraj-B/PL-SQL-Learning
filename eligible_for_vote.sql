DECLARE
  DOB date := '03-FEB-2002';
  age number;
BEGIN 
  age := trunc(MONTHS_BETWEEN(SYSDATE, DOB)/12);
  if age >= 18 then
    dbms_output.put_line('Eligible for Vote');
  else
    dbms_output.put_line('Not eligible for vote');
  end if;
END;
/
