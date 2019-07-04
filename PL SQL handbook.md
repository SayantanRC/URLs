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
### Basic exit loops
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
### While loops
```
DECLARE  
   i INTEGER := 1;  
BEGIN  
   WHILE i <= 10 LOOP  
      DBMS_OUTPUT.PUT_LINE(i);  
      i := i+1;  
   END LOOP;  
END;
```
### For loop
Loop variable need not be declared
```
DECLARE   
   VAR1 NUMBER;  
BEGIN   
   VAR1:=10;  
   FOR VAR2 IN 1..5 LOOP  
      DBMS_OUTPUT.PUT_LINE (VAR1*VAR2);  
   END LOOP;  
END;
```
Result:
> 10  
> 20  
> 30  
> 40  
> 50  
### Continue statement
```
DECLARE  
  x NUMBER := 0;  
BEGIN  
  LOOP -- After CONTINUE statement, control resumes here  
    DBMS_OUTPUT.PUT_LINE ('Inside loop:  x = ' || TO_CHAR(x));  
    x := x + 1;  
    IF x < 3 THEN  
      CONTINUE;  
    END IF;  
    DBMS_OUTPUT.PUT_LINE  
      ('Inside loop, after CONTINUE:  x = ' || TO_CHAR(x));  
    EXIT WHEN x = 5;  
  END LOOP;  
   
  DBMS_OUTPUT.PUT_LINE (' After loop:  x = ' || TO_CHAR(x));  
END;
```
Result:
> Inside loop:  x = 0  
> Inside loop:  x = 1  
> Inside loop:  x = 2  
> Inside loop, after CONTINUE:  x = 3  
> Inside loop:  x = 3  
> Inside loop, after CONTINUE:  x = 4  
> Inside loop:  x = 4  
> Inside loop, after CONTINUE:  x = 5  
> After loop:  x = 5  

## GOTO
```
GOTO label_name;  
 ..  
..  
<<label_name>>
```
The "<<>>" need to be written.  
#### Restrictions:
- Cannot transfer control into an IF statement, CASE statement, LOOP statement or sub-block.
- Cannot transfer control from one IF statement clause to another or from one CASE statement WHEN clause to another.
- Cannot transfer control from an outer block into a sub-block.
- Cannot transfer control out of a subprogram.
- Cannot transfer control into an exception handler.

## Procedure

- IN parameters: The IN parameter can be referenced by the procedure or function. The value of the parameter cannot be overwritten by the procedure or the function.
- OUT parameters: The OUT parameter cannot be referenced by the procedure or function, but the value of the parameter can be overwritten by the procedure or function.
- INOUT parameters: The INOUT parameter can be referenced by the procedure or function and the value of the parameter can be overwritten by the procedure or function.

```
CREATE [OR REPLACE] PROCEDURE procedure_name  
    [ (parameter [,parameter]) ]  
IS  
    [declaration_section]  
BEGIN  
    executable_section  
[EXCEPTION  
    exception_section]  
END [procedure_name]; 
```
```
create or replace procedure "INSERTUSER"    
(id IN NUMBER,    
name IN VARCHAR2)    
is    
begin    
   insert into user values(id,name);    
end;
```
<b>Calling:</b>
```
BEGIN    
   insertuser(101,'Rahul');  
   dbms_output.put_line('record inserted successfully');    
END;
```
<b>Dropping:</b>
```
DROP PROCEDURE insertuser;
```
