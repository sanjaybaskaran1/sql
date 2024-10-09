use bondings;

/* 1) session variable*/
#in mysql session variables are standalone variables
#which means we can create them outside the stored procedures
set @stu_name = 'sanjay';
select @stu_name;



/* 2) local variables*/
#local variables are only created inside the stored procedures
#here the local variables are a and b
delimiter $$
create procedure addition()
begin
	declare a int;
    declare b int;
    set a=10;
    set b=5;
	select (a+b) as `adiition of a & b`;
end $$
delimiter ;

call addition();
drop procedure addition;



/*create a function to performe multiplication of 2 numbers*/
delimiter $$
create procedure multiplication(in a int, in b int)
begin
	select (a*b) as `multiplication of a & b`;
end $$
delimiter ;

call multiplication(10,5);
drop procedure multiplication;