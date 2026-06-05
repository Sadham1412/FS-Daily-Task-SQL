-- 1. Create tables customers and orders with a foreign key.
-- 2. Insert 5 customers and 5 orders.
-- 3. Write INNER JOIN to fetch customer names with their orders.
-- 4. Write LEFT JOIN to fetch all customers even without orders.
-- 5. Normalize a table with repeating groups into 2NF.
-- 6. Show an example of 3NF using sample data.
use companydb;
create table customers(customer_id int primary key,customer_name varchar(20),city varchar(20));
create table orders(order_id int primary key,customer_id int,order_amount decimal(10,2),foreign key(customer_id) references customers(customer_id));
insert into customers(customer_id,customer_name,city)values(1, 'John', 'Chennai'),
(2, 'Alice', 'Madurai'),
(3, 'David', 'Coimbatore'),
(4, 'Sophia', 'Trichy'),
(5, 'Michael', 'Salem');
insert into orders(order_id,customer_id,order_amount)values(101, 1, 5000.00),
(102, 2, 3000.00),
(103, 1, 4500.00),
(104, 3, 2500.00),
(105, 5, 6000.00);
select*from customers;
select*from orders;
select c.customer_name,o.order_id,o.order_amount from customers c inner join orders o on c.customer_id = o.customer_id;
select c.customer_name,o.order_id,o.order_amount from customers c left join orders o on c.customer_id = o.customer_id;
-- normalize
create table student_details (
    student_id int,
    student_name varchar(50),
    subject1 varchar(50),
    subject2 varchar(50)
);
create table students (
    student_id int primary key,
    student_name varchar(50)
);

create table student_subjects (
    student_id int,
    subject_name varchar(50),
    foreign key (student_id) references students(student_id)
);
-- sample data
insert into students values
(1,'John'),
(2,'Alice');
insert into student_subjects values
(1,'Maths'),
(1,'Science'),
(2,'English'),
(2,'Computer Science');
create table employee_details (
    employee_id int,
    employee_name varchar(50),
    department_id int,
    department_name varchar(50)
);

create table departments (
    department_id int primary key,
    department_name varchar(50)
);
create table employees (
    employee_id int primary key,
    employee_name varchar(50),
    department_id int,
    foreign key (department_id) references departments(department_id)
);
-- sample data
insert into departments values
(101,'IT'),
(102,'HR');
insert into employees values
(1,'John',101),
(2,'Alice',102);
-- display data
select * from departments;
select * from employees;