--  Mobile no validation

create or replace function check_integer(ch in char) return boolean is
begin
    return ch between '0' and '9';
end;
/

create or replace function check_mobile_number(mobile_no in varchar2) return boolean is
    flag number := 0;
begin
    if length(mobile_no) = 10 then
        for i in 1..length(mobile_no) loop
            if not check_integer(substr(mobile_no, i, 1)) then
                flag := 1;
                exit;
            end if;
        end loop;

    elsif length(mobile_no) = 14 then
        if substr(mobile_no, 1, 1) = '+' then
            if check_integer(substr(mobile_no, 2, 1)) and 
               check_integer(substr(mobile_no, 3, 1)) and 
               substr(mobile_no, 4, 1) = ' ' then
                for i in 5..length(mobile_no) loop    
                    if not check_integer(substr(mobile_no, i, 1)) then
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

    elsif length(mobile_no) = 13 then
        if check_integer(substr(mobile_no, 1, 1)) and 
           check_integer(substr(mobile_no, 2, 1)) then
            if substr(mobile_no, 3, 1) = ' ' then
                for i in 4..length(mobile_no) loop
                    if not check_integer(substr(mobile_no, i, 1)) then
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

    if flag = 0 then
        return true;
    else
        return false;
    end if;
end;
/

-- Sample test block
declare
    mobile varchar2(14) := '919489782182'; -- Adjusted to match mobile_no length
begin
    if check_mobile_number(mobile) then
        dbms_output.put_line('Mobile number ' || mobile || ' is valid');
    else
        dbms_output.put_line('Mobile number ' || mobile || ' is not valid');
    end if;
end;
/
