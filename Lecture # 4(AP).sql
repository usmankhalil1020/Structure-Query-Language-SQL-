
DROP DATABASE college;

CREATE DATABASE college;
USE college;

CREATE TABLE dept (
id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE teacher (
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
);

CREATE TABLE dept (
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO dept
VALUES
(101, "English"),
(102, "URDU");

SELECT * FROM dept;

UPDATE dept
SET id = 103
WHERE id = 102;


CREATE TABLE teacher (
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
);


INSERT INTO teacher
VALUES
(101, "Salt", 101),
(102, "phil", 102);

SELECT * FROM teacher;


DROP TABLE teacher;
CREATE TABLE teacher (
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

DROP DATABASE college;
DROP TABLE student;

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

SELECT * FROM student;

ALTER TABLE student
ADD COLUMN age INT;

ALTER TABLE student
DROP COLUMN age;

ALTER TABLE student
ADD COLUMN grade VARCHAR(1) NOT NULL DEFAULT "B";

ALTER TABLE student
ADD COLUMN age INT NOT NULL DEFAULT 18;

SELECT * FROM student;

ALTER TABLE student
MODIFY COLUMN age VARCHAR(2);

ALTER TABLE student
CHANGE age stu_age INT;


INSERT INTO student
(rollno, name, marks, city, grade, stu_age)
VALUES
(107, "Karan", 81, "Lucknow", "C", 100);

SELECT * FROM student;

ALTER TABLE student
DROP COLUMN grade;

SELECT * FROM student;

ALTER TABLE student
RENAME TO stu;

SELECT * FROM stu;

ALTER TABLE stu
RENAME TO student;

TRUNCATE TABLE student;

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

SELECT * FROM student;

ALTER TABLE student
CHANGE name full_name VARCHAR(50);

SELECT * FROM student;

ALTER TABLE student
CHANGE grade result_grade VARCHAR(2);

SELECT * FROM student;

DELETE FROM student
WHERE marks < 70;

ALTER TABLE student
DROP COLUMN result_grade;

SELECT * FROM student;

DROP DATABASE college1;
DROP TABLE student;

CREATE DATABASE class;
USE class;

CREATE TABLE student1 (
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO student1
(id, name)
VALUES
(101, "Ram"),
(102, "Sham"),
(103, "Tom");

CREATE DATABASE course;
USE course;

CREATE TABLE course (
id INT PRIMARY KEY,
course VARCHAR(50)
);

INSERT INTO course
(id, course)
VALUES
("102", "english"),
(105, "Urdu"),
(103, "Pst"),
(107, "CS");

SELECT * FROM class;
SELECT * FROM course;

SELECT *
FROM class as cls
INNER JOIN course as co
ON cls.id = co.id;

SELECT *
FROM class as cls
LEFT JOIN course as co
ON cls.id = co.id;

SELECT *
FROM class as cls
RIGHT JOIN course as co
ON cls.id = co.id;

SELECT *
FROM class as cls
LEFT JOIN course as co
ON cls.id = co.id
UNION
SELECT * 
FROM class as cls
RIGHT JOIN course as co
ON cls.id = co.id;

SELECT *
FROM class as cls
LEFT JOIN course as co
ON cls.id = co.id
WHERE co.id IS NULL;

SELECT *
FROM class as cls
RIGHT JOIN course as co
ON cls.id = co.id
WHERE cls.id IS NULL;











































