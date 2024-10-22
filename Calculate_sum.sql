DECLARE
  	num1 number := 10;
  	num2 number := 20;
  	sum number;
BEGIN 
  	sum := num1 + num2;
  	dbms_output.put_line(sum); 
END;
/
