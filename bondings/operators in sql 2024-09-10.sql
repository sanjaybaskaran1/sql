/*
keywords -->  select, from, where,and, or, like, not like, between , not between, 
distinct, >, < is null, is not null, order by asc, order by desc
*/


#--> (1) SELECT - FROM - exercise

/* 1) Select the information from the “dept_no” column of the “departments” table.
Select all data from the “departments” table.*/

SELECT 
    dept_no
FROM      
    departments;


/* 2) Execute a query that sets employees_10 as the default database.*/
use employees;


/* 3) Retrieve all records from the employees table.*/
select * from employees.departments;
select * from departments;


/* 4) Retrieve all data from the department number column (dept_no) in the departments table.*/
select dept_no from departments;




#--> (2) SELECT-WHERE - exercise

/* 1) Select all people from the “employees” table whose first name is “Elvis”.*/
select * from employees where first_name = 'Elvis';

/* 2) Retrieve all records of employees from the employees table whose first name is 'Saniya' .*/
select * from employees where first_name = 'Saniya';




#--> (3) (SELECT-WHERE-AND) - exercise

/* 1) Retrieve a list with all female employees whose first name is Kellie. */
select * from employees where gender='F' and first_name='Kellie';

/* 2) Retrieve all data for all female employees with the last name 'Bamford'.*/
select * from employees where gender='F' and last_name='Bamford';




#--> (4) (SELECT-WHERE-OR) - exercise

/* 1) Retrieve a list with all employees whose first name is either Kellie or Aruna.*/
select * from employees where first_name = 'Kellie' or first_name = 'Aruna';
select * from employees where first_name in('kellie','Aruna');


/* 2) Retrieve all records from the employees table for employees whose first name is either 'Bezalel' or 'Anneke'.*/
select * from employees where first_name = 'Bezalel' or first_name = 'Anneke';




#--> (5) (SELECT-WHERE-Operator precedence) - exercise
# when using both (AND) & (OR) operator in same query the (AND operator) execute first & (OR operator) execute next.
# so, their order of execution is called as operator precendence 

/* 1) Retrieve a list with all female employees whose first name is either Kellie or Aruna.*/
select * from employees where (gender='F') and ((first_name='Kellie') or (first_name='Aruna'));


/* 2) Retrieve all data for female employees from the employees table whose last name is 'Bamford' or 'Peac'.*/
select * from employees where (gender='F') and ((last_name='Bamford') or (last_name='Peac'));




#--> (6) (SELECT-WHERE-IN , SELECT-WHERE-NOT IN) - exercise

/* 1) Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.*/
select * from employees where first_name in('Denis','Elvis');


/* 2) Use the (NOT IN) operator to retrieve all records from the employees table for employees 
whose first name is not in the following list: ('Georgi', 'Parto', 'Anneke')*/
select * from employees where first_name not in('Georgi', 'Parto', 'Anneke');





#--> (7) (SELECT-WHERE-LIKE , SELECT-WHERE-NOT LIKE) - exercise

/* 1) Working with the “employees” table, use the LIKE operator to select the data about all individuals, 
whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.*/
select * from employees where first_name like('mark%');


/* 2) Retrieve a list with all employees who have been hired in the year 2000.*/
select * from employees where hire_date like('2000%');


/* 3) Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”. */
# for integer column dont use {%}--> symbol
select * from employees where emp_no like('1000_');




#--> (8) (SELECT-WHERE-BETWEEN , SELECT-WHERE-NOT BETWEEN) - exercise

/* 1) Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.*/
select * from salaries where salary between 66000 and 70000; 


/* 2) Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.*/
select * from employees where emp_no not between 10004 and 10012;



                            
desc employees_dup;
insert into employees_dup values(5,NULL,NULL),(6,28,NULL),(7,NULL,'lavanya');
select * from employees_dup;




/*#--> (9) (SELECT-WHERE-IS NULL , SELECT-WHERE-IS NOT NULL) - exercise*/

/* 1) retrieve employees age for each employees from employees_dup table whose emp_age value (is not null)*/
select emp_age from employees_dup;
select emp_age from employees_dup where emp_age is not null;


/* 2) retrieve employees age for each employees from employees_dup table whose emp_age value (is null)*/
select emp_age from employees_dup;
select emp_age from employees_dup where emp_age is null;



/*#--> (10) (SELECT-WHERE-greaterthan operator(>)  , SELECT-WHERE-lesserthan operator(<)) - exercise*/

/* 1) Retrieve a list with data about all female employees who were hired in the year 2000 or after.*/
select * from employees where ((gender='F') and (hire_date > '2000-01-01'));

/* 2) Extract a list with all employees’ salaries higher than $150,000 per annum.*/
select * from salaries where (salary > 150000);


/* 3) Extract a list with all employees’ salaries lesser than $50,000 per annum.*/
select * from salaries where (salary < 40000);

/* 4) Use a comparison operator to retrieve all records from the employees table for female employees hired after 1985.*/
select * from employees where (gender='F') and (hire_date > '1985-01-01');




/*#--> (11) (SELECT-DESTINCT) - exercise*/

/* 1) Obtain a list with all different “hire dates” from the “employees” table.*/
select distinct hire_date from employees;




/*--> (12) (LIMIT) - exercise */

/*1) retrive only 50 data from the employees table*/
select * from employees limit 50;



/*--> (13) (ORDER BY) - exercise*/

/* 1) retrive  employees data from emplyees_dup table and sort the result by emp_name in ascending order*/
select  * from employees_dup;
select  * from employees_dup order by emp_name asc;
select  * from employees_dup where emp_age is not null  order by emp_name asc;
select  * from employees_dup where emp_age is not null and emp_name is not null order by emp_name asc;

/* 2) retrive  employees data from emplyees_dup table and sort the result by emp_name in ascending order */
select  * from employees_dup;
select  * from employees_dup order by emp_name desc;
select  * from employees_dup where emp_age is not null  order by emp_name desc;
select  * from employees_dup where emp_age is not null and emp_name is not null order by emp_name desc;











