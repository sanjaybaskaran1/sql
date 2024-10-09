/*get the most recent salary using row_number() window function*/
with ranked_salary as(
	select dm.emp_no,dm.dept_no,s.salary,s.from_date,s.to_date,
    row_number() over (partition by s.emp_no order by s.from_date desc) as row_num
    from dept_manager dm join salaries s on dm.emp_no=s.emp_no
)
select * from ranked_salary;

with ranked_salary as(
	select dm.emp_no,dm.dept_no,s.salary,s.from_date,s.to_date,
    row_number() over (partition by s.emp_no order by s.from_date desc) as row_num
    from dept_manager dm join salaries s on dm.emp_no=s.emp_no
)
select * from ranked_salary
where row_num=1;




/*get the most recent salary using rank() window function*/
with ranked_salary as(
	select dm.emp_no,dm.dept_no,s.salary,s.from_date,s.to_date,
    rank() over (partition by s.emp_no order by s.from_date desc) as sal_rank
    from dept_manager dm join salaries s on dm.emp_no=s.emp_no
)
select * from ranked_salary;

with ranked_salary as(
	select dm.emp_no,dm.dept_no,s.salary,s.from_date,s.to_date,
    rank() over (partition by s.emp_no order by s.from_date desc) as sal_rank
    from dept_manager dm join salaries s on dm.emp_no=s.emp_no
)
select * from ranked_salary
where sal_rank=1;




/*get the most recent salary using dense_rank() window function*/
with ranked_salary as(
	select dm.emp_no,dm.dept_no,s.salary,s.from_date,s.to_date,
    rank() over (partition by s.emp_no order by s.from_date desc) as sal_dense_rank
    from dept_manager dm join salaries s on dm.emp_no=s.emp_no
)
select * from ranked_salary;

with ranked_salary as(
	select dm.emp_no,dm.dept_no,s.salary,s.from_date,s.to_date,
    rank() over (partition by s.emp_no order by s.from_date desc) as sal_dense_rank
    from dept_manager dm join salaries s on dm.emp_no=s.emp_no
)
select * from ranked_salary
where sal_dense_rank=1;


/* 5)Retrieve only data about managers along with their (name and salary)
only for the people who born in or after 1955 and (patition each emp_no)
and then (rank all salary)*/
with salary_rank as
(
select dm.emp_no, dm.dept_no, e.first_name,s.salary,dm.from_date, dm.to_date,
rank() over (partition by dm.emp_no order by s.salary) as sal_rank
from employees e join dept_manager dm on e.emp_no = dm.emp_no
join salaries s on s.emp_no = dm.emp_no
where dm.emp_no in(select emp_no from employees where birth_date > 1995)
)
select * from salary_rank;




/* 7)Retrieve only data about managers along with their (name and salary)
only for the people who born in or after 1955 and with (sal_rank= 1)
and (patition each emp_no)
and then (dense_rank all salary) */
with salary_rank as
(
select dm.emp_no, dm.dept_no, e.first_name,s.salary,dm.from_date, dm.to_date,
dense_rank() over (partition by dm.emp_no order by s.salary) as sal_rank
from employees e join dept_manager dm on e.emp_no = dm.emp_no
join salaries s on s.emp_no = dm.emp_no
where dm.emp_no in(select emp_no from employees where birth_date > 1995)
)
select * from salary_rank
where sal_rank = 1 ;











