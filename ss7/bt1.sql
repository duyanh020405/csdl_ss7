create database ss7;
use ss7;

create table Categories  (
category_id int primary key auto_increment ,
category_name varchar(225) );

create table Books ( 
book_id int primary key auto_increment ,
tilte varchar(225),
author varchar(225) ,
pulication_year int , 
available_quantity int , 
category_id int , 
foreign key (category_id) references  Categories(category_id));

create table Readers (
reader_id int primary key auto_increment ,
name varchar(255),
phone_number varchar(15),
email varchar(225));

create table Borrowing (
borrow_id int primary key auto_increment , 
reader_id int ,
book_id int ,
foreign key (reader_id) references  Readers(reader_id),
foreign key (book_id) references  Books(book_id),
borrow_date date , 
due_date date );

create table Returning  (
return_id int primary key ,
borrow_id int ,
foreign key (borrow_id) references Borrowing(borrow_id),
return_date date );

create table Fines (
fine_id int primary key ,
return_id int ,
foreign key (return_id) references Returning(return_id));


-- 3
insert into categories (category_name) 
values ('Fiction'), 
       ('Science');
insert into books (title, author, publication_year, available_quantity, category_id) 
values ('The Great Gatsby', 'F. Scott Fitzgerald', 1925, 10, 1), 
       ('A Brief History of Time', 'Stephen Hawking', 1988, 5, 2);

insert into readers (name, phone_number, email) 
values ('Nguyen Van A', '0901234567', 'nguyenvana@example.com'), 
       ('Tran Thi B', '0912345678', 'tranthib@example.com');
insert into borrowing (reader_id, book_id, borrow_date, due_date) 
values (1, 1, '2025-02-01', '2025-02-15'), 
       (2, 2, '2025-02-05', '2025-02-20');
insert into returning (borrow_id, return_date) 
values (1, '2025-02-10'), 
       (2, '2025-02-18');
insert into fines (return_id) 
values (1), 
       (2);
	-- 4
update readers 
set name = 'Nguyen Van C', phone_number = '0987654321', email = 'nguyenvanc@example.com' 
where reader_id = 1;
 -- 5
 delete from books 
where book_id = 2;




