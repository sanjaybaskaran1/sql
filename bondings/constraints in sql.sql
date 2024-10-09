use bondings;

create table employees(
	emp_no int,
    emp_name varchar(20),
    salary int
);
desc employees;

select * from employees;

insert into employees values 
	(1,"lavanya",100000),(2,"jaanu","100000");

insert into employees(emp_name,salary) values("jack",20000);

drop table employees;

create table employees(
	emp_no int not null,
    emp_name varchar(20),
    salary int
);
insert into employees values 
	(1,"lavanya",100000),(2,"jaanu","100000");
select * from employees;
insert into employees(emp_name,salary) values("jack",20000);
insert into employees values(3,"jack",20000);
drop table employees;

create table employees(
	emp_no int,
    emp_name varchar(20),
    salary int
);

insert into employees values (1,"lavanya",100000),(2,"jaanu","100000"),(3,"jack",20000);
select * from employees;
drop table employees;
insert into employees values(3,"jack",20000);

insert into employees(emp_name,salary) values("jack",20000);

alter table employees
modify column emp_no int  not null;
desc employees;
select * from employees;
desc employees;
drop table employees;

create table employees(
	emp_no int,
    emp_name varchar(20),
    salary int
);

insert into employees values 
	(1,"lavanya",100000),(2,"jaanu","100000");
select * from employees;
insert into employees(emp_name,salary) values("jack",20000);


alter table employees
modify column emp_no int  not null;

select * from employees;
desc employees;
drop table employees;


create table employees(
	emp_no int unique,
    emp_name varchar(20),
    salary int
);
insert into employees values 
	(1,"lavanya",100000),(2,"jaanu","100000");
select * from employees;
insert into employees values(1,"jack",20000);
insert into employees values(3,"jack",20000);
drop table employees;

create table employees(
	emp_no int ,
    emp_name varchar(20),
    salary int
);
insert into employees values 
	(1,"lavanya",100000),(2,"jaanu","100000");
select * from employees;

alter table employees
add constraint unique(emp_no);

create table employees2(
	emp_no int ,
    emp_name varchar(20),
    salary int
);

insert into employees2
select distinct emp_no, emp_name, salary from employees;
select * from employees2;

alter table employees2
add constraint unique(emp_no);
desc employees2;
select * from employees;

alter table employees2 
add constraint primary key(emp_no);
desc employees2;
drop table employees2;

alter table employees2 add constraint primary key(emp_no);
desc employees2;

/*check constraint*/

create table rollercoaster(
							id int,
                            name varchar(20),
                            age int);
desc rollercoaster;

insert into rollercoaster values(1,"lavanya",18),(2,"jaanu",20),(3,"dark",30);

alter table rollercoaster
add constraint check( age >=18 and age<=48 );
insert into rollercoaster values(1,"lakshith",48);
insert into rollercoaster values(2,"darshith",10);
select * from rollercoaster;

alter table rollercoaster
add column country varchar(40);

select * from rollercoaster;

alter table rollercoaster
modify column country varchar(40) default "india";

insert into rollercoaster(id,name,age)
values(5,"roshan",30);

insert into rollercoaster
values(6,"rohan",40,"china");

insert into rollercoaster(id,name,age)
values(7,"lio",41);
/*foreign key*/
use employees;
create table salaries_dup(emp_no int ,
						salary int,
                        from_date date ,
                        to_date date);
insert into salaries_dup
select * from salaries limit 50;

select * from employees_dup;
alter table employees_dup
add constraint primary key(emp_no);



select * from salaries_dup;

alter table salaries_dup
add constraint foreign key(emp_no) references employees_dup(emp_no);


select * from employees_dup limit 5;
select * from salaries_dup limit 50;



drop table employees;






