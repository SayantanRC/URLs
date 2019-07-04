# The code samples have been shamelessly copied from javatpoint.com. All credits to them.

## Sample
```
DECLARE  
   -- constant declaration  
   pi constant number := 3.141592654;  
   -- other declarations  
   radius number(5,2);   
   dia number(5,2);   
   circumference number(7, 2);  
   area number (10, 2);  
BEGIN   
   -- processing  
   radius := 9.5;   
   dia := radius * 2;   
   circumference := 2.0 * pi * radius;  
   area := pi * radius * radius;  
   -- output  
   dbms_output.put_line('Radius: ' || radius);  
   dbms_output.put_line('Diameter: ' || dia);  
   dbms_output.put_line('Circumference: ' || circumference);  
   dbms_output.put_line('Area: ' || area);  
END;
```
Result: 
> Radius: 9.5  
> Diameter: 19  
> Circumference: 59.69  
> Area: 283.53

## If else
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

## Switch case
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

## Loop
### Basic loops
```
DECLARE  
   i NUMBER := 1;  
BEGIN  
   LOOP  
      EXIT WHEN i>10;  
      DBMS_OUTPUT.PUT_LINE(i);  
      i := i+1;  
   END LOOP;  
END;
```
```
DECLARE   
   VAR1 NUMBER;  
   VAR2 NUMBER;  
BEGIN   
   VAR1:=100;  
   VAR2:=1;  
   LOOP  
      DBMS_OUTPUT.PUT_LINE (VAR1*VAR2);  
      IF (VAR2=10) THEN  
         EXIT;  
      END IF;  
      VAR2:=VAR2+1;  
   END LOOP;  
END;
```
