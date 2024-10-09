use sales_analysis;

CREATE TABLE `customers2` (
  `Customer Index` bigint DEFAULT NULL,
  `Customer Names` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders2` (
  `OrderNumber` text,
  `OrderDate` datetime DEFAULT NULL,
  `Ship Date` datetime DEFAULT NULL,
  `Customer Name Index` bigint DEFAULT NULL,
  `Channel` text,
  `Currency Code` text,
  `Warehouse Code` text,
  `Region Index` bigint DEFAULT NULL,
  `Product  Index` bigint DEFAULT NULL,
  `Order Quantity` bigint DEFAULT NULL,
  `Selling Price` double DEFAULT NULL,
  `Cost Price` double DEFAULT NULL,
  `Sales` double DEFAULT NULL,
  `Profit` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into customers2
select * from customers limit 10;

insert into orders2
select * from orders limit 10;

select * from customers2;
select * from orders2;

select o.`Customer Name Index`,c.`Customer Index`, c.`Customer Names`,o.sales,
sum(sales) over (partition by o.`Customer Name Index`) as `Total_sales`,
row_number() over (partition by o.`Customer Name Index`) as `row_num`
from customers c join orders o on c.`Customer Index`=o.`Customer Name Index`;

with Total_sales as
(
select o.`Customer Name Index`,c.`Customer Index`, c.`Customer Names`,o.sales,
sum(sales) over (partition by o.`Customer Name Index`) as `Total_sales`,
row_number() over (partition by o.`Customer Name Index`) as `row_num`
from customers c join orders o on c.`Customer Index`=o.`Customer Name Index`
)
select * from Total_sales
where `row_num`=1;