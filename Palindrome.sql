DECLARE
  word varchar2(20) := 'MAMA';
  len number := length(word);
  left number := 1;
  right number := len;
  flag number := 0;
  
BEGIN 
  
  while left <= right LOOP
    if SUBSTR(WORD,left,1) <> SUBSTR(WORD,right,1) then
      DBMS_OUTPUT.PUT_LINE('The given word ' || word || ' is not a palindrome.');
      flag := 1;
      EXIT;
    END IF;
    left := left + 1;
    right := right - 1;
  END LOOP;
  
  IF flag = 0 then
    DBMS_OUTPUT.PUT_LINE('The Given word ' || word  ||' is Palindrome');
  end if;
  
END;
/

