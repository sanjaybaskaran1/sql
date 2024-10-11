use employees;

create table students(
    sname varchar(30) ,
    course varchar(30) ,
    trainer varchar(30),
    primary key(sname, course));
    
    
    
insert into students
values ('lavanya','powerbi','selva'),('lavanya','python','selva'),('lavanya','sql','selva'),
	   ('jaanu','powerbi','selva'), ('jaanu','python','selva'),('jaanu','sql','selva'),
       ('keerthana','powerbi','selva'),('barath','powerbi','selva');
       
select * from students;

drop table students;


-- this is comment








