
CREATE DATABASE temp1;

USE temp1;

CREATE TABLE temp1 (
id INT UNIQUE
);

INSERT INTO temp1 VALUES (101);

SELECT * FROM temp1;

CREATE DATABASE employee;

USE employee;

CREATE TABLE employee(
id INT,
salary INT DEFAULT 25000
);

INSERT INTO employee (id) VALUES (101);
SELECT * FROM employee;


CREATE DATABASE company;
USE company;

CREATE TABLE company(
id INT PRIMARY KEY,
salary INT DEFAULT 35000
);
INSERT INTO company (id) VALUES (102);
SELECT * FROM company;

DROP DATABASE college;
DROP DATABASE CLASS;
DROP DATABASE employee;
DROP DATABASE temp1;
DROP DATABASE university;
DROP DATABASE xyz_company;
DROP DATABASE college;

SELECT * FROM world;

CREATE DATABASE college;
USE college;

CREATE TABLE student (
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student
(rollno, name, marks, grade,  city)
VALUES
(101, "AMAN", 65, "B", "Pune"),
(102, "MUNEEB", 74, "A", "Karachi"),
(103, "ANUS", 54, "C", "Karachi"),
(104, "ARIF", 87, "A", "Pune"),
(105, "ASIF", 45, "D", "Peshawar");

SELECT * FROM student;


SELECT name, marks FROM student;

SELECT name, rollno, marks FROM student;

SELECT * FROM student;

DROP DATABASE college;


CREATE DATABASE college;
USE college;

CREATE TABLE student (
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(101, "AMAN", 47, "D", "KARACHI"),
(102, "AHMED", 54, "C", "LAHORE"),
(103, "AHSAN", 69, "B", "LAHORE"),
(104, "SARA", 74, "A", "KARACHI"),
(105, "SANA", 79, "A", "PUNE");

SELECT rollno, marks, grade FROM student;

SELECT * FROM student;

SELECT city FROM student;

SELECT DISTINCT city FROM student;

SELECT * FROM student WHERE marks > 70;

SELECT *
FROM student 
WHERE marks > 60;

SELECT * FROM student WHERE city = "KARACHI";

SELECT *
FROM student
WHERE city = "LAHORE";

SELECT * FROM student WHERE marks > 70 AND city = "LAHORE";

SELECT *
FROM student
WHERE marks > 60 AND city = "KARACHI";

SELECT * FROM student WHERE marks + 30 > 100;

SELECT *
FROM student
WHERE marks + 10 > 70;

SELECT * FROM student WHERE marks = 73;

SELECT *
FROM student
WHERE marks > 65;

SELECT * FROM student WHERE marks > 60 AND city = "KARACHI";

SELECT *
FROM student
WHERE marks > 60 OR city = "KARACHI";


SELECT * FROM student WHERE marks BETWEEN 60 AND 70;

SELECT * 
FROM student
WHERE city IN ("KARACHI","LAHORE");

SELECT * FROM student WHERE city NOT IN ("KARACHI", "LAHORE");

SELECT * 
FROM student
LIMIT 3;

SELECT *
FROM student
WHERE marks > 60
LIMIT 3;

SELECT * FROM student ORDER BY city ASC;

SELECT * FROM student ORDER BY marks ASC;

SELECT * FROM student ORDER BY name ASC;

SELECT * 
FROM student
ORDER BY marks DESC;

SELECT *
FROM student 
ORDER BY marks DESC
LIMIT 3;

SELECT marks
FROM student;

SELECT MAX(marks)
FROM student;

SELECT MIN(marks) FROM student;

SELECT AVG(marks) FROM student;

SELECT COUNT(rollno) FROM student;

SELECT city
FROM student
GROUP BY city;

SELECT city, count(rollno)
FROM student 
GROUP BY city;

SELECT city, count(name)
FROM student
GROUP BY city;

SELECT city, name, count(rollno)
FROM student
GROUP BY city, name;

SELECT city, name, grade, count(rollno)
FROM student
GROUP BY city, name, grade;

SELECT city, marks, grade, count(rollno)
FROM student
GROUP BY city, marks, grade;

SELECT city, avg(marks)
FROM student
GROUP BY city;

SELECT city, avg(marks)
FROM student
GROUP BY city
ORDER BY city;

SELECT city, avg(marks)
FROM student
GROUP BY city
ORDER BY avg(marks);

SELECT city, avg(marks)
FROM student
GROUP BY city
ORDER BY avg(marks) DESC;



















