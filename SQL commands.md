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
INSERT INTO employee(id, name, dob, email, department, salary)  
VALUES (1121, 'SayantanRC', '1996-06-25 17:33:21', 'sayantan.kgp@gmail.com', 'android', 52000.50);  

INSERT INTO employee  
VALUES (1122, 'ABC', '1996-06-26 15:53:51', 'abc@gmail.com', 'design', 55000.00);  
```
```
INSERT INTO employee  
VALUES (1123, 'BCD', '1997-06-26 15:50:11', 'bcd@gmail.com', 'design', 50000.00);  
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
#### Drop table
```
DROP TABLE emp_info;
```
#### Drop database
```
DROP DATABASE sample;  
```
