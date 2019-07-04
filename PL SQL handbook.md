### If else
```
IF condition1   
THEN  
   {...statements to execute when condition1 is TRUE...}  
ELSIF condition2   
THEN  
   {...statements to execute when condition2 is TRUE...}  
ELSE  
   {...statements to execute when both condition1 and condition2 are FALSE...}  
END IF;
```
```
DECLARE  
   a number(3) := 500;  
BEGIN  
   -- check the boolean condition using if statement   
   IF( a < 20 ) THEN  
      -- if condition is true then print the following    
      dbms_output.put_line('a is less than 20 ' );  
   ELSE  
      dbms_output.put_line('a is not less than 20 ' );  
   END IF;  
   dbms_output.put_line('value of a is : ' || a);  
END;
```

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
