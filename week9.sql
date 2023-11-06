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

-- GROUPING PRACTICE
-- average price of all donuts
SELECT AVG(price) FROM donuts;

-- average price for each type of donut
SELECT AVG(price), type FROM donuts GROUP BY type;

-- avg price per type sorted a-z
SELECT AVG(price), type FROM donuts GROUP BY type ORDER BY AVG(price);

-- can we move ORDER BY before GROUP BY?  NOPE!  GROUP BY MUST COME FIRST!
-- SELECT AVG(price), type FROM donuts ORDER BY AVG(price) GROUP BY type;

-- what is the lowest rating?
SELECT MIN(rating) FROM donuts;

-- what is the highest rating?
SELECT MAX(rating) FROM donuts;

-- how many donuts have no rating?
SELECT COUNT(name) FROM donuts WHERE rating IS NULL;

-- how many students in each major?
SELECT COUNT(major), major FROM students GROUP BY major;

-- How many orders are there for each delivery option?
SELECT deliveryOption, COUNT(orderId) FROM orders GROUP BY deliveryOption;

-- What is the total revenue for each payment type?
SELECT SUM(orderTotal), paymentType FROM orders GROUP BY paymentType;

-- the single biggest order?
SELECT MAX(orderTotal), orderId FROM orders GROUP BY orderId LIMIT 1;

-- subquery to show both aggregate and individual data
SELECT * FROM orders
WHERE orderTotal = (SELECT MAX(orderTotal) FROM orders); 

-- alternative: use ORDER BY DESC + LIMIT:
SELECT * FROM orders ORDER BY orderTotal DESC LIMIT 1;

-- What’s the average cost of an order for each payment type
SELECT AVG(orderTotal), paymentType FROM orders GROUP BY paymentType;

-- What’s the average age of all students?
SELECT AVG(age) FROM students;

-- What’s the average age of all students in each department?
SELECT major, AVG(age) FROM students GROUP BY major ORDER BY AVG(age) DESC, major;

-- Who is the youngest student?
SELECT * FROM students ORDER BY dateOfBirth DESC LIMIT 1;