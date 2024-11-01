create or replace function get_last_day(date_input in date) return varchar is
  last_day_of_the_month date;
begin
  last_day_of_the_month := trunc(date_input,'mm') + interval '1' month - interval '1' day;
  return to_char(last_day_of_the_month,'Day, dd-mm-yyyy');
end;
/

DECLARE
  sys date := to_date('03-feb-2002','dd-mm-yyyy'); 
BEGIN 
  dbms_output.put_line(get_last_day(sys)); 
END;
/

