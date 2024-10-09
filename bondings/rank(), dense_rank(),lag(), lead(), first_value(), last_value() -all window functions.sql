/* 
{rank()},{dense_rank()},{row_number()} --> RANKING WINDOW FUNCTIONS
{first_value()},{last_value()},{lag()}, {lead()} --> VALUE WINDOW FUNCTIONS
{SUM(),COUNT(),MAX(),MIN(),AVG()} --> AGGREGTE WINDOW FUNCTIONS
*/

create database window_functions;
use window_functions;

CREATE TABLE electronics_sales (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    sale_month DATE,
    sales_amount DECIMAL(10, 2)
);

INSERT INTO electronics_sales (product_name, sale_month, sales_amount) VALUES
('Laptop', '2023-01-01', 1200.00),
('Laptop', '2023-02-01', 1350.00),
('Laptop', '2023-03-01', 1100.00),
('Laptop', '2023-04-01', 1400.00),
('Laptop', '2023-05-01', 1250.00),
('Smartphone', '2023-01-01', 800.00),
('Smartphone', '2023-02-01', 850.00),
('Smartphone', '2023-03-01', 900.00),
('Smartphone', '2023-04-01', 950.00),
('Smartphone', '2023-05-01', 1000.00),
('Tablet', '2023-01-01', 500.00),
('Tablet', '2023-02-01', 550.00),
('Tablet', '2023-03-01', 600.00),
('Tablet', '2023-04-01', 650.00),
('Tablet', '2023-05-01', 700.00),
('Smartwatch', '2023-01-01', 200.00),
('Smartwatch', '2023-02-01', 250.00),
('Smartwatch', '2023-03-01', 230.00),
('Smartwatch', '2023-04-01', 270.00),
('Smartwatch', '2023-05-01', 290.00),
('Smartwatch', '2023-06-01', 290.00);

select * from electronics_sales;


/*rank(), dense_rank()*/
select *,
rank() over (order by sales_amount desc) as `rank`,
dense_rank() over (order by sales_amount desc) as `dense_rank`
from electronics_sales;

select *,
rank() over (partition by product_name order by sales_amount desc) as `rank`,
dense_rank() over (partition by product_name order by sales_amount desc) as `dense_rank`
from electronics_sales;


/*first_value(), last_value()*/
select *,
first_value(sales_amount) over (order by sale_month asc) as `first_value`
from electronics_sales;
 
select *,
first_value(sales_amount) over (partition by product_name order by sale_month) as `first_value`
from electronics_sales;

select *,
last_value(sales_amount) over 
(partition by product_name order by sale_month) as `last_value`
from electronics_sales;


select *,
last_value(sales_amount) over 
(partition by product_name order by sale_month 
rows between unbounded preceding and unbounded following) as `last_value`
from electronics_sales;


/* lag() , lead() */
select *,
lag(sales_amount) over (order by sale_month) as `previous_sale`
from electronics_sales;


select *,
lag(sales_amount) over (partition by product_name order by sale_month) as `previous_sale`
from electronics_sales;


 select *,
 lead(sales_amount) over (partition by product_name order by sale_month) as `next_sale`
 from electronics_sales;
 
 
 select *,
 lag(sales_amount) over (partition by product_name order by sale_month) as `previous_sale`,
 lead(sales_amount) over (partition by product_name order by sale_month) as `next_sale`
 from electronics_sales;
 
 
 /*AGGREGATE WINDOW FUNCTIONS {SUM(),COUNT(),MAX(),MIN(),AVG()}*/
 select *,
 sum(sales_amount) over (partition by product_name) as `Total_sales`
 from electronics_sales;
 
 select *,
 count(sales_amount) over (partition by product_name) as `sales_count`
 from electronics_sales;
 
 select *,
 max(sales_amount) over (partition by product_name) as `max_sale`
 from electronics_sales;
 
 select *,
 min(sales_amount) over (partition by product_name) as `min_sale`
 from electronics_sales;
 
 select *,
 avg(sales_amount) over (partition by product_name) as `max_sale`
 from electronics_sales;
 
 
 
 