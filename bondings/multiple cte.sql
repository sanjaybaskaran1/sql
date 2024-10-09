create table employees_dup(emp_no int, emp_name varchar(30));
create table salaries_dup(emp_no int, salary int, from_date date);

-- Inserting values into employees_dup with updated names
INSERT INTO employees_dup (emp_no, emp_name) VALUES
(1, 'Janani'),
(2, 'Lavanya'),
(3, 'Jaanu'),
(4, 'Lakshith'),
(5, 'Sanjana');

-- Inserting different salaries for 5 months for each employee
INSERT INTO salaries_dup (emp_no, salary, from_date) VALUES
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

(4, 62000, '2023-01-01'),
(4, 63000, '2023-02-01'),
(4, 64000, '2023-03-01'),
(4, 65000, '2023-04-01'),
(4, 66000, '2023-05-01'),

(5, 58000, '2023-01-01'),
(5, 59000, '2023-02-01'),
(5, 60000, '2023-03-01'),
(5, 61000, '2023-04-01'),
(5, 62000, '2023-05-01');


select * from employees_dup;
select * from salaries_dup;

-- find the months , when the employee salary is above the average salary for each employee group along with their name
with emp_sal as
(
select *,
avg(salary) over(partition by emp_no) as avg_sal
from salaries_dup
)
, sal_above_avg as
(
select s.emp_no,e.emp_name,s.salary,from_date,avg_sal,case when (salary > avg_sal) then salary else 0 end as `sal`
from emp_sal as s inner join employees_dup e on e.emp_no = s.emp_no
)
select emp_no,emp_name,salary,from_date,avg_sal from sal_above_avg
where `sal`not in(0);

select e.emp_no,e.emp_name,sd.salary,
rank() over(partition by emp_no order by salary desc) as `rank`
from employees_dup e inner join salaries_dup sd
on e.emp_no = sd.emp_no;


-- method 2

with emp_sal_above_avg as
(
select e.emp_no,e.emp_name,sd.salary,sd.from_date,
avg(salary) over(partition by emp_no) as `avg_salary`,
(sd.salary > avg(salary) over(partition by emp_no)) as `sal_above_avg`
from employees_dup e inner join salaries_dup sd
on e.emp_no = sd.emp_no
)
select * from emp_sal_above_avg
where `sal_above_avg` in(1);

drop table employees_dup;
drop table salaries_dup;





































