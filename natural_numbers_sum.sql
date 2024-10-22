DECLARE
  iteration number := 5; 
  sum number;
BEGIN 
  sum := (iteration*(iteration+1))/2;
  dbms_output.put_line(sum);
END;
/
