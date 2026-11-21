create database joins_practice;
use joins_practice;

create table departments(
	dept_id int primary key,
    dept_name varchar(50)
);

create table employees(
	emp_id int primary key,
    emp_name varchar(50),
    salary decimal(10, 2),
    dept_id int,
    foreign key(dept_id) references departments(dept_id)
);

INSERT INTO departments VALUES
(101, 'Python'),
(102, 'Java'),
(103, 'Data Analytics'),
(104, 'Testing'),
(105, 'DevOps') ;

INSERT INTO employees VALUES
(1, 'Siva', 30000.88, 101),
(2, 'Ravi', 35000.77, 102),
(3, 'Kiran', 40000.66, 101),
(4, 'Sai', 25000.55, 103),
(5, 'Ram', 45000.44, NULL),
(6, 'Krishna', 32000.33, 105);

select * from departments;
select * from employees;

#Task 1 - INNER JOIN: Display employee names along with their department names.
select e.emp_name, d.dept_name 
from employees e inner join departments d 
on e.dept_id = d.dept_id;

#Task 2 - LEFT JOIN: Display all employees along with their department names. Include employees even if they do not have a matching department.
select e.emp_name, d.dept_name from
employees e left join departments d 
on e.dept_id = d.dept_id;

#Task 3 - RIGHT JOIN: Display all departments along with employee names. Include departments even if no employees are assigned to them.
select e.emp_name, d.dept_name from 
employees e right join departments d
on e.dept_id = d.dept_id;

#Task 4 - FULL OUTER JOIN: Display all employees and all departments, including unmatched records from both tables.
select e.emp_name, d.dept_name from
employees e left join departments d on
e.dept_id = d.dept_id
UNION
select e.emp_name, d.dept_name from
employees e right join departments d on
e.dept_id = d.dept_id;

#Task 5 - JOIN Challenge: Display all department names and employee names, but only include employees whose salary is greater than 30,000. Also include departments that have no employees.
select d.dept_name, e.emp_name from 
departments d left join employees e 
on d.dept_id = e.dept_id and e.salary > 30000;
