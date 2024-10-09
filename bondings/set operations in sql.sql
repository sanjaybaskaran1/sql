create database `set operations`;
use `set operations`;

CREATE TABLE employees (
    id INT ,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE contractors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
INSERT INTO employees (id,`name`) VALUES
(1,'Alice'),
(2,'Bob'),
(3,'Charlie'),
(1,'Alice'),
(2,'Bob'),
(3,'Charlie');
INSERT INTO contractors (name) VALUES
('Bob'),
('David'),
('Eve');

SELECT * FROM employees;
SELECT * FROM contractors;

/* 1) union--> removes duplicates from a table and returns non duplicated recordes
		   ---> also used to combine 2 tables fully*/
select * from employees
union
select * from employees; -- note in our data now there is no duplicates

select * from employees
union
select * from contractors;


/* 2) union all --> similar to union but it returns duplicates also
		   ---> also used to combine 2 tables fully*/
select * from employees
union all
select * from employees; -- note in our data there is  duplicates

select * from employees
union all
select * from contractors;




/* 3) intersect --> which will returns only the common values in both table
				--> in mysql we use {inner join} to intersect 2 tables
*/
select e.*, co.* from 
employees e inner join contractors co
on e.id = co.id;

/* 4) (expect or minus)--> is similar to left join*/

select e.*, co.*
from employees e join contractors co
on e.`name` = co.`name`; 

select e.id, e.`name`
from employees e join contractors co
on e.`name` = co.`name`; 


