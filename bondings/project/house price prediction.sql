use bondings;
select * from usa_housing;

select round(`Avg. Area Number of Rooms`) from usa_housing;

alter table usa_housing
rename column `Avg. Area Number of Rooms` to number_of_rooms;

select `number_of_rooms` from usa_housing;

select round(`number_of_rooms`) as 'no_of_rooms' from usa_housing;

update usa_housing
set number_of_rooms = round(`number_of_rooms`);

select number_of_rooms, round(avg(Price)) as Total_price
from usa_housing
group by number_of_rooms
order by number_of_rooms asc;


create table price_by_no_of_rooms(
number_of_rooms int,
Total_price int
);

insert into price_by_no_of_rooms
select number_of_rooms, round(avg(Price)) 
from usa_housing
group by number_of_rooms
order by number_of_rooms asc;

select * from price_by_no_of_rooms;


select *,
rank() over (order by Total_price desc) as `rank`
from price_by_no_of_rooms;



create table rooms_rank
(
number_of_rooms int,
Total_price int,
`rank` int
);

insert into rooms_rank
select *,
rank() over (order by Total_price desc) as `rank`
from price_by_no_of_rooms;

select * from rooms_rank;
 