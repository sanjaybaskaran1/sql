/*using switch to update multiple rows at a time*/
use employees;
show tables;

create table employees_dup(emp_no int primary key,
							emp_age int,
                            emp_name varchar(100));
                            
desc employees_dup;

insert into employees_dup values(1,20,"brook"),(2,25,"cady"),(3,30,"brayer"),(4,27,"katy");
select * from employees_dup;
update employees_dup
set
	emp_age = case
    when emp_no=1 then 21
    when emp_no=2 then 26
    else emp_age
end;
select * from employees_dup;

select * from employees_dup;
update employees_dup
set
	emp_age = case
    when emp_no=1 then 20
    when emp_no=4 then 26
    else emp_age
    end,
    emp_name = case
    when emp_no=1 then "rocky"
    when emp_no=4 then "anny"
end;
select * from employees_dup;


select * from employees_dup;
update employees_dup
set
	emp_age = case
    when emp_no=1 then 20
    when emp_no=4 then 26
    else emp_age
    end,
    emp_name = case
    when emp_no=1 then "rocky"
    when emp_no=4 then "anny"
    else emp_name
end;
select * from employees_dup;
    










