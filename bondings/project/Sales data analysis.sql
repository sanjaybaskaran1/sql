use sales_analysis;

select * from orders;

ALTER TABLE orders
rename COLUMN `Total Revenue` to Sales;

alter table orders 
add column Profit double;

desc orders;

#create a temperor column profit using formula (sellingprice-costprice)
#this will be profit for one product
select round(`Selling Price`-`Cost Price`) as profit from orders;

select Profit from orders;

#update the values for profit column
update orders
set Profit = (`Selling Price`-`Cost Price`)*`Order Quantity`;

#find unique Channel in data
select distinct `Channel` from orders;

#find the total sales based on channel
select `Channel`,sum(Sales) as Total_sales
from orders
group by `Channel`;

#find unique Currencies in data
select distinct `Currency Code` from orders;

#find the total sales based on channel
select `Currency Code`,sum(Sales) as Total_sales
from orders
group by `Currency Code`;

#find the rank based total sales for on channel
#This can be achieved through the use of {RANK()}-->{window function}
select `Currency Code`,round(sum(Sales)) as Total_sales,
Rank() over(order by sum(Sales) desc) as Sales_rank
from orders
group by `Currency Code`;

#find the (top 2 rank) based total sales for on channel
#This can be achieved through the use of {RANK()}--> {window function} along with 
#The {common Table Expression}--->{CTE}
with sales_rank as
(
select `Currency Code`,round(sum(Sales)) as Total_sales,
Rank() over(order by sum(Sales) desc) as `rank`
from orders
group by `Currency Code`
)
select * from sales_rank
where `rank`in(1,2);



#group the customers based on channel and currency and find total sales
select `Channel`, `Currency Code`, round(sum(Sales)) as Total_sales
from orders
group by `Channel`, `Currency Code`
order by `channel` asc;

/*"Given a table of sales data, how would you write a query to calculate the total sales 
for each combination of channel and currency code? Additionally, 
how would you rank these totals within each channel and sort the results by channel?"*/
select `Channel`, `Currency Code`, round(sum(Sales)) as Total_sales,
rank() over(partition by `Channel` order by round(sum(Sales)) desc) as `rank`
from orders
group by `Channel`, `Currency Code`
order by `channel` asc;


