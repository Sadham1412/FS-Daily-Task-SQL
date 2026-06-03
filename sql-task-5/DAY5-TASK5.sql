-- 1. Use COUNT() to count total orders.
-- 2. Find the SUM() of all order prices.
-- 3. Find the AVG() order price.
-- 4. Group orders by product_name and show total sales.
-- 5. Find the MAX() and MIN() price of orders.
-- 6. Sort the grouped data by total sales descending.
select*from products;
select *from orders;
select count(*) as total_order from orders;
select sum(price) as total_prices from orders;
select avg(price) as avg_prices from orders;
select name as product_name,sum(unit_price) as total_sales from products group by name ;
select max(price),min(price) from orders;
select product_name,sum(price) as total_prices from orders group by product_name order by total_prices desc ;