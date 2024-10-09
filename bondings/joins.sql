create database `joins`;
use `joins`;

-- Create employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_name VARCHAR(30)
);

-- Create salaries table
CREATE TABLE salaries (
    emp_no INT,
    salary INT,
    from_date DATE,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create departments table (optional)
CREATE TABLE departments (
    dept_no INT PRIMARY KEY,
    dept_name VARCHAR(30)
);

INSERT INTO employees (emp_no, emp_name) VALUES
(1, 'Janani'),
(2, 'Lavanya'),
(3, 'Jaanu'),
(4, 'Lakshith'),
(5, 'Sanjana');

INSERT INTO salaries (emp_no, salary, from_date) VALUES
(1, 60000, '2023-01-01'),
(1, 61000, '2023-02-01'),
(1, 62000, '2023-03-01'),
(1, 63000, '2023-04-01'),
(1, 64000, '2023-05-01'),

(2, 65000, '2023-01-01'),
(2, 66000, '2023-02-01'),
(2, 67000, '2023-03-01'),
(2, 68000, '2023-04-01'),
(2, 69000, '2023-05-01'),

(3, 70000, '2023-01-01'),
(3, 71000, '2023-02-01'),
(3, 72000, '2023-03-01'),
(3, 73000, '2023-04-01'),
(3, 74000, '2023-05-01'),


(5, 58000, '2023-01-01'),
(5, 59000, '2023-02-01'),
(5, 60000, '2023-03-01'),
(5, 61000, '2023-04-01'),
(5, 62000, '2023-05-01');


INSERT INTO departments (dept_no, dept_name) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Sales');


select * from employees;
select * from departments;
select * from salaries;

select e.*, s.salary
from employees e inner join salaries s
on e.emp_no = s.emp_no;

select e.*, s.salary
from employees e left join salaries s
on e.emp_no = s.emp_no;

select e.*, s.salary
from  salaries s  right join employees e
on e.emp_no = s.emp_no;

select e.*, s.salary
from employees e left join salaries s
on e.emp_no = s.emp_no
union
select e.*, s.salary
from  salaries s  right join employees e
on e.emp_no = s.emp_no;





































