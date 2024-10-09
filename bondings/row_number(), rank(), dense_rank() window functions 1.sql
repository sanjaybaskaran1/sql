/* (1)-->{rank()} , (2)-->{dense_rank()},  (3)-->{row_number()}*/

use bondings;

CREATE TABLE sales (
    sale_id INT,
    sales_rep VARCHAR(50),
    sale_amount DECIMAL(10, 2),
    sale_date DATE
);

INSERT INTO sales VALUES
(1, 'Alice', 1500.00, '2024-01-15'),
(2, 'Bob', 2500.00, '2024-01-16'),
(3, 'Charlie', 1500.00, '2024-01-17'),
(4, 'David', 3000.00, '2024-01-18'),
(5, 'Eve', 2500.00, '2024-01-19'),
(6, 'Frank', 3500.00, '2024-01-20');

/* 1) find the rank for salary using {rank()} window function*/
select * from sales;
with salary_ranks as
(select sale_id, sales_rep, sale_amount, sale_date,
rank() over (order by sale_amount desc) as sal_rank
from sales
)
select * from salary_ranks;



/* 2)find the rank for salary using {dense_rank()} window function */
with salary_dense_rank as
(
select *,
dense_rank() over (order by sale_amount desc) as sal_rank
from sales
)
select * from salary_dense_rank;


/* 3)find the rank for salary using {row_number()} window function */
with salary_dense_rank as
(
select *,
row_number() over (order by sale_amount desc) as sal_rank
from sales
)
select * from salary_dense_rank;
















