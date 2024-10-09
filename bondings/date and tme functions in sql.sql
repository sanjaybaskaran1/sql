create database `date time`;
use `date time`;

select now() as `current timestamp`;
select current_timestamp() as `current timestamp`;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATETIME,
    ship_date DATETIME,
    customer_id INT,
    amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, order_date, ship_date, customer_id, amount) VALUES
(1, '2023-01-10 09:30:00', '2023-01-12 14:00:00', 101, 150.00),
(2, '2023-02-15 11:00:00', '2023-02-17 10:30:00', 102, 200.00),
(3, '2023-03-20 14:15:00', '2023-03-25 09:00:00', 103, 350.00),
(4, '2023-04-01 08:45:00', '2023-04-03 13:30:00', 104, 100.00),
(5, '2023-05-12 12:00:00', '2023-05-15 11:15:00', 105, 250.00),
(6, '2023-06-30 10:30:00', '2023-07-01 14:45:00', 106, 400.00),
(7, '2023-07-25 15:00:00', '2023-07-28 09:30:00', 107, 300.00);

select * from orders;


select order_date, year(order_date) as `year` from orders;
select order_date, month(order_date) as `month` from orders;
select order_date, monthname(order_date) as `month name` from orders;
select order_date, day(order_date) as `day no in  month` from orders;
select order_date, dayname(order_date) as `day name` from orders;
select order_date, dayofweek(order_date) as `day no in week` from orders;
select order_date, dayofyear(order_date) as `day no in year` from orders;

select order_date, year(order_date) as `year`,
monthname(order_date) as `month name`, weekofyear(order_date) as `week`, 
quarter(order_date) as `quarter` from orders;

select order_date, hour(order_date) as `hour` from orders;
select order_date, minute(order_date) as `minute` from orders;
select order_date, second(order_date) as `second` from orders;

select order_date, ship_date, 
datediff(ship_date,order_date) as `Total days taken for delivery`
from orders;

select order_date, last_day(order_date) as `last date of month` from orders;

/*lets convert the date column which is in string to datetime
--> using {str_to_date()} function*/

CREATE TABLE orders_raw (
    order_id INT PRIMARY KEY,
    order_date_raw VARCHAR(50),
    customer_id INT,
    amount DECIMAL(10, 2)
);

INSERT INTO orders_raw (order_id, order_date_raw, customer_id, amount) VALUES
(1, '15-01-2023', 101, 150.00),
(2, '02/20/2023', 102, 200.00),
(3, 'March 10, 2023', 103, 350.00),
(4, '2023.04.05', 104, 100.00),
(5, '12-May-2023', 105, 250.00),
(6, '30-June-23', 106, 400.00),
(7, 'July 25 2023', 107, 300.00);

select * from orders_raw; -- see in our date column (dates are not formatted)

select distinct order_date_raw from orders_raw;

SELECT order_date_raw, 
       STR_TO_DATE(order_date_raw, '%m/%d/%Y') AS order_date
FROM orders_raw
WHERE order_date_raw LIKE ('__/__/____');

select order_date_raw,str_to_date(order_date_raw, '%d-%m-%Y') as `order_date`
from orders_raw  where order_date_raw like('%__-__-____%');

select order_date_raw, str_to_date(order_date_raw, '%M %d, %Y') as `order_date`
from orders_raw where order_date_raw like('%____%');


