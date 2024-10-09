/*string functions in sql
ltrim(),rtrim(),trim().
replace().
substring().
left(),righth().
length(),concat(),[concat_ws()-->Concatenate With Separator].
reverse().
repeat().
*/

set @name = '    [sa..<>n/|jay,*/]   ';
select @name;

select ltrim(@name);
select rtrim(@name);
select trim(@name);

select replace(@name,"[","");
select replace(@name, "..<>","");
select replace(@name,"/|","");
select replace(@name, ",*/","");

set @name= trim(replace(replace(replace(replace(replace(replace(@name,"[",""),"..",""),"<>",""),"/",""),"|",""),",*]",""));
select @name;



use bondings;
CREATE TABLE string_values (
    id INT AUTO_INCREMENT PRIMARY KEY,
    value VARCHAR(255)
);

-- Insert the values
INSERT INTO string_values (value) VALUES
(' hello world '),
('12345'),
('  special*chars#@!  '),
('   mixedCaseString  '),
('leadingDot..trailingDot..'),
('JSON { "key": "value" } '),
('   whitespace   '),
('singleWord'),
('123!@#456'),
('NoSpecialCharsHere');
select * from string_values;



update string_values
set `value` = replace(replace(replace(replace(value, "@",""),"#",""),"!",""),":","");
select * from string_values;

update string_values
set `value` = replace(replace(replace(replace(value, "*",""),"..",""),"{",""),"}","");
select * from string_values;

update string_values
set value = trim(value);
select * from string_values;

select left(value, 4) as `left-4-values from left` from string_values;
select right(value, 4) as `left-4-values from right`from string_values;

select `value`, upper(`value`),lower(`value`) from string_values;

select `value`, length(`value`) from string_values;

/*
substring({col_name},{starting-position},{how-many-letters u want from starting-pos})
*/
select `value`,
substring(`value`, 3, 2) as `2-values from 2nd-substring`
from string_values;

select `value`,
substring(`value`, -1) as `last-substring`
from string_values;

/*create data for concatination*/
use bondings;
create table employees_new(emp_no int, first_name varchar(255), last_name varchar(255));

/*
we extracting (7-data) from {employees} table in {employees--> database}
--> and insert that data into the {employees_new} table in {bondings--> database}
*/
insert into bondings.employees_new
select emp_no, first_name,last_name from employees.employees limit 7;
select * from employees_new;

select *, concat(first_name,"  ",last_name) as `names` from employees_new;

update employees_new
set first_name = concat(first_name,"  ",last_name);
select * from employees_new;

alter table employees_new
rename column `first_name` to `names`;
select * from employees_new;

alter table employees_new
drop column last_name;
select * from employees_new;

select *, reverse(`names`) from employees_new;

select *, repeat(`names`,2) as `repeat names` from employees_new;

drop table employees_new;

select *,concat_ws(",",`first_name`,`last_name`) as `names sep by comma`from employees_new;