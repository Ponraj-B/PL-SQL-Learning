DECLARE
  user_input VARCHAR2(50) := 'FOR';
  status BOOLEAN := FALSE;

  CURSOR reserved_words IS
    SELECT word FROM (
      SELECT 'SELECT' AS word FROM dual UNION ALL
      SELECT 'INSERT' AS word FROM dual UNION ALL
      SELECT 'UPDATE' AS word FROM dual UNION ALL
      SELECT 'DELETE' AS word FROM dual UNION ALL
      SELECT 'WHERE' AS word FROM dual UNION ALL
      SELECT 'AND' AS word FROM dual UNION ALL
      SELECT 'OR' AS word FROM dual UNION ALL
      SELECT 'NOT' AS word FROM dual UNION ALL
      SELECT 'CREATE' AS word FROM dual UNION ALL
      SELECT 'DROP' AS word FROM dual UNION ALL
      SELECT 'ALTER' AS word FROM dual UNION ALL
      SELECT 'TABLE' AS word FROM dual UNION ALL
      SELECT 'VIEW' AS word FROM dual UNION ALL
      SELECT 'FUNCTION' AS word FROM dual UNION ALL
      SELECT 'PROCEDURE' AS word FROM dual UNION ALL
      SELECT 'PACKAGE' AS word FROM dual UNION ALL
      SELECT 'IS' AS word FROM dual UNION ALL
      SELECT 'AS' AS word FROM dual UNION ALL
      SELECT 'BEGIN' AS word FROM dual UNION ALL
      SELECT 'END' AS word FROM dual UNION ALL
      SELECT 'FOR' AS word FROM dual UNION ALL
      SELECT 'RETURN' AS word FROM dual
    );

BEGIN 
  FOR r IN reserved_words LOOP
    IF UPPER(r.word) = UPPER(user_input) THEN
      status := TRUE;
      EXIT;
    END IF;
  END LOOP;
  
  IF status THEN
    DBMS_OUTPUT.PUT_LINE('Word is reserved');
  ELSE    
    DBMS_OUTPUT.PUT_LINE('Word is not reserved');
  END IF;
END;
/
