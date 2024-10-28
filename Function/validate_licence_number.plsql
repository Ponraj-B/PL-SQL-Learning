create or replace function check_integer(ch in char) return boolean is
begin
  return ch between '0' and '9';
end;
/

create or replace function validate_licence(licence_no in varchar2) return boolean is
  flag number := 0;
begin
  if length(licence_no) = 16 then
    if substr(licence_no, 1, 1) between 'A' and 'Z' and
       substr(licence_no, 2, 1) between 'A' and 'Z' then
         
      if substr(licence_no, 3, 1) = '-' then
        for i in 4..length(licence_no) loop
          if not check_integer(substr(licence_no, i, 1)) then
            flag := 1;
            exit;
          end if;
        end loop;
      elsif substr(licence_no, 3, 1) between '0' and '9' then
        if substr(licence_no, 4, 1) between '0' and '9' and
           substr(licence_no, 5, 1) = ' ' then
          for i in 6..length(licence_no) loop
            if not check_integer(substr(licence_no, i, 1)) then
              flag := 1;
              exit;
            end if;
          end loop;
        else
          flag := 1;
        end if;
      else
        flag := 1;
      end if;
    else
      flag := 1;
    end if;
  else
    flag := 1;
  end if;

  if flag = 0 then
    return true;
  else
    return false;
  end if;
end;
/

set serveroutput on;
declare
  lic_no varchar2(16) := 'HR06 19850034761';
begin
  if validate_licence(lic_no) then
    dbms_output.put_line('licence_no is valid');
  else
    dbms_output.put_line('licence_no is not valid');
  end if;
end;
/
