-- Write a query to fetch employees whose salary is higher than the department average.
-- Use a subquery to list customers who placed more than 2 orders.
-- Fetch the highest-priced product using a subquery in WHERE.
-- Create a subquery that returns the total order value per customer.
-- Use a correlated subquery to list employees earning more than their manager.
-- Write a query to check if a product exists in the orders table using EXISTS.
select id,name,department,salary from employees e where salary >(select avg(salary) from employees where department= e.department);
select department,avg(salary) from employees group by department;
select *from employees;
create table orders01(id int ,customer_name varchar(20),orders_id int primary key);
insert into orders01 values(1,'john',101),(2,'alice',102),(1,'john',103),(3,'venkat',104),(4,'sadham',105),(4,'sadham',106);
select * from orders01;
select * from orders01 where customer_name in (select customer_name from orders01 group by customer_name having count(*)>1);
select * from orders;
select * from orders where price = (select max(price) from orders);
create table customers (
    customer_id int primary key,
    customer_name varchar(50)
);
insert into customers values
(1,'john'),
(2,'sara'),
(3,'mike'),
(4,'emma');
create table orders (
    order_id int primary key,
    customer_id int,
    product_name varchar(50),
    quantity int,
    unit_price decimal(10,2)
);
insert into orders values
(101,1,'laptop',2,50000),
(102,1,'mouse',3,500),
(103,2,'mobile',1,25000),
(104,3,'keyboard',2,1500),
(105,3,'monitor',1,12000);
select c.customer_id,c.customer_name,(select sum(o.quantity * o.unit_price) from orders o
 where c.customer_id = o.customer_id) as total_orders from customers c;
 select * from employees2;
 create table employees (
    emp_id int primary key,
    emp_name varchar(50),
    salary decimal(10,2),
    manager_id int
);
insert into employees values
(1,'john',50000,null),
(2,'sara',40000,1),
(3,'mike',60000,1),
(4,'emma',35000,2),
(5,'david',45000,2);
select * from employees;
select * from employees e1 where salary>(select salary from employees e2 where e1.manager_id = e2.emp_id);
select * from orders;
select * from products;
select * from orders where exists(select product_name from orders where product_name ='laptop');
select * from products p where exists
(select 1 from orders o where o.product_id = p.product_id);