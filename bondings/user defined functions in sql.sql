create database `functions`;
use `functions`;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products (product_name, price)
VALUES
('Laptop', 1000.00),
('Smartphone', 600.00),
('Tablet', 300.00),
('Headphones', 50.00),
('Monitor', 150.00);
SELECT * FROM products;



/*create a {user defined function} which calculates discount price
note--> (20% discount) on all products
*/
DELIMITER $$
CREATE FUNCTION CalculateDiscountedPrice (price DOUBLE, discount DOUBLE)
RETURNS DOUBLE
BEGIN
   DECLARE discounted_price DOUBLE;
   
   -- Calculate discounted price
   SET discounted_price = price - (price * discount / 100);
   
   -- Return the discounted price
   RETURN discounted_price;
END $$
DELIMITER ;



SET GLOBAL log_bin_trust_function_creators = 1;
#SET GLOBAL log_bin_trust_function_creators = 0;

-- unlike stored procedures you  can call your function with select statement.
SELECT * FROM products;
select *, CalculateDiscountedPrice(price, 20) as `discount_price` from products;
