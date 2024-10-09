/*duplicates handling*/
create database `duplicates handling`;
use `duplicates handling`;
CREATE TABLE employees (
    employee_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);
INSERT INTO employees (employee_id, name, department, salary) VALUES
(1, 'John', 'Sales', 50000),
(2, 'Alice', 'HR', 60000),
(3, 'Bob', 'Sales', 55000),
(4, 'Carol', 'IT', 70000),
(5, 'Dave', 'HR', 65000),
(1, 'John', 'Sales', 50000),
(2, 'Alice', 'HR', 60000),
(6, 'Emma', 'Sales', 52000),
(3, 'Bob', 'Sales', 55000),
(5, 'Dave', 'HR', 65000);
select * from employees;

/*using distinct to remove duplicates*/
select distinct * from employees;

/*using group by to remove duplicates*/
select employee_id,`name`,department,salary from employees
group by employee_id,`name`,department,salary;

/*using (partition by all the columns) along with cte to remove duplicates*/

with remove_duplicates as
(
select *, 
row_number() over (partition by employee_id, `name`, department, salary) as `rn`
from employees
)
select * from remove_duplicates where `rn`>1;


CREATE TABLE `employees_dup` (
  `employee_id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `row_number` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


insert into `employees_dup`
with remove_duplicates as
(
select *, 
row_number() over (partition by employee_id, `name`, department, salary) as `rn`
from employees
)
select * from remove_duplicates;

select * from `employees_dup`;

delete from `employees_dup`
where `row_number` > 1;

select * from `employees_dup`;

/*using union to remove duplicates*/
select * from employees;

select * from employees a 
union
select * from employees b;