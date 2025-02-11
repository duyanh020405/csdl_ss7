use ss7;

create table Departments (
department_id int , 
department_name varchar(225) , 
location varchar(225) );
create table Employees (
employee_id int primary key ,
name varchar(225),
dob date,
department_id int ,
foreign key (department_id) references Departments(department_id),
salary decimal(10,2)
);

create table Projects  (
project_id int primary key ,
project_name varchar(255),
start_date date ,
end_date date );

create table Timesheets (
timesheet_id int primary key,
employee_id int,
foreign key (employee_id) references Employees(employee_id),
project_id int primary key,
foreign key (project_id) references Projects(project_id),
work_date date ,
hours_worked decimal(10,2) 
);

create table WorkReports  (
employee_id int,
foreign key (employee_id) references Employees(employee_id),
report_date date ,
report_content date 
);

-- thêm dữ liệu vào departments
insert into departments values (1, 'it', 'new york'), (2, 'hr', 'san francisco');

-- thêm dữ liệu vào employees
insert into employees values (101, 'alice', '1990-05-15', 1, 75000.00);
insert into employees values (102, 'bob', '1985-08-25', 2, 60000.00);

-- thêm dữ liệu vào projects
insert into projects values (201, 'project a', '2024-01-10', '2024-06-10');
insert into projects values (202, 'project b', '2024-02-15', '2024-07-20');

-- thêm dữ liệu vào timesheets
insert into timesheets (employee_id, project_id, work_date, hours_worked)
values (101, 201, '2024-02-01', 8.5),
       (102, 202, '2024-02-02', 7.0);

-- thêm dữ liệu vào workreports
insert into workreports (employee_id, report_date, report_content)
values (101, '2024-02-05', 'completed module 1'),
       (102, '2024-02-06', 'reviewed project requirements');
update projects 
set project_name = 'project a - phase 1', end_date = '2024-06-30' 
where project_id = 201;
delete from employees where employee_id = 102;
