DECLARE
  n number := 5;
  n1 number := 1;
  n2 number := 1;
  n3 number;
BEGIN 
  if n < 1 then
    dbms_output.put_line(0);
  elsif n = 1 then
    dbms_output.put_line(1 || ' ');
  elsif n = 2 then
    dbms_output.put_line(1 || ' ');
  else
    dbms_output.put_line(n1);
    dbms_output.put_line(n2);
    for i in 3..n loop
      n3 := n1 + n2;
      n1 := n2;
      n2 := n3;
      dbms_output.put_line(n3 || ' ');
    end loop;
  end if;
END;
/
