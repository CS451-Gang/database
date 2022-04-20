CREATE DATABASE IF NOT EXISTS UMKC_Db;
USE UMKC_Db;

CREATE TABLE IF NOT EXISTS Student
(Student_ID INT NOT NULL,
Student_FName VARCHAR (20) NOT NULL,
Student_LName VARCHAR (20) NOT NULL,
Student_Email VARCHAR(30) NOT NULL,
Student_InternationalStatus BOOLEAN,
Student_GTACert BOOLEAN,
Student_Qualifications VARCHAR(10),
Student_Major VARCHAR(20),
Student_NumOfSem INT NOT NULL,
PRIMARY KEY (Student_ID));

CREATE TABLE IF NOT EXISTS Course
(Course_ID VARCHAR(10) NOT NULL,
Course_Type VARCHAR(20),
PRIMARY KEY (Course_ID));

CREATE TABLE IF NOT EXISTS Grade
(Student_ID INT NOT NULL,
Course_ID VARCHAR(10) NOT NULL,
Grade_Value VARCHAR(1),
PRIMARY KEY (Student_ID, Course_ID),
FOREIGN KEY (Student_ID) references Student (Student_ID) ON DELETE CASCADE,
FOREIGN KEY (Course_ID) references Course (Course_ID) ON DELETE CASCADE);

CREATE TABLE IF NOT EXISTS Faculty (
    Faculty_ID INT NOT NULL,
    Faculty_FName VARCHAR(20) NOT NULL,
    Faculty_LName VARCHAR(20) NOT NULL,
    Faculty_Email VARCHAR(30) NOT NULL,
    PRIMARY KEY (Faculty_ID)
);

CREATE TABLE IF NOT EXISTS Positions
(Position_ID INT NOT NULL,
Student_ID INT,
Faculty_ID INT,
Course_ID VARCHAR(10) NOT NULL,
Position_Type VARCHAR(10) NOT NULL,
PRIMARY KEY (Position_ID),
FOREIGN KEY (Student_ID) references Student (Student_ID) ON DELETE SET NULL,
FOREIGN KEY (Faculty_ID) references Faculty (Faculty_ID) ON DELETE SET NULL,
FOREIGN KEY (Course_ID) references Course (Course_ID) ON DELETE CASCADE);
