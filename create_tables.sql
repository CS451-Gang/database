CREATE DATABASE IF NOT EXISTS gta;
USE gta;
CREATE TABLE IF NOT EXISTS applications (
    id INT NOT NULL,
    full_name VARCHAR (100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    current_level ENUM('BS', 'MS', 'PhD') NOT NULL,
    graduating_semester VARCHAR(50) NOT NULL,
    cumulative_gpa VARCHAR(10) NOT NULL,
    hours_completed INT NOT NULL,
    undergraduate_degree VARCHAR(100) NOT NULL,
    current_major ENUM('CS', 'IT', 'ECE', 'EE') NOT NULL,
    applying_for ENUM('Grader', 'Lab Instructor', 'Both') NOT NULL,
    international_student BOOLEAN NOT NULL,
    gta_certified BOOLEAN,
    gta_certification_term VARCHAR(50),
    gta_previous_degree BOOLEAN,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS students (
    id INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS faculty (
    id INT NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS courses (
    id VARCHAR(20) NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS positions (
    id INT NOT NULL AUTO_INCREMENT,
    student_id INT,
    faculty_id INT NOT NULL,
    course_id VARCHAR(20) NOT NULL,
    position_type ENUM('Grader', 'Lab Instructor', 'Both') NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (student_id) references students (id) ON DELETE RESTRICT,
    FOREIGN KEY (faculty_id) references faculty (id) ON DELETE RESTRICT,
    FOREIGN KEY (course_id) references courses (id) ON DELETE RESTRICT
);