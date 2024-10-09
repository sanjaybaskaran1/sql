use employees;

CREATE OR REPLACE VIEW v_manager_max_salary AS
SELECT ROUND(max(salary),2) as manager_max_salary
FROM salaries s JOIN dept_manager dm ON s.emp_no = dm.emp_no;
select * from v_manager_max_salary;
drop view v_manager_max_salary;

CREATE OR REPLACE VIEW  engineer_details as
select e.emp_no, e.first_name, e.last_name, s.salary,t.title, s.from_date,s.to_date
from employees e join salaries s on e.emp_no = s.emp_no
join titles t on e.emp_no= t.emp_no
where t.title= 'Engineer';
select * from engineer_details;
drop view engineer_details;






