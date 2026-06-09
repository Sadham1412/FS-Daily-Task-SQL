-- 1. Create a table sales (id, product, amount).
-- 2. Use ROW_NUMBER() to rank sales by amount.
-- 3. Use RANK() to assign ranks with ties.
-- 4. Use DENSE_RANK() to avoid gaps in ranking.
-- 5. Use SUM() OVER() to calculate running totals.
-- 6. Create a CTE to fetch sales above average.

create table Sales(id int primary key auto_increment,product varchar(20),amount decimal(10,2));
insert into Sales(product,amount)values ('laptop',50000),
('mobile',30000),
('tablet',30000),
('monitor',20000),
('keyboard',10000);
select id,product,amount,row_number() over(order by amount desc) as 'row_number' from Sales;
select id,product,amount,rank() over(order by amount desc) as 'ranks' from Sales;
select id,product,amount,dense_rank() over(order by amount desc ) as 'dense_rank' from Sales;
select id,product,amount,sum(amount) over(order by id) as running_totals from Sales;
-- CTE
with avg_sales as (
select avg(amount) as avg_amount from Sales)
select id,product,amount from Sales where amount > (select avg_amount from avg_sales);
-- sub query
select id,product,amount from Sales where amount >(select avg(amount) from Sales);
