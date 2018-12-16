#### Create, use database
```
CREATE DATABASE sample;  
USE sample;  
```
#### See present tables
```
SHOW TABLES
```
#### Create table
```
CREATE TABLE employee  
(  
id INT PRIMARY KEY,  
age INT,
name VARCHAR(30),  
dob DATETIME,  
email VARCHAR(50),  
department VARCHAR(10),  
salary DECIMAL(10.2) --two digits after decimal point  
);  
```
#### See table description
```
DESC employee;
```
#### Insert into table
```
INSERT INTO employee(id, age, name, dob, email, department, salary)  
VALUES (1121, 22, 'SayantanRC', '1996-06-25 17:33:21', 'sayantan.kgp@gmail.com', 'android', 52000.50);  
```
```
INSERT INTO employee  
VALUES (1122, 23, 'ABC', '1996-06-26 15:53:51', 'abc@gmail.com', 'design', 55000.00);  
```
```
INSERT INTO employee  
VALUES (1123, 22, 'BCD', '1997-06-26 15:50:11', 'bcd@gmail.com', 'design', 50000.00);  
```
```
INSERT INTO employee  
VALUES (1124, 23, 'ArupG', '1989-01-26 10:40:00', 'arupganguli@hotmail.com', 'fabrication', 56500.00);  
```
#### Make a table from another table
```
CREATE TABLE emp_info AS  
SELECT id, dob, email  
FROM employee  
WHERE department='design';  
```
#### Insert into table from another table
```
INSERT INTO emp_info(id, dob, email)  
SELECT id, dob, email  
FROM employee  
WHERE email NOT NULL;
```
#### Select from table
```
SELECT id, name  
FROM employee  
```
#### Arithmetic operators
```
SELECT 5 + 10;  
SELECT 11 % 5;  
```
#### Comparison/relational operators
```
SELECT *  
FROM employee  
WHERE salary>53000;  
```
```
SELECT id  
FROM employee  
WHERE department<>'design';  --not equal to
```
#### Logical operators (AND, OR, IN, BETWEEN, IS NULL, NOT NULL, ALL, LIKE)
```
SELECT *  
FROM employee  
WHERE salary>53000 AND department='design';  
```
```
SELECT *  
FROM employee  
WHERE name LIKE 'S%' OR name LIKE '_B_';  --% means one, zero or more chars, _ means one char  
```
```
SELECT *  
FROM employee  
WHERE dapartment IN ('design', 'fabrication', 'paint');  --Skips the non existent 'paint' department.
```
```
SELECT *  
FROM employee  
WHERE salary BETWEEN 50000 AND 55000;  --both limits are included
```
```
SELECT *  
FROM employee  
WHERE id >= 1122 ALL (SELECT id FROM employee WHERE salary < 56000);  --shows the middle two rows  
```
#### Update table
```
UPDATE employee  
SET email='bin.sayantan@gmail.com'  
WHERE name='SayantanRC'  
```
#### Top/limit
```
SELECT TOP 3 *  
FROM employee;
```
```
SELECT *  
FROM employee  
LIMIT 3;
```
#### Order by
```
SELECT *  
FROM employee  
ORDER BY name;  --ascending
```
```
SELECT *  
FROM employee  
ORDER BY salary DESC;  --descending
```
#### Group by
```
SELECT age, COUNT(*)  --this query returns 2 columns, age and number of people with that age
FROM employee  
GROUP BY age;  
```
```
SELECT age, SUM(salary)  --this query returns 2 columns, age and total salary of that age group
FROM employee  
GROUP BY age;  
```
#### Distinct
```
SELECT DISTINCT age  
FROM employee  
```
#### Inner join
Make a new table first:
```
CREATE TABLE compensation  
(  
department VARCHAR(10) PRIMARY KEY,  
amount DECIMAL(5.2)  
);
```
Insert into table:
```
INSERT INTO compensation  
VALUES ('android', 5000);  
INSERT INTO compensation  
VALUES ('design', 4500.50);  
INSERT INTO compensation  
VALUES ('paint', 5200.00);  
```
Make a JOIN statement to join the two tables.
```
SELECT e.id, e.name, e.salary, c.amount  
FROM employee AS e  
JOIN compensation AS c  
ON e.department=c.department;  
```
Or
```
SELECT e.id, e.name, e.salary, c.amount  
FROM employee AS e  
JOIN compensation AS c  
ON e.department=c.department;  
```
<b>compensation</b> table has no row with `department`='fabrication'. So, based on the given ON condition, employee 'ArupG' will not be shown because for him, `e.departent` is never equal to `c.department`.  
#### Left join
This will show employee 'ArupG' with a `amount`=null from <b>compensation</b> table.
```
SELECT e.id, e.name, e.salary, c.amount  
FROM employee AS e  
LEFT JOIN compensation AS c  
ON e.department=c.department;  
```
#### Right join
This will show an employee with `e.id`=`e.name`=`e.salary`=null and `amount`=5200.00 (for `department`='paint') from <b>compensation</b> table.
```
SELECT e.id, e.name, e.salary, c.amount  
FROM employee AS e  
RIGHT JOIN compensation AS c  
ON e.department=c.department;  
```
#### Delete from table
```
DELETE FROM employee  
WHERE id=1123  
```
#### Drop table
```
DROP TABLE emp_info;
```
#### Drop database
```
DROP DATABASE sample;  
```
