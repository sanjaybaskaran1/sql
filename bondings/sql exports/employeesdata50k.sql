USE employees;
SELECT 
    e.emp_no,
    d.dept_no,
    d.dept_name,
    e.first_name,
    e.last_name,
    e.gender,
    e.hire_date,
    s.salary,
    t.title
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
        JOIN
    departments d ON de.dept_no = d.dept_no
        JOIN
    salaries s ON e.emp_no = s.emp_no
        JOIN
    titles t ON e.emp_no = t.emp_no
LIMIT 50000;