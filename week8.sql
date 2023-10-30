USE comp2003;

-- Create students table
CREATE TABLE students (
    studentId INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(25),
    lastName VARCHAR(50),
    dateOfBirth DATE,
    major VARCHAR(100)
);

-- Insert 25 mock student records
INSERT INTO students (firstName, lastName, dateOfBirth, major)
VALUES
    ('Yakshi', 'Patel', '2000-01-15', 'Computer Science'),
    ('Jane', 'Smith', '2000-02-20', 'Mathematics'),
    ('Robert', 'Johnson', '1999-03-10', 'History'),
    ('Linda', 'Williams', '1999-04-05', 'Biology'),
    ('Michael', 'Brown', '2000-05-18', 'Physics'),
    ('Amir', 'Shah', '2001-06-30', 'Chemistry'),
    ('William', 'Jones', '2000-07-12', 'Psychology'),
    ('Jennifer', 'Moore', '2000-08-25', 'English'),
    ('Ji Sung', 'Park', '2000-09-19', 'Economics'),
    ('Mary', 'Pelletier', '1999-10-22', 'Sociology'),
    ('James', 'Wilson', '2000-11-03', 'Art'),
    ('Patricia', 'Martin', '2001-12-07', 'Music'),
    ('Amit', 'Singh', '1999-01-09', 'Chemical Engineering'),
    ('Susan', 'Hall', '2000-02-14', 'Mechanical Engineering'),
    ('Charles', 'Young', '2001-03-26', 'Electrical Engineering'),
    ('Tolu', 'Oltubi', '1999-04-08', 'Political Science'),
    ('Thomas', 'Tootoo', '2000-05-11', 'Geology'),
    ('Karen', 'Scott', '2000-06-29', 'Philosophy'),
    ('Kenta', 'Sasaki', '2001-07-18', 'Physics'),
    ('Nancy', 'Harris', '1999-08-27', 'Computer Science'),
    ('Paul', 'Baker', '2000-09-13', 'History'),
    ('Lisa', 'Garcia', '2001-10-07', 'Biology'),
    ('Mark', 'Martinez', '2000-11-29', 'Psychology'),
    ('Betty', 'Clark', '1999-12-31', 'Mathematics'),
    ('Donald', 'Rodriguez', '2001-02-02', 'Computer Engineering');
    
SELECT * FROM students;

/* add a new column */
ALTER TABLE students
ADD COLUMN age INT;

/* change the data type of an existing column */
ALTER TABLE students
MODIFY firstName VARCHAR(50);

/* check table structure using DESC */
DESC students;

/* change column  name */
ALTER TABLE students
RENAME COLUMN lastName TO surname;

/* can also rename a column using CHANGE */
/* CHANGE lastName surname VARCHAR(50) */

/* move a column position */
ALTER TABLE students
MODIFY COLUMN dateOfBirth DATE AFTER major;

/* rename the entire table */
RENAME TABLE students TO learners;

/* alternative to above */
ALTER TABLE learners
RENAME students;

SELECT * FROM learners;

/* remove a column */
ALTER TABLE students
DROP COLUMN age;

-- String Function Practice
-- UPPER: converts all characters to uppercase
SELECT UPPER(name) AS upperName FROM donuts;

-- LOWER: converts string to lowercase
SELECT LOWER(name) AS lowerName FROM donuts;

-- LTRIM: removes any leading spaces at the start of a string
INSERT INTO donuts (name, type, price, rating)
VALUES ('     Vanilla', 'ring', 1.50, 2);

SELECT * FROM donuts;

SELECT LTRIM(name) AS name FROM donuts;

-- RTRIM: removes any trailing spaces
INSERT INTO donuts (name, type, price, rating)
VALUES ('Strawberry    ', 'ring', 1.50, 3);

UPDATE donuts
SET name = RTRIM(name);

DESC donuts;

-- LENGTH: shows how long a string is in characters, including white space
SELECT LENGTH(name) FROM donuts;

-- SUBSTR: parses part of a string 
-- params: string to parse, what character to start at, how many characters to parse
SELECT SUBSTR(name, 1, 2) FROM donuts;

