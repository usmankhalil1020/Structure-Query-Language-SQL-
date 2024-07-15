CREATE DATABASE temp1;
DROP DATABASE temp1;
DROP DATABASE temp2;

CREATE DATABASE temp2;

CREATE DATABASE class;

DROP DATABASE college;

USE class;

CREATE TABLE student (
 id INT PRIMARY KEY,
 name VARCHAR(50),
 age INT NOT NULL
 );
 
INSERT INTO student  VALUES(1, "USMAN", 24);
INSERT INTO student VALUES(2, "UMAR", 22);
INSERT INTO student VALUES(3, "AMAN", 20);
INSERT INTO student VALUES(4, "AHAD", 29);
INSERT INTO student VALUES(5, "RAZA", 23);

SELECT * FROM student;

CREATE DATABASE class;
CREATE DATABASE IF NOT EXISTS class;
 
 CREATE DATABASE University;
 DROP DATABASE University;
 
 CREATE DATABASE University;
 CREATE DATABASE IF NOT EXISTS University;
 
 CREATE DATABASE IF NOT EXISTS university;
 
 DROP DATABASE IF EXISTS company;
 
 DROP DATABASE IF EXISTS university;
 
 SHOW DATABASES;
 
 SHOW TABLES;
 
 DROP TABLE student;
 
 CREATE TABLE candidates (
 rollno INT PRIMARY KEY,
 name VARCHAR(50),
 fathername VARCHAR(50)
 );
 
 SELECT * FROM candidates;
 
 INSERT INTO candidates
 (rollno, name, fathername)
 VALUES
 (101, "kamran", "ahmed"),
 (102, "ahsan", "arif"),
 (103, "raza", "amir");
 
 INSERT INTO candidates VALUES (104, "amir", "farooq");
 
 INSERT INTO candidates VALUES (105, "ali", "rizwi");
 
 CREATE DATABASE xyz_company;
 USE xyz_company;
 
 CREATE TABLE employee(
 id INT PRIMARY KEY,
 name VARCHAR(50),
 fathername VARCHAR(50),
 salary INT
 );
 
 INSERT INTO employee
 (id, name, fathername, salary)
 VALUES
 (1, "amir", "farooq", 25000),
 (2, "ahsan", "kamal", 36000),
 (3, "amir", "jamal", 41000);

SELECT * FROM employee;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
