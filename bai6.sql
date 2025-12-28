create database session02_5;
use session02_5;

create table Teacher(
  Ma_giang_vien int primary key,
  Ho_ten varchar(50),
  Email varchar(100)
  );
create table Subject(
	Ma_mon_hoc int primary key,
	Ten_mon_hoc varchar(30) ,
	So_tin_chi int not null,
    Ma_giang_vien int,
    foreign key (Ma_giang_vien) 
    references Teacher(Ma_giang_vien)
	);
	create table Student(
	Ma_sinh_vien int primary key,
	Ho_ten varchar(50) 
	);
	create table Register(
	Ma_sinh_vien int not null ,
	Ma_mon_hoc int not null ,
    PRIMARY KEY (Ma_sinh_vien, Ma_mon_hoc),
	Ngay_dang_ky date default (current_date()),
	foreign key (Ma_sinh_vien) 
    references Student(Ma_sinh_vien),
    foreign key (Ma_mon_hoc) 
    references Subject(Ma_mon_hoc)
	);
 CREATE TABLE score (
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    process_score DECIMAL(3,1) NOT NULL CHECK (process_score >= 0 AND process_score <= 10),
    final_score DECIMAL(3,1) NOT NULL CHECK (final_score >= 0 AND final_score <= 10),

    CONSTRAINT pk_score PRIMARY KEY (student_id, subject_id),

    CONSTRAINT fk_score_student
        FOREIGN KEY (student_id)
        REFERENCES Student(Ma_sinh_vien),

    CONSTRAINT fk_score_subject
        FOREIGN KEY (subject_id)
        REFERENCES Subject(Ma_mon_hoc)
);
