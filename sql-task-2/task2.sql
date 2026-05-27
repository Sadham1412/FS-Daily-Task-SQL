--  1. Create a database companyDB.
--  2. Create a table employees with constraints: id (PRIMARY KEY), name (NOT NULL), salary (DEFAULT 30000).
--  3. Add a UNIQUE constraint on email.
--  4. Insert 5 employee records.
--  5. Try inserting a duplicate email to see the error.
--  6. Drop the table and recreate it with CHECK constraint for salary > 0.
use companyDB;
create database companyDB;
create table employee(id int primary key,name varchar(30)not null,salary decimal(10,2)default 30000);
alter table employee
add column email varchar(20) unique;
select*from employee;
desc employee;
insert into employee(id,name,salary,email)
values(1,"sadham",50000,"sadham@123"),
(2,"venkat",40000,"venkat@123"),
(3,"shanmuga",45000,"shanmuga@123");
insert into employee(id,name,email)
values(4,"john","john@123"),
(5,"alice","alice@123");
drop table employee;
create table employee(id int primary key,name varchar(30)not null,salary decimal(10,2)check(salary>0));
insert into employee(id,name,salary)
values(1,"sadham",-100000);