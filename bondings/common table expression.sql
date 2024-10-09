use employees;

select * from employees;

select e.emp_no,e.first_name,s.salary,
sum(s.salary) over (partition by emp_no) as sum_of_sal
from employees e join salaries s on e.emp_no=s.emp_no;


/*instead of using like this use the query in (line-20)
this is wrong format of query
*/
with salary_sum as
(
	select e.emp_no,e.first_name,s.salary,
    row_number() over (sum(s.salary) over (partition by e.emp_no) as sal_sum) as rn
    from employees e join salaries s on e.emp_no = s.emp_no 
)
select emp_no from salary_sum;

#using sub-query with cte
WITH salary_sum AS (
    SELECT 
        e.emp_no,e.first_name,s.salary,
        SUM(s.salary) OVER (PARTITION BY e.emp_no) AS sal_sum
    FROM employees e JOIN salaries s ON e.emp_no = s.emp_no
)
SELECT * FROM (
    SELECT 
        emp_no,first_name,salary,sal_sum,
        ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY sal_sum DESC) AS rn
    FROM salary_sum
) as `subquery` WHERE rn = 1;


use employees;


