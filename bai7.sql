CREATE DATABASE ss2_bai7;
USE ss2_bai7;

CREATE TABLE Class (
    classId INT AUTO_INCREMENT PRIMARY KEY,
    className VARCHAR(100) NOT NULL,
    schoolYear VARCHAR(20) NOT NULL
);

CREATE TABLE Student (
    studentId INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    dateOfBirth DATE NOT NULL,
    classId INT NOT NULL,
    FOREIGN KEY (classId)
        REFERENCES Class(classId)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Teacher (
    teacherId INT AUTO_INCREMENT PRIMARY KEY,
    fullName VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Subject (
    subjectId INT AUTO_INCREMENT PRIMARY KEY,
    subjectName VARCHAR(100) NOT NULL,
    credits INT NOT NULL CHECK (credits > 0),
    teacherId INT NOT NULL,
    FOREIGN KEY (teacherId)
        REFERENCES Teacher(teacherId)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE Enrollment (
    studentId INT NOT NULL,
    subjectId INT NOT NULL,
    enrollmentDate DATE NOT NULL,
    PRIMARY KEY (studentId, subjectId),
    FOREIGN KEY (studentId)
        REFERENCES Student(studentId)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (subjectId)
        REFERENCES Subject(subjectId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Score (
    studentId INT NOT NULL,
    subjectId INT NOT NULL,
    processScore DECIMAL(4,2) NOT NULL CHECK (processScore >= 0 AND processScore <= 10),
    finalScore DECIMAL(4,2) NOT NULL CHECK (finalScore >= 0 AND finalScore <= 10),
    PRIMARY KEY (studentId, subjectId),
    FOREIGN KEY (studentId, subjectId)
        REFERENCES Enrollment(studentId, subjectId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);