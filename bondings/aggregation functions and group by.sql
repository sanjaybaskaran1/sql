/*COUNT() - exercise
How many departments are there in the “employees” database? 
Use the ‘dept_emp’ table to answer the question.*/
select dept_no from dept_emp;
SELECT DISTINCT dept_no FROM dept_emp;

/*COUNT() - Exercise #1
How many job titles are there in the employees database? 
Use the titles table to answer the question.*/
select title from titles;
select distinct title from titles;

/*SUM() - exercise
What is the total amount of money spent on salaries for all contracts 
starting after the 1st of January 1997?*/

select from_date from salaries;

select distinct from_date from salaries;

select from_date, salary
from salaries;

select from_date, sum(salary)
from salaries
group by from_date;

select from_date, sum(salary)
from salaries
group by from_date
having from_date = '1991-01-01';

/*SUM() - Exercise #1
What is the total amount of all contract salary values for contracts starting before January 1, 1995?*/

select from_date, sum(salary)
from salaries
where from_date = '1991-01-01'
group by from_date;


/*MIN() and MAX() - exercise*/
select emp_no from employees;
#1. Which is the lowest employee number in the database?
select min(emp_no) from employees;

#2. Which is the highest employee number in the database?
select max(emp_no) from employees;

/*What is the lowest department number (dept_no) in the departments table? */
select min(dept_no) from departments;

/*What is the highest department number (dept_no) in the departments table? */
select max(dept_no) from departments;

/*AVG() - exercise
What is the average annual salary paid to employees who started after the 1st of January 1997?*/
select from_date, avg(salary) 
from salaries
group by from_date
having from_date = '1997-01-01';

/*AVG() - exercise
What is the average annual salary paid to employees who started after the 1st of January 1997, 1998,1999?*/
select from_date, avg(salary) 
from salaries
group by from_date
having from_date in('1996-01-01','1997-01-01','1998-01-01','1999-01-01');

select from_date, avg(salary) 
from salaries
group by from_date
having from_date between '1996-01-01' and '1996-01-31'
order by from_date;

/*What is the average contract salary value for contracts 
starting on or before December 31, 1994 or earlier?*/
select from_date, avg(salary)
from salaries
group by from_date
having from_date < '1994-12-31';

/*ROUND() - exercise*/

/* 1) Round the average amount of money spent on salaries for all contracts 
that started after the 1st of January 1997 to a precision of 2 cents.*/

select from_date , round(avg(salary),2) as average_salary
from salaries
group by from_date
having from_date > '1997-01-01';


/* 2) What is the average contract salary value for contracts 
starting on or before November 29, 1994 or earlier? 
Round your answer to the nearest dollar,with no cents, 
and name the resulting column average_salary.*/

select from_date, round(avg(salary)) as avg_salary
from salaries
group by from_date
having from_date < '1994-11-29';



/*IFNULL() - exercise 1*/
use bondings;
select * from school;

update school 
set stu_age = null
where stu_id in(1,3);

/*Select the student_age from the ‘school’ table 
and add a third column where you name the stu_age  as new_age. 
If ‘stu_age’ does not have a value, use ‘10’ as value instead of null.*/
select ifnull(stu_age,10) as stu_age from school;
select *,ifnull(stu_age,10) as new_age from school;

/*Select the student_age from the ‘school’ table 
and add a third column where you name the stu_age  as new_age. 
If ‘stu_age’ does not have a value, use (average_age) as value instead of null.*/
select ifnull(stu_age,(select avg(stu_age) from school)) as stu_age from school;
select *,ifnull(stu_age,(select avg(stu_age) from school)) as new_age from school;
select *,ifnull(stu_age,(select round(avg(stu_age),2) from school)) as new_age from school;
select *,ifnull(stu_age,(select round(avg(stu_age)) from school)) as new_age from school;




/*COALESCE() - exercise 1*/
update school 
set stu_age = null, grade = null
where stu_id in(1,3);
select * from school;

/* 1) use coalesce() to display a single column (stu_age) */
select coalesce(stu_age) from school;

/* 2) use coalesce() to replace null values with 10 in stu_age column 
use alias to name that column as {new_age}*/
select *, coalesce(stu_age,10) as new_age from school;

/* 3) use coalesce() to replace null values with 10 in stu_age column 
use alias to name that column as {new_age}*/
select stu_id, coalesce(stu_age,10) as new_age, grade from school;

/*make the (stu_age,grade)values to null where (stu_id=1,3) to perfome further*/
update school 
set stu_age = null, grade = null
where stu_id in(1,3);
select * from school;

/* 4)replace the null values in the grade column rows with stu_age column rows values
  if suppose you have null value in stu_age column then replace it with 10 */
select coalesce(grade,stu_age,10) from school;
select *, coalesce(grade,stu_age,10) as new_grade from school;








































