DECLARE
  num number := 021;
  temp number := num;
  reversed_num number := 0;
  
BEGIN 
  
  while temp<>0 LOOP
    reversed_num := (reversed_num * 10) + MOD(temp,10);
    temp := Trunc(temp/10);
  END LOOP;
  
  IF num = reversed_num then
    DBMS_OUTPUT.PUT_LINE('The Given number ' || num || ' is Palindrome');
  else 
    DBMS_OUTPUT.PUT_LINE('The Given number ' || num || ' is not a Palindrome');
  end if;
  
END;
/

