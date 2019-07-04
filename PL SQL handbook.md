### Switch case
```
DECLARE  
   grade char(1) := 'A';  
BEGIN  
   CASE grade  
      when 'A' then dbms_output.put_line('Excellent');  
      when 'B' then dbms_output.put_line('Very good');  
      when 'C' then dbms_output.put_line('Good');  
      when 'D' then dbms_output.put_line('Average');  
      when 'F' then dbms_output.put_line('Passed with Grace');  
      else dbms_output.put_line('Failed');  
   END CASE;  
END;
```
