-- TẠO CSDL
create database session02;

use session02;

create table subject(
id_subject char(10) primary key,
subject_name varchar(50) not null,
credit int not null check (credit > 0)
);



create table student(
id_student CHAR(10) PRIMARY KEY,
full_name varchar(50) not null
);
 