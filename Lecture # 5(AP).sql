DROP DATABASE class;
DROP DATABASE college;
DROP DATABASE COURSE;

CREATE DATABASE bank;
USE bank;

CREATE TABLE employee (
id INT PRIMARY KEY,
name VARCHAR(50),
manager_id INT
);

INSERT INTO employee
(id, name, manager_id)
VALUES
(101, "adam", 103),
(102, "bob", 104),
(103, "casey", NULL),
(104, "donald", 103);

SELECT * FROM employee;

SELECT *
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

SELECT a.name, b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

SELECT a.name as manager_name, b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

SELECT name FROM employee
UNION
SELECT name FROM employee;

SELECT name FROM employee
UNION ALL
SELECT name FROM employee;

CREATE DATABASE college;
USE college;

CREATE TABLE student (
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(2),
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

SELECT * FROM student;

SELECT AVG(marks)
FROM student;

SELECT name
FROM student
WHERE marks > 64.6000;

SELECT name, marks
FROM student
WHERE marks > 64.6000;

SELECT name, marks
FROM student
WHERE marks > (SELECT AVG(marks) FROM student);


SELECT rollno
FROM student
WHERE rollno % 2 = 0;

SELECT name, rollno
FROM student
WHERE rollno IN (102,104);

SELECT name, rollno
FROM student
WHERE rollno IN (
   SELECT rollno
   FROM student
   WHERE rollno % 2 = 0);


SELECT *
FROM student
WHERE city = "Lahore";

SELECT MAX(marks)
FROM (SELECT * FROM student WHERE city = "Lahore") AS temp;

SELECT MAX(marks)
FROM student
WHERE city = "Karachi";

CREATE VIEW view1 AS
SELECT rollno, name, marks FROM student;

SELECT * FROM view1;

CREATE VIEW view2 AS
SELECT name, rollno, marks, grade FROM student;

SELECT * FROM view2;

CREATE VIEW view3 AS
SELECT rollno, city FROM student;

SELECT * FROM view3;

CREATE VIEW view4 AS 
SELECT rollno, name, marks, grade FROM student;

SELECT * FROM view4
WHERE marks > 60;







