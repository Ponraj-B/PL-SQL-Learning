DECLARE
  word varchar2(30) := 'PONRAJ';
  result varchar2(30);
  
BEGIN 
  FOR i in 1..length(word) LOOP
    if MOD(i,2) = 0 then
      result := result || Lower(SUBSTR(word,i,1));
    else 
      result := result || UPPER(SUBSTR(word,i,1));
    end if;
  END LOOP;
  
  dbms_output.put_line('The given string is ' || ''''|| word || '''');
  dbms_output.put_line('Toggle case of the above string is ' || '''' || result || '''');
  
END;
/

