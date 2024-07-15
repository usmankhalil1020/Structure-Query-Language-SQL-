
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

SELECT grade, count(rollno)
FROM student
GROUP BY grade
ORDER BY grade;

SELECT grade, count(city)
FROM student
GROUP BY grade
ORDER BY grade;

SELECT city
FROM student
GROUP BY city;

SELECT city, count(rollno)
FROM student
GROUP BY city;

SELECT city, count(rollno)
FROM student
GROUP BY city
HAVING MAX(marks) > 70;

SELECT city
FROM student
WHERE grade = "A"
GROUP BY city;

SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) > 70;

SELECT city
FROM student
WHERE grade = "A"
GROUP BY city
HAVING MAX(marks) >=73
ORDER BY city ASC;

SET SQL_SAFE_UPDATES = 0;

UPDATE student
SET grade = "o"
WHERE grade = "A";

SELECT * FROM student;

UPDATE student
SET grade = "P"
WHERE grade = "C";

SELECT * FROM student;

UPDATE student
SET marks = 69
WHERE rollno = 105;

SELECT * FROM student;

UPDATE student
SET marks = 50
WHERE rollno = 101;

SELECT * FROM student;

UPDATE student
SET city = "Hyderabad"
WHERE rollno = 102;

SELECT * FROM student;

UPDATE student
SET name = "Arfa"
WHERE rollno = 103;

SELECT * FROM student;

UPDATE student
SET grade = "B"
WHERE marks BETWEEN 70 AND 75;

SELECT * FROM student;

UPDATE student
SET marks = marks + 5;

SELECT * FROM student;

DELETE FROM student
WHERE marks < 60;

SELECT * FROM student;





