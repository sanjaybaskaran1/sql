#stored procedure without any parameter
delimiter $$
create procedure get_managers_details()
begin
select * from dept_manager;
end $$
delimiter ;
call get_managers_details();
drop procedure get_managers_details;


#stored procedure with  parameter
delimiter &&
create procedure manager(in p_dept_no char(4))
begin
select * from dept_manager
where dept_no = p_dept_no;
end &&
delimiter ;
call manager('d001');
drop procedure manager;


#find the most recent top 100 salaries of engineer employees in the company.
delimiter **
create procedure top_100_most_recent_engineer_salaries()
begin
	with engineer_salary as
   (select e.*,t.title,s.salary,s.from_date,s.to_date,
	row_number() over (partition by emp_no order by to_date desc) as `row_num`
    from employees e join salaries s on e.emp_no = s.emp_no
    join titles t on e.emp_no = t.emp_no
    where t.title='Engineer'
    )
    select * from engineer_salary
    where `row_num`=2
    order by salary desc
    limit 100;
    end **
delimiter ;
call top_100_most_recent_engineer_salaries();
