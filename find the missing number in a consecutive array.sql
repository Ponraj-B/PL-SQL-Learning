DECLARE 
    n NUMBER := 5;
    TYPE array IS TABLE OF NUMBER INDEX BY PLS_INTEGER;
    num_array array;
    sum NUMBER := 0;
    first_n_natural_num_sum NUMBER;
    errored_series VARCHAR2(100); -- Make sure the size is sufficient
BEGIN
    -- Initialize the array with numbers
    num_array(1) := 1;
    num_array(2) := 2;
    num_array(3) := 4;
    num_array(4) := 5;

    -- Iterate through the array using proper indexing
    FOR i IN 1 .. num_array.COUNT LOOP
        sum := sum + num_array(i);
        errored_series := errored_series || num_array(i) || ' ';
    END LOOP;

    first_n_natural_num_sum := TRUNC((n * (n + 1)) / 2);
    DBMS_OUTPUT.PUT_LINE('Actual series is - ' || errored_series);
    DBMS_OUTPUT.PUT_LINE('The missing number among the above series is ' || (first_n_natural_num_sum - sum));
END;
/
