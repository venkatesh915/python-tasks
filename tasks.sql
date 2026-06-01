

CREATE DATABASE college;

CREATE TABLE Departments(Department_ID SERIAL PRIMARY KEY, Department_Name VARCHAR(100), Department_HOD VARCHAR(100) );

INSERT INTO Departments (Department_Name,Department_HOD)  VALUES ('ECE','Anil'),('CSE','Kumar'),('MECH','Raju'),('CIVIL','Ramesh'),('IT','Venkatesh');

SELECT * FROM Departments;

CREATE TABLE Students (
    Student_id SERIAL PRIMARY KEY,
    Student_name VARCHAR(100),
    Student_age INT,
    Gender VARCHAR(10),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Department_id INT,
    FOREIGN KEY (Department_id)
    REFERENCES Departments(Department_ID)
);

INSERT INTO Students
(Student_name, Student_age, Gender, Email, Phone, Department_id)
VALUES
('Rahul', 20, 'Male', 'rahul1@gmail.com', '9876543210', 1),
('Anjali', 21, 'Female', 'anjali2@gmail.com', '9876543211', 2),
('Kiran', 22, 'Male', 'kiran3@gmail.com', '9876543212', 3),
('Sneha', 19, 'Female', 'sneha4@gmail.com', '9876543213', 4),
('Arjun', 20, 'Male', 'arjun5@gmail.com', '9876543214', 5),
('Priya', 21, 'Female', 'priya6@gmail.com', '9876543215', 1),
('Vamsi', 22, 'Male', 'vamsi7@gmail.com', '9876543216', 2),
('Keerthi', 20, 'Female', 'keerthi8@gmail.com', '9876543217', 3),
('Naveen', 23, 'Male', 'naveen9@gmail.com', '9876543218', 4),
('Divya', 19, 'Female', 'divya10@gmail.com', '9876543219', 5),
('Sai', 21, 'Male', 'sai11@gmail.com', '9876543220', 1),
('Pooja', 20, 'Female', 'pooja12@gmail.com', '9876543221', 2),
('Manoj', 22, 'Male', 'manoj13@gmail.com', '9876543222', 3),
('Lavanya', 21, 'Female', 'lavanya14@gmail.com', '9876543223', 4),
('Rakesh', 23, 'Male', 'rakesh15@gmail.com', '9876543224', 5),
('Meena', 20, 'Female', 'meena16@gmail.com', '9876543225', 1),
('Ajay', 22, 'Male', 'ajay17@gmail.com', '9876543226', 2),
('Bhavana', 19, 'Female', 'bhavana18@gmail.com', '9876543227', 3),
('Tarun', 21, 'Male', 'tarun19@gmail.com', '9876543228', 4),
('Siri', 20, 'Female', 'siri20@gmail.com', '9876543229', 5);

SELECT * FROM Students;

CREATE TABLE Teachers (
    Teacher_id SERIAL PRIMARY KEY,
    Teacher_name VARCHAR(100),
    Subject VARCHAR(100),
    Salary INT,
    Department_id INT,
    FOREIGN KEY (Department_id)
    REFERENCES Departments(Department_ID)
);

INSERT INTO Teachers
(Teacher_name, Subject, Salary, Department_id)
VALUES
('Ravi', 'Maths', 50000, 1),
('Suresh', 'Physics', 55000, 2),
('Anitha', 'Chemistry', 60000, 3),
('Kavya', 'English', 45000, 4),
('Pradeep', 'Computer Science', 70000, 5),
('Manoj', 'Biology', 52000, 1),
('Deepa', 'Statistics', 58000, 2),
('Harish', 'Electronics', 62000, 3),
('Swathi', 'Mechanical Design', 54000, 4),
('Kiran', 'Data Structures', 75000, 5);

SELECT * FROM Teachers;


CREATE TABLE Courses (
    Course_id SERIAL PRIMARY KEY,
    Course_name VARCHAR(100),
    Course_duration VARCHAR(50),
    Course_fee INT
);

INSERT INTO Courses
(Course_name, Course_duration, Course_fee)
VALUES
('Python Full Stack', '6 Months', 50000),
('Data Science', '8 Months', 70000),
('Java Full Stack', '6 Months', 55000),
('Machine Learning', '5 Months', 65000),
('Cloud Computing', '4 Months', 60000),
('Cyber Security', '6 Months', 75000),
('Artificial Intelligence', '8 Months', 80000),
('Web Development', '5 Months', 45000);

SELECT * FROM Courses;

CREATE TABLE Enrollments (
    Enrollment_id SERIAL PRIMARY KEY,
    Student_id INT,
    Course_id INT,
    Enrollment_date DATE,
    FOREIGN KEY (Student_id)
    REFERENCES Students(Student_id),
    FOREIGN KEY (Course_id)
    REFERENCES Courses(Course_id)
);

