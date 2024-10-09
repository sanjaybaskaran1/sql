/*DDL*/

#create database
create database bondings;

#select  the database
use bondings;
drop table school;
#TABLE CREATION:
create table student(
	stu_id int primary key,
    stu_name varchar(20),
    stu_age int,
    grade varchar(10)
);

#How to see table description
desc student;

alter table student add column marks varchar(20);
desc student;

alter table student modify column marks char(20);
desc student;

alter table student rename column marks to stu_marks;
desc student;
#remove primary key from table student
alter table student
drop primary key;

desc student;

#how to set primary key for existing table
desc student;
alter table student
add constraint primary key(stu_id);
desc student;

alter table student
drop primary key;
desc student;

desc student;
select * from student;

rename table student to school;  
select * from school;

#inserting values into school
desc school;
insert into school values(1,'lavanya',20,'A');
select * from school;

insert into school(stu_id,stu_age) values(2,20);
select * from school;

insert into school values (3,'jaanu',21,'A'),(4,'lakshit',10,'B'),(5,'darshith',7,'B');
select * from school;

insert into school(stu_id,stu_age) values (6,41),(7,50),(8,70);
select * from school;

CREATE TABLE a_grade (
    stu_id INT,    stu_name VARCHAR(20),
    stu_age INT,   grade VARCHAR(10)
);
insert into a_grade
select * from school where grade='A';

delete from a_grade where stu_id in(3,5);
select * from a_grade;


insert into a_grade values(4,"lakshith",10,'B'),(5,"Darshith",7,'B');

insert into a_grade values (2,'jaanu',21,'A'),(3,'lakshit',10,'B'),(4,'darshith',7,'B'),(5,"Darshith",7,'B');
select * from a_grade;

update a_grade set stu_age = 20, grade='B' where (stu_id = 1);
select * from a_grade;
delete from a_grade where stu_id=5;


#update
select * from a_grade;
update  school 
set grade = 'C'
where stu_id = 3;

select * from school;

update school
set grade = 'D';

select * from school;


update school
set stu_age = 11 , grade = 'D'
where stu_id = 3;



#delete
delete from school
where stu_name = 'lakshit';

SET SQL_SAFE_UPDATES = 0;

select * from school;

SET SQL_SAFE_UPDATES = 1;
delete from school
where stu_name = 'darshith';

delete from school
where stu_id = 4;

select * from school;


insert into school values (3,'lakshit',10,'B',80),(4,'darshith',7,'B',82);
select * from school;

delete from school
where stu_id in(2,4);


select * from school;

/*Truncate*/
truncate school;

select * from school;


/*drop*/
insert into school values (3,'lakshit',10,'B'),(4,'darshith',7,'B');
drop table school;

select * from school;
update school
set stu_age = 21
where stu_id = 1;



select * from school;


select * from school;





desc school;
use bondings;
select * from school;
alter table school
drop column grade;
desc school;
update a_grade
set
	grade=case
    when stu_id=1 then 'A'
    when stu_id=4 then 'C'
    else grade
    end,
    stu_age=case
    when stu_id=1 then 21
    when stu_id=3 then 10
    else stu_age
end;
select * from a_grade;



drop table school;

drop database bondings;









select * from school;

truncate school;
select * from school;


use bondings;

select * from employees
limit 10;
alter table employees
drop column bonus;
alter table employees add column bonus int;
desc employees;
select * from employees;


update employees
set 
	bonus=case
    when first_name='Georgi' then round(salary * 0.20)
    when first_name='Parto' then round(salary * 0.40)
    else 0
end;
select * from employees;





use bondings;
select * from school;
alter table school drop column grade;

update school
set stu_name = 'teena' where stu_id=2;

delete from school where stu_id in(6,7,8);

alter table school add column Total_marks int;





update school
set 
	Total_marks = case
    when stu_id=1 then 98
    when stu_id=2 then 85
    when stu_id=3 then 95
    when stu_id=4 then 70
    when stu_id=5 then 60
    else Total_marks
end;

alter table school
add column grade varchar(10);


update school
set 
	grade = case
    when Total_marks >=90 then 'A'
    when Total_marks >=80 then 'B'
    when Total_marks >=70 then 'C'
    when Total_marks >=60 then 'D'
    else grade
end;
select * from school;
















