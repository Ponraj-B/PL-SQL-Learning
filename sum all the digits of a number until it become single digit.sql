DECLARE
  n number := 952;
BEGIN 
  if mod(n,9) = 0  then
    dbms_output.put_line(9);
  else
    dbms_output.put_line(mod(n,9)); 
  end if;
END;
/