-- INSTR: parses a string for another string, returns what character the first occurence is found at
SELECT INSTR(name, 'a'), name FROM donuts;

-- REPLACE: replace all occurrences of a substring within a string with a new substring (case-sensitive)
-- params: original string, target to find, replacement value
UPDATE donuts SET type = REPLACE(type, 'fill', 'stuff');

SELECT * FROM donuts;

-- Create employees table
CREATE TABLE employees (
    employeeId INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(100),
    hireDate DATE,
    department VARCHAR(50)
);

-- Insert 25 mock employee records
INSERT INTO employees (employeeId, firstName, lastName, email, hireDate, department)
VALUES
    (1, 'John', 'Doe', 'johndoe@example.com', '2022-01-01', 'HR'),
    (2, 'Jane', 'Smith', 'janesmith@example.com', '2022-01-02', 'IT'),
    (3, 'Robert', 'Johnson', 'robertjohnson@example.com', '2022-01-03', 'Finance'),
    (4, 'Linda', 'Williams', 'lindawilliams@example.com', '2022-01-04', 'Sales'),
    (5, 'Michael', 'Brown', 'michaelbrown@example.com', '2022-01-05', 'HR'),
    (6, 'Emily', 'Davis', 'emilydavis@example.com', '2022-01-06', 'IT'),
    (7, 'William', 'Jones', 'williamjones@example.com', '2022-01-07', 'Finance'),
    (8, 'Jennifer', 'Moore', 'jennifermoore@example.com', '2022-01-08', 'Sales'),
    (9, 'David', 'Taylor', 'davidtaylor@example.com', '2022-01-09', 'HR'),
    (10, 'Mary', 'Anderson', 'maryanderson@example.com', '2022-01-10', 'IT'),
    (11, 'James', 'Wilson', 'jameswilson@example.com', '2022-01-11', 'Finance'),
    (12, 'Patricia', 'Martin', 'patriciamartin@example.com', '2022-01-12', 'Sales'),
    (13, 'Richard', 'Lee', 'richardlee@example.com', '2022-01-13', 'HR'),
    (14, 'Susan', 'Hall', 'susanhall@example.com', '2022-01-14', 'IT'),
    (15, 'Charles', 'Young', 'charlesyoung@example.com', '2022-01-15', 'Finance'),
    (16, 'Jessica', 'King', 'jessicaking@example.com', '2022-01-16', 'Sales'),
    (17, 'Thomas', 'Adams', 'thomasadams@example.com', '2022-01-17', 'HR'),
    (18, 'Karen', 'Scott', 'karenscott@example.com', '2022-01-18', 'IT'),
    (19, 'Daniel', 'Turner', 'danielturner@example.com', '2022-01-19', 'Finance'),
    (20, 'Nancy', 'Harris', 'nancyharris@example.com', '2022-01-20', 'Sales'),
    (21, 'Paul', 'Baker', 'paulbaker@example.com', '2022-01-21', 'HR'),
    (22, 'Lisa', 'Garcia', 'lisagarcia@example.com', '2022-01-22', 'IT'),
    (23, 'Mark', 'Martinez', 'markmartinez@example.com', '2022-01-23', 'Finance'),
    (24, 'Betty', 'Clark', 'bettyclark@example.com', '2022-01-24', 'Sales'),
    (25, 'Donald', 'Rodriguez', 'donaldrodriguez@example.com', '2022-01-25', 'HR');
    
-- last names converted to all uppercase
SELECT UPPER(lastName) AS upperLastName FROM employees;

-- first names converted to all lowercase
SELECT LOWER(firstName) FROM employees;

-- first 3 characters of each first name
SELECT SUBSTR(firstName, 1, 3) FROM employees;

-- length of each last name
SELECT LENGTH(lastName), lastName FROM employees;

-- replace department values 'IT' with 'Tech'
SELECT REPLACE(department, 'IT', 'Tech') FROM employees;

-- all employees whose last names start with 'M'
SELECT lastName FROM employees WHERE INSTR(lastName, 'M') = 1;
SELECT lastName FROM employees WHERE SUBSTR(lastName, 1, 1) = 'M';