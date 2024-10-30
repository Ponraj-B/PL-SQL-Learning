set serveroutput on;
declare
    dob date := &dob;
    years number;
    months number;
    days number;
    age varchar2(50);
begin
    years := trunc(months_between(sysdate,dob)/12);
    months := trunc(months_between(sysdate,dob) - (years*12));
    days := trunc(SYSDATE - ADD_MONTHS(dob, (years * 12) + months));
    age := age || trunc(years) || ' Years ';
    if months <> 0 then
      age  := age || months || ' months ';
    end if;
    if days <> 0 then
      age := age || 'and ' || days || ' days';
    end if;
    dbms_output.put_line(age);
end;
/
         
