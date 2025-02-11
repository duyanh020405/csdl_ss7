create database hihi23;
use hihi23;
create table users (
user_id int auto_increment primary key  ,
user_name varchar(50) not null unique ,
user_fullname varchar(50) not null , 
email varchar(100) not null unique ,
user_address text ,
user_phone varchar(20) unique not null 
 ); 
 create table employees (
 emp_id varchar(5)  not null unique, 
 user_id int ,
 foreign key (user_id) references users(user_id),
 emp_p_position varchar(50),
 emp_hire_date date ,
 salary int not null  check (salary >0),
 status enum('Dang lam' , 'Dang nghi') not null default 'Dang lam');
 
 create table orders ( 
 order_id int not null auto_increment primary key ,
 user_id int not null , 
 order_date date not null default (current_date) ,
 foreign key (user_id) references users(user_id) ,
 order_total_amount int 
 );
 create table products ( 
 pro_id varchar(5) not null unique primary key , 
 pro_name varchar(100) not null  unique ,
 pro_price int not null check (pro_price > 0) ,
 pro_quantity int , 
 status enum ('Con hang' ,'Het hang') default 'Con hang'
 );
 
 create table order_detail (
 order_detail_id int auto_increment primary key , 
 order_id int ,
 foreign key (order_id) references orders(order_id),
 pro_id varchar(5) ,
 foreign key (pro_id) references products(pro_id),
 order_detail_quantity int check (order_detail_quantity > 0),
 order_detail_price int 
 );
 
 -- Thêm dữ liệu giả vào bảng users
INSERT INTO users (user_name, user_fullname, email, user_address, user_phone)
VALUES
('user001', 'Nguyen Van A', 'nguyenvana@example.com', '123 Main St, Hanoi', '01234567890'),
('user002', 'Tran Thi B', 'tranthib@example.com', '456 Another St, Hanoi', '01234567891'),
('user003', 'Le Minh C', 'leminhc@example.com', '789 Third St, Hanoi', '01234567892');

-- Thêm dữ liệu giả vào bảng employees
INSERT INTO employees (emp_id, user_id, emp_p_position, emp_hire_date, salary, status)
VALUES
('E001', 1, 'Manager', '2020-01-15', 5000000, 'Dang lam'),
('E002', 2, 'Developer', '2021-03-10', 3000000, 'Dang lam'),
('E003', 3, 'Designer', '2022-05-20', 4000000, 'Dang nghi');

-- Thêm dữ liệu giả vào bảng products
INSERT INTO products (pro_id, pro_name, pro_price, pro_quantity, status)
VALUES
('P001', 'Laptop', 15000000, 10, 'Con hang'),
('P002', 'Smartphone', 10000000, 20, 'Con hang'),
('P003', 'Headphones', 2000000, 15, 'Het hang');

-- Thêm dữ liệu giả vào bảng orders
INSERT INTO orders (user_id, order_date, order_total_amount)
VALUES
(1, '2025-02-10', 15000000),
(2, '2025-02-11', 10000000),
(3, '2025-02-12', 2000000);

-- Thêm dữ liệu giả vào bảng order_detail
INSERT INTO order_detail (order_id, pro_id, order_detail_quantity, order_detail_price)
VALUES
(1, 'P001', 1, 15000000),
(2, 'P002', 1, 10000000),
(3, 'P003', 2, 2000000);

 

 -- lam bai 
alter table orders
 add column status enum( 'Pending ', 'Processing', 'Completed', 'Cancelled' ) default 'Pending ';
 
alter table users
modify column user_phone varchar(11);

alter table users 
drop column email ;



 
 

 