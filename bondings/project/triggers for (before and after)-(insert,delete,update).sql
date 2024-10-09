drop database triggers;

create database `triggers`;

use `triggers`;

#employees table
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100),
    salary DECIMAL(10, 2),
    department VARCHAR(50)
);

INSERT INTO employees (name, salary, department) VALUES
('Alice', 60000, 'HR'),
('Bob', 55000, 'IT'),
('Charlie', 50000, 'Finance');

select * from employees;

# employees log table
# i want to create a trigger which will insert the new values for
# action, employee_name, and time of there inserted
CREATE TABLE employee_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    `action` VARCHAR(50),
    employee_name VARCHAR(100),
    log_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

delimiter $$
create trigger before_inserting_employees_table
before insert on employees for each row
begin
	insert into employee_log(`action`,employee_name)
    values('insert',new.`name`);
end $$
delimiter ;


drop trigger before_inserting_employees_table;

insert into employees(`name`,salary,department)
values('sanjay',100000,"data scientist");


select * from employees;
select * from employee_log;

delete from employees where employee_id=4;

delimiter &&
create trigger `after_inserting_into_employees`
after insert on employees for each row
begin
	insert into employee_log(`action`,employee_name)
    values('insert',new.`name`);
end &&
delimiter ;


insert into employees(`name`,salary,department)
values('janani',200000,"fullstack developer");

select * from employees;
select * from employee_log; -- now it will insert 2 times since we have 2 triggers fpor insert


create table employees_deleted_log
(
employee_id int auto_increment primary key,
employee_name varchar(100),
`time` timestamp default current_timestamp
);

alter table employees_deleted_log
modify employee_id int;

delimiter %%
create trigger before_employees_delete
before delete on employees for each row
begin
	insert into employees_deleted_log(employee_id,employee_name)
    values(old.employee_id,old.name);
end %%
delimiter ;

select * from employees;

delete from employees where employee_id=6;

select * from employees_deleted_log;

drop table employees_update_log;
create table employees_update_log
(
`event` varchar(20),
employee_id int,
employee_name varchar(100),
`time of updation` timestamp default current_timestamp
);

delimiter $$
create trigger values_before_employees_update
before update on employees for each row
begin
	insert into employees_update_log(`event`,employee_id,employee_name)
    values("before update",old.employee_id, old.`name`);
end $$
delimiter ;

delimiter $$
create trigger values_after_employees_update
before update on employees for each row
begin
	insert into employees_update_log(`event`,employee_id,employee_name)
    values("after update",new.employee_id, new.`name`);
end $$
delimiter ;


drop trigger values_before_employees_update;
drop trigger values_after_employees_update;


select * from employees;

update employees
set `name`=case
	when employee_id=1 then "Lannie"
    when employee_id=5 then "Jai"
    else `name`
end;

select * from employees_update_log;

truncate employees_update_log;

update employees
set `name`='sanjay' where employee_id=5;