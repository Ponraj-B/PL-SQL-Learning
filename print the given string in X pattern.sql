set serveroutput on;
DECLARE
  word varchar2(30) := 'RACECAR';
  l number := length(word); 
  left number := 1;
  right number := 7;
  row_result varchar2(7);
BEGIN 
  for i in 1..7 loop
    for j in 1..7 loop
      if i=j then
        row_result := row_result || substr(word,j,1);
      elsif j=right then
        row_result := row_result || substr(word,j,1);
      else
        row_result := row_result || ' ';
      end if;
    end loop;
    left := left + 1;
    right := right - 1;
    dbms_output.put_line(row_result);
    row_result := '';
  end loop;
END;
/
