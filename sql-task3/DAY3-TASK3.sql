--  1. Create a table products (id, name, price).
--  2. Add a new column stock INT using ALTER TABLE.
--  3. Rename column price to unit_price.
--  4. Insert 5 products into the table.
--  5. Update the stock of one product.
--  6. Delete one product from the table.
use schooldb;
create table products(id int primary key auto_increment,name varchar(30),price decimal(10,3));
alter table products
add column stock int;
select*from products;
alter table products
rename column price to unit_price;
insert into products(name,unit_price,stock)
values('Laptop',52000,10),
('Mouse',500,50),
('Keyboard',1200,30),
('Monitor',15000,15),
('Headphones',2000,25);
update products set stock =50
where id=1;
delete from products
where id=3;