INSERT INTO Enrollments
(Student_id, Course_id, Enrollment_date)
VALUES
(1, 1, '2026-01-10'),
(1, 2, '2026-01-12'),
(2, 2, '2026-01-13'),
(2, 3, '2026-01-14'),
(3, 1, '2026-01-15'),
(3, 4, '2026-01-16'),
(4, 5, '2026-01-17'),
(4, 6, '2026-01-18'),
(5, 3, '2026-01-19'),
(5, 7, '2026-01-20'),
(6, 8, '2026-01-21'),
(6, 1, '2026-01-22'),
(7, 2, '2026-01-23'),
(7, 5, '2026-01-24'),
(8, 6, '2026-01-25'),
(8, 4, '2026-01-26'),
(9, 3, '2026-01-27'),
(10, 7, '2026-01-28'),
(11, 8, '2026-01-29'),
(12, 1, '2026-01-30'),
(13, 2, '2026-02-01'),
(14, 3, '2026-02-02'),
(15, 4, '2026-02-03'),
(16, 5, '2026-02-04'),
(17, 6, '2026-02-05'),
(18, 7, '2026-02-06'),
(19, 8, '2026-02-07'),
(20, 1, '2026-02-08'),
(10, 2, '2026-02-09'),
(15, 6, '2026-02-10');

SELECT * FROM Enrollments;


CREATE TABLE Attendance (
    Attendance_id SERIAL PRIMARY KEY,
    Student_id INT,
    Attendance_date DATE,
    Status VARCHAR(10),
    FOREIGN KEY (Student_id)
    REFERENCES Students(Student_id)
);
INSERT INTO Attendance (Student_id, Attendance_date, Status)
VALUES
(1, '2026-01-01', 'Present'),
(2, '2026-01-01', 'Absent'),
(3, '2026-01-01', 'Present'),
(4, '2026-01-01', 'Present'),
(5, '2026-01-01', 'Absent'),
(6, '2026-01-01', 'Present'),
(7, '2026-01-01', 'Present'),
(8, '2026-01-01', 'Absent'),
(9, '2026-01-01', 'Present'),
(10, '2026-01-01', 'Present'),

(11, '2026-01-01', 'Present'),
(12, '2026-01-01', 'Absent'),
(13, '2026-01-01', 'Present'),
(14, '2026-01-01', 'Present'),
(15, '2026-01-01', 'Absent'),
(16, '2026-01-01', 'Present'),
(17, '2026-01-01', 'Present'),
(18, '2026-01-01', 'Absent'),
(19, '2026-01-01', 'Present'),
(20, '2026-01-01', 'Present'),

(1, '2026-01-02', 'Present'),
(2, '2026-01-02', 'Present'),
(3, '2026-01-02', 'Absent'),
(4, '2026-01-02', 'Present'),
(5, '2026-01-02', 'Present'),
(6, '2026-01-02', 'Absent'),
(7, '2026-01-02', 'Present'),
(8, '2026-01-02', 'Present'),
(9, '2026-01-02', 'Absent'),
(10, '2026-01-02', 'Present'),

(11, '2026-01-02', 'Present'),
(12, '2026-01-02', 'Absent'),
(13, '2026-01-02', 'Present'),
(14, '2026-01-02', 'Present'),
(15, '2026-01-02', 'Present'),
(16, '2026-01-02', 'Absent'),
(17, '2026-01-02', 'Present'),
(18, '2026-01-02', 'Present'),
(19, '2026-01-02', 'Present'),
(20, '2026-01-02', 'Absent'),

(1, '2026-01-03', 'Present'),
(2, '2026-01-03', 'Present'),
(3, '2026-01-03', 'Present'),
(4, '2026-01-03', 'Absent'),
(5, '2026-01-03', 'Present'),
(6, '2026-01-03', 'Present'),
(7, '2026-01-03', 'Absent'),
(8, '2026-01-03', 'Present'),
(9, '2026-01-03', 'Present'),
(10, '2026-01-03', 'Absent');

SELECT * FROM Attendance;


CREATE TABLE Marks (
    Mark_id SERIAL PRIMARY KEY,
    Student_id INT,
    Subject VARCHAR(100),
    Marks INT,
    FOREIGN KEY (Student_id)
    REFERENCES Students(Student_id)
);

INSERT INTO Marks (Student_id, Subject, Marks)
VALUES
(1, 'Maths', 85),
(2, 'Physics', 78),
(3, 'Chemistry', 92),
(4, 'English', 74),
(5, 'Computer', 88),
(6, 'Maths', 90),
(7, 'Physics', 66),
(8, 'Chemistry', 81),
(9, 'English', 75),
(10, 'Computer', 95),

