-- 1. Create a table events (id, event_name, event_date).
-- 2. Insert events with different dates.
-- 3. Use NOW() to display current date & time.
-- 4. Format event_date using DATE_FORMAT().
-- 5. Extract YEAR and MONTH from event_date.
-- 6. Use CONCAT() to combine event_name and event_date.
use schooldb;
create table events_table(id int primary key auto_increment,event_name varchar(20),event_date date);
insert into events_table(event_name,event_date)
values ('Tech Conference','2026-06-15'),
('Sports Day','2026-07-10'),
('Cultural Fest','2026-08-20'),
('Workshop','2026-09-05'),
('Project Expo','2026-10-12');
select*from events_table;
select now();
select event_date , date_format(event_date,'%d-%m-%y') as event_date_format from events_table;
select year(event_date) as event_year ,month(event_date) as event_month from events_table;
select concat(event_name,'-',event_date) as 'concat_details' from events_table