-- 1. Create a stored procedure to insert a new employee.
-- 2. Create a stored procedure to update salary based on id.
-- 3. Write a trigger that updates stock when a new order is placed.
-- 4. Write a trigger that prevents deleting the last admin user.
-- 5. Call a stored procedure to fetch employees.
-- 6. Drop a procedure and trigger.
create table employees (emp_id int primary key, emp_name varchar(50), department varchar(50), salary decimal(10,2) );
delimiter //
create procedure insert_employee(in p_id int,in p_name varchar(20),in p_department varchar(20),in p_salary decimal(10,2))
begin
insert into employees values(p_id,p_name,p_department,p_salary);
end //
delimiter ;
call insert_employee(1,'john','IT',30000);
call insert_employee(2,'alice','HR',20000);
call insert_employee(3,'bob','HR',40000);
call insert_employee(4,'john','Sales',50000);
select * from employees;

delimiter //
create procedure Updates_Salary(in p_id int,in p_salary decimal(10,2))
begin 
update employees  set salary = p_salary where emp_id = p_id;
end //
delimiter ;
drop procedure Updates_Salary;
call Updates_Salary(1,60000);
create table products ( product_id int primary key, product_name varchar(50), stock int );
insert into products values (101,'laptop',50);
select * from employees where emp_id =1;
create table orders ( order_id int primary key, product_id int, quantity int );
delimiter //
create trigger Updates_orders
after insert on
orders
for each row 
begin 
update products set stock= stock - new.quantity 
where product_id = new.product_id;
end //
delimiter ;
drop trigger Updates_orders;
insert into orders values(1,101,3);
select * from orders;
select * from products;
create table users ( user_id int primary key, username varchar(50), role varchar(20) ); 
insert into users values (1,'admin01','admin');

delimiter //
create trigger prevent_last_admin_delete
before delete
on users
for each row 
begin 
if old.role='admin' and (select count(*) from users where role='admin')=1
 then signal sqlstate '45000'
 set message_text='cannot delete the last admin' ;
 end if; 
 end //
 delimiter ;
 delete from users where user_id=1;
 delimiter //
 create procedure GetEmployees()
 begin
 select * from employees;
 end//
 delimiter ;
 call GetEmployees();
drop trigger prevent_last_admin_delete;
drop procedure GetEmployees;