create database course_management_system;

use course_management_system;

create table students(
	student_id int primary key,
    student_name varchar(50),
    email varchar(100)
);

create table enrollments(
	enrollment_id int primary key,
    student_id int,
    course_name varchar(50),
    foreign key(student_id) references students(student_id) on delete cascade
);

insert into students values
(101, "Prince", "prince@gmail.com"),
(102, "Goutham", "goutham@gmail.com"),
(103, "Raghu ram", "raghuram@gmail.com"),
(104, "Sathwik", "sathwik@gmail.com"),
(105, "Uzair", "uzair@gmail.com");

insert into enrollments values
(1, 101, "Python Full Stack"),
(2, 102, "Java Full Stack"),
(3, 102, "AI/ML Engineering"),
(4, 103, "Core Python"),
(5, 104, "Networking"),
(6, 104, "DSA Bootcamp"),
(7, 105, "Agentic AI"),
(8, 105, "Data Science");

select * from enrollments;
select * from students;

#Task 1: ON DELETE CASCADE
delete from students where student_id = 101;
select * from enrollments; #101 data is also removed from enrollment table

#Task 2: ON DELETE SET NULL
show create table enrollments; 
alter table enrollments drop foreign key enrollments_ibfk_1;
alter table enrollments add foreign key(student_id) references students(student_id) on delete set null;
delete from students where student_id = 102;
select * from enrollments; #102 data is now set to null 

#Task 3: ON DELETE RESTRICT
alter table enrollments drop foreign key enrollments_ibfk_1;
alter table enrollments add foreign key(student_id) references students(student_id) on delete restrict;
delete from students where student_id = 103; #Cannot delete or updata a parent row error: Foreign key constraint fails

#Task 4: ON UPDATE CASCADE
alter table enrollments drop foreign key enrollments_ibfk_1;
alter table enrollments add foreign key(student_id) references students(student_id) on update cascade;
update students set student_id = 204 where student_id = 104;
select * from enrollments; #Student 104 changes to 204

drop table enrollments;
drop table students;

#Interview Questions: 
/*
Q1: What is Cascading in MySQL?
A: Cascading is the special feature tied to foreign key constraint that automatically processes the updates 

Q2: What is the difference between CASCADE and SET NULL?
A: CASCADE is the keyword and feature of foreign key, SET NULL is the type of the CASCADING used with ON DELETE or ON UPDATE

Q3: Why do we use restrict?
A: We use ON DELETE RESTRICT to stop allowing users to perform delete operation and restrict them to save important data. 

Q4: Can we use SET NULL if the foreign key column is NOT NULL? 
A: No we cannot use ON DELETE SET NULL or ON UPDATE SET NULL if the foreign key column is defined to be NOT NULL

Q5: What Happens when we update a parent table’s primary key with ON UPDATE CASCADE? 
A: When we update the parent table automatically the child table with foreign key column gets updated. 

Q6: Give one real time example where ON DELETE CASCADE is useful. 
A: ON DELETE CASCADE is useful for student records, deleting one student can delete his related records from another child tables. 


*/

#FINAL Challenge: Create third table 'payments' and establish a foriegn key relationship with 'enrollments' and Implement an appropiate cascading strategy and explain why you selected it. 
create table payments(
	payment_id int primary key,
    student_id int, 
    payment_method enum('UPI', 'Cash'),
    amount decimal(10, 4),
	foreign key(student_id) references enrollments(student_id) on delete cascade
);


