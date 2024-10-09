/*laptop data analysis*/
select * from laptop_pricing_dataset;

rename table laptop_pricing_dataset to laptop_sales;

alter table laptop_sales 
rename column `MyUnknownColumn` to `id`;

select * from laptop_sales;

select distinct Manufacturer from laptop_sales;

select  Manufacturer,
sum(price) over(partition by Manufacturer) as 'Total_price'
from laptop_sales;

select distinct Manufacturer,
sum(price) over(partition by Manufacturer) as 'Total_price'
from laptop_sales;




/*Why the This Query Throws an Error:
In the second query, you used SUM(price) with the OVER clause, 
which makes SQL treat SUM(price) as a window function instead of an aggregate function. 
Since window functions work row-by-row rather than group-by-group, 
it leads to a conflict with how aggregation and window functions are applied.
*/
select 
sum(price) over (partition by Manufacturer) as `Total_price`,
max(price) over (partition by Manufacturer) as `max_price`,
min(price) over (partition by Manufacturer) as `min_price`,
rank() over (order by sum(price) desc) as `rank`
from laptop_sales;



/*Here's why it works:
Aggregate Functions (SUM, MAX, MIN, AVG) are performed per group 
because you have the GROUP BY Manufacturer. These functions summarize data within each group.

Window Function (RANK() OVER) works after the aggregation. 
Since you are applying the RANK() function to an already grouped result set, 
SQL is able to order by the aggregated SUM(price) values in the result set.

The key point here is that the SUM(price) in the ORDER BY of the window function 
refers to the aggregated value. It's evaluated after the GROUP BY has already created 
the aggregate totals for each Manufacturer.
So, the query first calculates the total, maximum, minimum, and average price per manufacturer 
using GROUP BY. 

Then, the RANK() window function ranks the results based on the calculated SUM(price) values 
in descending order.

Execution Flow:
-->Group By: SQL groups the data by Manufacturer.
-->Aggregation: It calculates the aggregate values (SUM, MAX, MIN, AVG) for each manufacturer.
-->Window Function: After aggregating, it calculates the rank using the aggregated SUM(price) 
values in the ORDER BY clause.*/
select Manufacturer, sum(price) as `Total_price`,
 max(price) as `max_price`,min(price) as `min_price`,
 avg(price) as `avg_price`,
 rank() over (order by sum(price) desc) as `rank`
from laptop_sales
group by Manufacturer;


/*find top 7 rank based on total sales*/
with top_sales as
(
select Manufacturer, sum(price) as `Total_price`,
 max(price) as `max_price`,min(price) as `min_price`,
 avg(price) as `avg_price`,
 rank() over (order by sum(price) desc) as `rank`
from laptop_sales
group by Manufacturer
)
select * from top_sales 
where `rank` between 1 and 7;


select Manufacturer,GPU, os, Ram_GB, sum(price)
from laptop_sales
group by Manufacturer,GPU,os,Ram_GB
order by Manufacturer, GPU, os, Ram_GB;

select Manufacturer,GPU, os, Ram_GB, sum(price),
rank() over (partition by Manufacturer order by sum(price) desc) as `rank`
from laptop_sales
group by Manufacturer,GPU,os,Ram_GB;

with top_rank as
(
select Manufacturer,GPU, os, Ram_GB, sum(price) as `Total_price`,
rank() over (partition by Manufacturer order by sum(price) desc) as `rank`
from laptop_sales
group by Manufacturer,GPU,os,Ram_GB
)
select * from top_rank
where `rank`=1;


with top_rank as
(
select Manufacturer,GPU, os, Ram_GB, sum(price) as `Total_price`,
rank() over (partition by Manufacturer order by sum(price) desc) as `rank`
from laptop_sales
group by Manufacturer,GPU,os,Ram_GB
)
select * from top_rank
where `rank`=1
order by `Total_price` desc;