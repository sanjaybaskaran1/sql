create database `events`;

use `events`;


CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_name VARCHAR(100),
  order_date DATE,
  order_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_name, order_date, order_amount)
VALUES 
(1, 'sanjay', '2024-01-15', 250.00), 
(2, 'Janani', '2021-05-20', 500.00), 
(3, 'Alice', '2020-07-10', 700.00),
(4, 'Varun', '2024-07-10', 800.00);


CREATE TABLE orders_archive (
  order_id INT PRIMARY KEY,
  customer_name VARCHAR(100),
  order_date DATE,
  order_amount DECIMAL(10, 2)
);

-- Recurring event.
-- event executes repeatedly on scheduled time.
delimiter $$
create event `old_orders_log`
on schedule every 1 month
do
begin
	
    insert into orders_archive
	select * from orders
    where order_date <= current_date() - interval 1 year ;
    
    delete from orders where order_date <= current_date() - interval 1 year;
end $$
delimiter ;

select * from  orders;
select * from orders_archive; 


#see what are all the events in your database
show events;



#alter event
alter event `old_orders_log`
on schedule every 1 minute;

alter event `old_orders_log`
on schedule every 1 day;



#we can also drop event
drop event `old_orders_log`;