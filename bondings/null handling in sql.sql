/*IFNULL() - exercise 1*/
use bondings;
select * from school;

update school 
set stu_age = null
where stu_id in(1,3);

/*Select the student_age from the ‘school’ table 
and add a third column where you name the stu_age  as new_age. 
If ‘stu_age’ does not have a value, use ‘10’ as value instead of null.*/
select ifnull(stu_age,10) as stu_age from school;
select *,ifnull(stu_age,10) as new_age from school;

/*Select the student_age from the ‘school’ table 
and add a third column where you name the stu_age  as new_age. 
If ‘stu_age’ does not have a value, use (average_age) as value instead of null.*/
select ifnull(stu_age,(select avg(stu_age) from school)) as stu_age from school;
select *,ifnull(stu_age,(select avg(stu_age) from school)) as new_age from school;
select *,ifnull(stu_age,(select round(avg(stu_age),2) from school)) as new_age from school;
select *,ifnull(stu_age,(select round(avg(stu_age)) from school)) as new_age from school;




/*COALESCE() - exercise 1*/
update school 
set stu_age = null, grade = null
where stu_id in(1,3);
select * from school;

/* 1) use coalesce() to display a single column (stu_age) */
select coalesce(stu_age) from school;

/* 2) use coalesce() to replace null values with 10 in stu_age column 
use alias to name that column as {new_age}*/
select *, coalesce(stu_age,10) as new_age from school;

/* 3) use coalesce() to replace null values with 10 in stu_age column 
use alias to name that column as {new_age}*/
select stu_id, coalesce(stu_age,10) as new_age, grade from school;

/*make the (stu_age,grade)values to null where (stu_id=1,3) to perfome further*/
update school 
set stu_age = null, grade = null
where stu_id in(1,3);
select * from school;

/* 4)replace the null values in the grade column rows with stu_age column rows values
  if suppose you have null value in stu_age column then replace it with 10 */
select coalesce(grade,stu_age,10) from school;
select *, coalesce(grade,stu_age,10) as new_grade from school;