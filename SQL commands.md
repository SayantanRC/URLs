#### Create, use, drop database
```
CREATE DATABASE sample;  
USE sample;  
DROP DATABASE sample;  
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
salary DECIMAL(10.2)  
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
#### Drop table
```
DROP TABLE emp_info;
```
#### Arithmetic operators
```
SELECT 5 + 10;  
SELECT 11 % 5;  
```
