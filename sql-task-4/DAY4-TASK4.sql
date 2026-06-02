-- 1. Create a table orders (id, product_name, quantity, price).
-- 2. Insert 5 orders with different values.
-- 3. Select all orders where quantity > 2.
-- 4. Select orders where price is between 100 and 500.
-- 5. Fetch orders with product_name starting with 'A'.
-- 6. Fetch orders sorted by quantity in descending order.
use schooldb;
create table orders(id int primary key auto_increment,product_name varchar(30),quantity int,price decimal(10,3));
insert into orders(product_name,quantity,price)
values('Apple phone',3,150.22),
('Laptop',1,45000.12),
('Android Phone',2,12000.13),
('Adapter',5,250.99),
('Keyboard',4,450.99);
select*from orders;
select *from orders where quantity>2;
select *from orders where price between 100 and 500;
select * from orders where product_name like 'A%';
select *from orders order by quantity desc ;
