create database schoolDB; 
use schoolDB;
create table student(id int primary key ,studname varchar(50)not null , age int, grade char(1));
select*from student;
insert into student(id,studname,age,grade)
values (1,"sadham",23,'A'),(2,"venkat",22,'B'),
(3,"sherif",23,'A'),(4,"shanmuga",23,'B'),
(5,"sathiyanarayanan",23,'S');
drop database schoolDB;