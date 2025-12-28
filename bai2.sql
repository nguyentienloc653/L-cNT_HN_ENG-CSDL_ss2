-- TẠO CSDL
create database session02_bai2;

use session02_bai2;

create table classes(
id_class int primary key auto_increment,
class_name varchar(50) not null unique,
year int not null
);



create table student(
id_student CHAR(10) PRIMARY KEY,
    full_name VARCHAR(30) NOT NULL,
    date_of_birth DATE NOT NULL,
    id_class INT NOT NULL,

    CONSTRAINT fk_student_class
        FOREIGN KEY (id_class)
        REFERENCES classes(id_class)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
 