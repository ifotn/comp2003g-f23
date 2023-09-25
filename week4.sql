USE comp2003;

/* use LIMIT to select only a specified number of records */
SELECT * FROM donuts LIMIT 3;

/* try the Microsoft SQL Server syntax here instead */
/* SELECT TOP 3 * FROM donuts; -- this does not work in MySQL */

/* populate the db with more records */
INSERT INTO donuts (name, type) VALUES ('honey dip', 'ring');

INSERT INTO donuts (name, type, price, rating) VALUES ('vanilla', 'ring', 1.50, 2);

INSERT INTO donuts (name, type, price, rating) VALUES ('walnut crunch', 'cruller', 2.00, 3);

INSERT INTO donuts (name, type, price, rating) VALUES ('blueberry', 'filled', 2.50, 4);

INSERT INTO donuts (name, type, rating) VALUES ('plain', 'ring', 1);

INSERT INTO donuts (name, type, price, rating) VALUES ('blueberry', 'filled', 3, 4);

INSERT INTO donuts (name, type, price, rating) VALUES ('blueberry', 'filled', 3, 4);

INSERT INTO donuts (name, type, price, rating) VALUES ('glazed', 'cruller', 2, 3);

SELECT * FROM donuts;

/* DELETE practice */
/* try deleting:
- blueberry priced 3.00
- without a rating
- rated below 3
- all crullers except apple fritter
*/
DELETE FROM donuts WHERE name = 'plain';
DELETE FROM donuts WHERE name = 'blueberry' AND price = 3.00;
SELECT * FROM donuts WHERE rating IS NULL;
DELETE FROM donuts WHERE rating IS NULL;
DELETE FROM donuts WHERE rating < 3;
DELETE FROM donuts WHERE type = 'cruller' AND name <> 'apple fritter';

/* make some updates */
/*
•	Ring donuts are 1.00
•	Crullers are 2.00
•	Filled are 1.50
•	Donuts with a rating of 4 or 5 are 2.50
•	All ratings are going to be increased by 1 star
•	Set any doughnut with a rating below 4 back to null
*/
UPDATE donuts SET price = 1.00 WHERE type = 'ring';
UPDATE donuts SET price = 2.00 WHERE type = 'cruller';
UPDATE donuts SET price = 1.50 WHERE type = 'filled';
UPDATE donuts SET price = 2.50 WHERE rating >= 4;
UPDATE donuts SET rating = rating + 1 WHERE rating < 5;
UPDATE donuts SET rating = NULL WHERE rating < 4;
