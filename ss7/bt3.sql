use ss7;
drop table if exists categories, books, readers, borrowing, returning, fines;

-- tạo bảng categories
create table categories (
    category_id int primary key auto_increment,
    category_name varchar(225)
);

-- tạo bảng books
create table books ( 
    book_id int primary key auto_increment,
    title varchar(225), -- sửa lỗi 'tilte' thành 'title'
    author varchar(225),
    publication_year int, 
    available_quantity int, 
    category_id int, 
    foreign key (category_id) references categories(category_id)
);

-- tạo bảng readers
create table readers (
    reader_id int primary key auto_increment,
    name varchar(255),
    phone_number varchar(15),
    email varchar(225)
);

-- tạo bảng borrowing
create table borrowing (
    borrow_id int primary key auto_increment, 
    reader_id int,
    book_id int,
    borrow_date date, 
    due_date date, -- ngày đến hạn trả sách
    foreign key (reader_id) references readers(reader_id),
    foreign key (book_id) references books(book_id)
);

-- tạo bảng returning
create table returning (
    return_id int primary key auto_increment,
    borrow_id int unique, -- một lần mượn chỉ có một lần trả
    return_date date,
    foreign key (borrow_id) references borrowing(borrow_id)
);

-- tạo bảng fines
create table fines (
    fine_id int primary key auto_increment,
    return_id int,
    fine_amount decimal(10,2),
    foreign key (return_id) references returning(return_id)
);

-- thêm dữ liệu vào categories
insert into categories (category_name) values
('science'), ('literature'), ('history'), ('technology'), ('psychology');

-- thêm dữ liệu vào books
insert into books (title, author, publication_year, available_quantity, category_id) values
('the history of vietnam', 'john smith', 2001, 10, 3),
('python programming', 'jane doe', 2020, 5, 4),
('famous writers', 'emily johnson', 2018, 7, 2),
('machine learning basics', 'michael brown', 2022, 3, 4),
('psychology and behavior', 'sarah davis', 2019, 6, 5);

-- thêm dữ liệu vào readers
insert into readers (name, phone_number, email) values
('alice williams', '123-456-7890', 'alice.williams@email.com'),
('bob johnson', '987-654-3210', 'bob.johnson@email.com'),
('charlie brown', '555-123-4567', 'charlie.brown@email.com');

-- thêm dữ liệu vào borrowing (chỉnh lại borrow_date <= due_date)
insert into borrowing (reader_id, book_id, borrow_date, due_date) values
(1, 1, '2025-02-10', '2025-02-15'),
(2, 2, '2025-02-03', '2025-02-17'),
(3, 3, '2025-02-02', '2025-02-16'),
(1, 2, '2025-02-10', '2025-02-24'),
(2, 3, '2025-02-11', '2025-02-25');

-- thêm dữ liệu vào returning
insert into returning (borrow_id, return_date) values
(1, '2025-02-14'),
(2, '2025-02-18'),
(3, '2025-02-15'),
(4, '2025-02-20');

-- thêm dữ liệu vào fines
insert into fines (return_id, fine_amount) values
(1, 0.00),
(2, 5.00),
(3, 0.00),
(4, 2.00);

-- 1
select title as all_book from books;
select author as all_author from books;

select r.name , b.title , bo.borrow_date from borrowing bo
inner join readers r on r.reader_id = bo.reader_id 
inner join books b on b.book_id = bo.book_id;

select b.title , b.author ,c.category_name as category from borrowing bo
inner join books b on b.book_id = bo.book_id
inner join categories c on c.category_id = b.category_id ;



select r.name, f.fine_amount, re.return_date 
from fines f
inner join returning re on f.return_id = re.return_id 
inner join borrowing bo on re.borrow_id = bo.borrow_id 
inner join readers r on bo.reader_id = r.reader_id;

-- 3
update books set available_quantity = 15 where book_id = 1;
alter table borrowing drop foreign key borrowing_ibfk_1;
delete from readers where reader_id = 2;
INSERT INTO readers(reader_id ,name ,phone_number ,email ) values (2,'Bob Johnson', '987-654-3210','bob.johnson@email.com');