(11, 'Maths', 70),
(12, 'Physics', 60),
(13, 'Chemistry', 89),
(14, 'English', 77),
(15, 'Computer', 83),
(16, 'Maths', 91),
(17, 'Physics', 69),
(18, 'Chemistry', 84),
(19, 'English', 73),
(20, 'Computer', 87),

(1, 'Physics', 80),
(2, 'Chemistry', 76),
(3, 'English', 88),
(4, 'Computer', 91),
(5, 'Maths', 79),
(6, 'Physics', 85),
(7, 'Chemistry', 72),
(8, 'English', 90),
(9, 'Computer', 68),
(10, 'Maths', 94),

(11, 'Physics', 75),
(12, 'Chemistry', 82),
(13, 'English', 86),
(14, 'Computer', 78),
(15, 'Maths', 88),
(16, 'Physics', 92),
(17, 'Chemistry', 70),
(18, 'English', 79),
(19, 'Computer', 85),
(20, 'Maths', 96),

(1, 'Chemistry', 87),
(2, 'English', 83),
(3, 'Computer', 90),
(4, 'Maths', 76),
(5, 'Physics', 81);

INSERT INTO Marks (Student_id, Subject, Marks)
VALUES
(6, 'Chemistry', 84),
(7, 'English', 77),
(8, 'Computer', 93),
(9, 'Maths', 80),
(10, 'Physics', 88);
SELECT * FROM Marks;

-- commands 
-- commands
--commands

SELECT * FROM Students;

--Display names and emails
SELECT Student_name, Email FROM Students;

-- 3. Students older than 20

SELECT * FROM Students
WHERE Student_age > 20;

-- 4. female students
SELECT * FROM Students
WHERE Gender = 'Female'; 

--5. sort by age
 SELECT * FROM Students
 ORDER BY Student_age DESC;

 --6. TOP 5 
 SELECT * FROM Students
 LIMIT 5;
 --7. students from CSE department

SELECT s.*
FROM Students s
JOIN Departments d
ON s.Department_id = d.Department_ID
WHERE d.Department_Name = 'CSE';

-- more than 50k
-- 10k to 30k
SELECT * FROM Courses
WHERE Course_fee BETWEEN 10000 AND 30000;

--update mail
UPDATE Students
SET Email = 'newmail@gmail.com'
WHERE Student_id = 1;

-- salary by 10%+
UPDATE Teachers
SET Salary = Salary * 1.10;

--12, Delete discontinued students


DELETE FROM Students
WHERE Student_id NOT IN (SELECT Student_id FROM Enrollments);

--total students

SELECT COUNT(*) FROM Students;

-- avg salry of teachers

SELECT AVG(Salary) FROM Teachers;

-- highest marks

SELECT MAX(Marks) FROM Marks;

-- min course fee
SELECT MIN(Course_fee) FROM Courses;

--count student per deoartments
SELECT Department_id, COUNT(*) AS total_Students
FROM Students
GROUP BY Department_id;

-- Average marks per subject

SELECT Subject, AVG(Marks)
FROM Marks
GROUP BY Subject;

--Students per course
SELECT Course_id, COUNT(*) AS total_students
FROM Enrollments
GROUP BY Course_id;

--20. Departments with more than 5 students

SELECT Department_id, COUNT(*) AS total
FROM Students
GROUP BY Department_id
HAVING COUNT(*) > 5;

--Students with department names

SELECT s.Student_name, d.Department_Name
FROM Students s
JOIN Departments d
ON s.Department_id = d.Department_ID;

-- ENEnrollments with course names

SELECT e.Enrollment_id, c.Course_name
FROM Enrollments e
JOIN Courses c
ON e.Course_id = c.Course_id;

--Marks with student names

SELECT m.Marks, s.Student_name
FROM Marks m
JOIN Students s
ON m.Student_id = s.Student_id;

-- 24 Teachers with department names

SELECT t.Teacher_name,d.Department_Name
FROM Teachers t
JOIN Departments d
ON t.Department_id = d.Department_ID

--25. Students above average marks

SELECT *
FROM Marks
WHERE Marks > (SELECT AVG(Marks) FROM Marks);

-- Department with max students

SELECT Department_id, COUNT(*) AS total
FROM Students
GROUP BY Department_id
ORDER BY total DESC
LIMIT 1;

--27. Absent count

SELECT COUNT(*)
FROM Attendance
WHERE Status='Absent';

--28. Courses with 0 enrollments

SELECT c.Course_id, c.Course_name
FROM Courses c
LEFT JOIN Enrollments e
ON c.Course_id = e.Course_id
WHERE e.Course_id IS NULL;





