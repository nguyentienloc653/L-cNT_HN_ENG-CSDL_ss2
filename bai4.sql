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

create table enrollment (
id_student char(10) not null,
id_subject char(10) not null,
enroll_date date not null check (enroll_date < '2025-12-29'),

constraint pk_enrollment primary key (id_student, id_subject),

constraint fk_enrollment_student
	foreign key (id_student)
    references student(id_student),
    
constraint fk_enrollment_subject
	foreign key (id_subject)
    references subject(id_subject)
);