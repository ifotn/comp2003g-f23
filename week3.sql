USE comp2003;

DROP TABLE contacts;

CREATE TABLE contacts
(
	firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(50),
    job VARCHAR(50),
    websites TEXT
);

INSERT INTO contacts (firstName, lastName, email, job, websites)
VALUES ('Harry', 'Parrahands', 'harry@example.com', 'Developer', 'https://reddit.com, https://google.ca');

INSERT INTO contacts (firstName, lastName, email, job, websites)
VALUES ('Mary', 'Berry', 'mary@example.com', 'Designer', 'https://reddit.com', 'https://google.ca');

INSERT INTO contacts (firstName, lastName, email, job, websites)
VALUES ('Seamus', "O'Reilly", 'sr@domain.com', 'Writer', 'https://x.com');

INSERT INTO contacts (firstName, lastName, email, job, websites)
VALUES ('Patrick', 'O\'Reilly', 'pr@domain.com', 'Musician', 'https://x.com');

INSERT INTO contacts (firstName, lastName, email, job, websites)
VALUES ('Maggie', `O'Reilly`, 'mr@domain.com', 'CEO', 'https://x.com');

INSERT INTO contacts (firstName, lastName, email, job, websites)
VALUES ('Colin', 'O''Reilly', 'cr@domain.com', 'Musician', 'https://x.com');

DROP TABLE donuts;

CREATE TABLE donuts (
	name VARCHAR(50) NOT NULL,
    type VARCHAR(15) NOT NULL,
    price DEC(5,2) NOT NULL DEFAULT 2.99,
    rating INT
);

INSERT INTO donuts (name, type, price, rating)
VALUES 
('maple', 'ring', 2.99, 5),
('apple fritter', 'cruller', 2.00, 3),
('chocolate', 'ring', 2.00, NULL),
('caramel', 'ring', 2.50, 4),
('jelly', 'filled', 1.50, NULL);

INSERT INTO donuts (name, type, rating)
VALUES ('glazed', 'ring', 3);

SELECT * FROM donuts;

SELECT * FROM donuts WHERE name = 'apple fritter';
SELECT * FROM donuts WHERE Name = 'apple fritter';
SELECT * FROM donuts WHERE name = 'Apple fritter';

SELECT * FROM donuts WHERE name = 'apple';
SELECT * FROM donuts WHERE type = 'ring' AND price = 2.00;
SELECT * FROM donuts WHERE type = 'ring' OR price = 2.00;
SELECT * FROM donuts WHERE type = 'ring' AND price < 2.50;
SELECT * FROM donuts WHERE type <> 'cruller';
SELECT * FROM donuts WHERE name LIKE 'j%';
SELECT * FROM donuts WHERE price BETWEEN 1.50 AND 2.00;
SELECT * FROM donuts WHERE name = 'maple' OR name = 'caramel';
SELECT * FROM donuts WHERE rating IS NULL;
SELECT * FROM donuts WHERE rating IS NOT NULL;






