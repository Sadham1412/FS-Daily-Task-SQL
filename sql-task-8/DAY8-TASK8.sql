-- 1. Find employees with salary greater than the average salary (subquery).
--  2. Select products with price higher than the cheapest order.
--  3. Use a subquery inside WHERE to fetch customers with orders.
--  4. Use a subquery inside SELECT to show order counts.
--  5. Use a correlated subquery to find the highest salary per department.
--  6. Use a subquery to check if a product exists.
-- use schooldb;
select name,salary from employees where salary>(select avg(salary) from employees);
select name,unit_price from products where unit_price > (select min(unit_price) from products);
create database Customerdb;
create table customers (customer_id int primary key auto_increment,customer_name varchar(20));
insert into customers values
(1,'john'),
(2,'alice'),
(3,'david'),
(4,'sophia'),
(5,'michael');
create table orders (
    order_id int primary key,
    customer_id int,
    order_amount decimal(10,2),
    foreign key (customer_id) references customers(customer_id)
);
select * from orders;
insert into orders values
(1001,1,5000),
(1002,2,3000),
(1003,1,4500),
(1004,3,2500),
(1005,5,6000);
select * from customers where customer_id in
(select customer_id from orders);
select customer_name,(select count(*)from orders where orders.customer_id = customers.customer_id) as order_count from customers;
select name,department,salary from employees e1 where salary = (select max(salary) from employees e2 where e1.department = e2.department);
select * from employees;
select exists (select name from products where name ='laptop')  as product_exists;
select exists (select name from products where name ='desktop')  as product_exists;