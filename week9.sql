USE comp2003;

SELECT * FROM donuts ORDER BY rating;

UPDATE students SET firstName = 'mary' WHERE studentId = 5;

SELECT * FROM students ORDER BY firstName;

-- donuts: cheapest to most expensive
SELECT * FROM donuts ORDER BY price;

-- donuts: most expensive to cheapest
SELECT * FROM donuts ORDER BY price DESC;

-- create a duplicate student last name
UPDATE students SET surname = 'Clark' WHERE studentId = 3;

-- check what is the secondary order when we sort on a column with duplicate values?
SELECT * FROM students ORDER BY surname;

-- explicitly sort by 2 columns: surname then firstName
SELECT * FROM students ORDER BY surname, firstName;

-- reorder columns in the 2 column sort query
SELECT surname, firstName, studentId, major, dateOfBirth FROM students ORDER BY surname, firstName;

-- now sort by 3 columns in order: major, surname, firstName and also display the results in this order.  
-- Don't show studentId or dateOfBirth
SELECT major, surname, firstName FROM students
ORDER BY major, surname, firstName;

-- sort youngest to oldest, then by major => show all columns and reorder to match sorting
SELECT dateOfBirth, major, studentId, firstName, surname
FROM students ORDER BY dateOfBirth DESC, major;

-- add 1 more Clark to ensure they display after the 2 existing Clarks
INSERT INTO students (firstName, surname, major, dateOfBirth)
VALUES ('Adam', 'Clark', 'History', '2002-05-27');

-- USE DATEDIFF() to calculate all students ages and update all records
UPDATE students SET age = ROUND(DATEDIFF('2023-11-06', dateOfBirth)/365, 0)
WHERE studentId < 27;