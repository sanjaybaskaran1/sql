use employees;
/*create employees_dup table*/
create table employees_dup (
	emp_no int,
    first_name varchar(14),
    gender enum('M','F')
    );
    
desc employees_dup;

/*inserting data of employee table to new table(employees_dup)*/
insert into employees_dup
select emp_no, first_name,gender from employees limit 50;

select * from employees_dup;

create table engineer_employees(
	emp_no int,
    first_name varchar(14),
    gender enum('M','F'),
    title varchar(50),
    salary int
);

select e.emp_no,e.first_name,e.gender,t.title,s.salary
from employees e join titles t on e.emp_no=t.emp_no
join salaries s on e.emp_no = s.emp_no 
where t.title='Engineer'
limit 100;

insert into engineer_employees
select e.emp_no,e.first_name,e.gender,t.title,s.salary
from employees e join titles t on e.emp_no=t.emp_no
join salaries s on e.emp_no = s.emp_no 
where t.title='Engineer'
limit 100;

select * from engineer_employees;

/*find the total salary of male and female employees using groupby*/
select gender, sum(salary) as total_salary
from engineer_employees
group by gender;

select gender,count(emp_no)
from engineer_employees
group by gender;




