create or replace function get_first_day(date_input in date) return varchar is
  first_day_of_the_month date;
begin
  first_day_of_the_month := trunc(date_input,'mm');
  return to_char(first_day_of_the_month,'Day, dd-mm-yyyy');
end;
/

DECLARE
  sys date := to_date('03-feb-2002','dd-mm-yyyy'); 
BEGIN 
  dbms_output.put_line(get_first_day(sys)); 
END;
/
