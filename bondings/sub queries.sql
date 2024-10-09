use employees;

select * from dept_manager;

/*SQL Subqueries with [{IN} nested inside {WHERE}] - exercise*/

/* 1) Extract the information about all department managers 
who were hired between the 1st of January 1990 and the 1st of January 1995.*/
select * from dept_manager
where emp_no in(select emp_no from employees 
                       where hire_date between '1990-01-01' and '1995-01-01');

select * from employees where hire_date between '1990-01-01' and '1995-01-01'; 
                        
                                                                                                        
/* 2) extract the salary details of all the managers*/
select * from salaries
where emp_no in(select emp_no from salaries);
select * from dept_manager limit 5;
select * from salaries limit 5;


/* 3)Retrieve only data about managers born in or after 1955.*/
select * from dept_manager
where emp_no in(select emp_no from employees where birth_date >= 1995);

/*  4)Retrieve only data about managers along with their (name) 
only for the people who born in or after 1955. */
select dm.emp_no, dm.dept_no, e.first_name, dm.from_date, dm.to_date
from employees e join dept_manager dm on e.emp_no = dm.emp_no
where dm.emp_no in(select emp_no from employees where birth_date > 1995);

/*  4)Retrieve only data about managers along with their (name and salary)
only for the people who born in or after 1955. */
select dm.emp_no, dm.dept_no, e.first_name,s.salary,dm.from_date, dm.to_date
from employees e join dept_manager dm on e.emp_no = dm.emp_no
join salaries s on s.emp_no = dm.emp_no
where dm.emp_no in(select emp_no from employees where birth_date > 1995);


use employees;

/*SQL Subqueries with [EXISTS] nested inside [WHERE] - exercise*/
/* 1) Select the entire information for all employees 
whose job title is “Assistant Engineer”. */
select * from employees
where exists(select emp_no from titles where title='Assistant Engineer');


/* 2) Select the entire information for all employees 
whose job title is “Assistant Engineer”. along with their salary*/
SELECT e.*, t.title, s.salary
FROM employees e JOIN titles t ON e.emp_no = t.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE EXISTS( SELECT emp_no FROM titles WHERE title = 'Assistant Engineer'); 




















  
  
  
  
  
  
  