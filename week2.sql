CREATE DATABASE comp2003;

USE comp2003;

CREATE TABLE contacts (
	name VARCHAR(25), 
    email VARCHAR(50),
    homeTown VARCHAR(85) 
);

INSERT INTO contacts (name, email, homeTown) VALUES ('Rich', 'rich@gc.ca', 'Toronto');

SELECT * FROM contacts;
SELECT email FROM contacts;

INSERT INTO contacts (name, email, hometown) VALUES
('Ralph', 'fubar@gc.ca', 'Vancouver'),
('Josh', '17@bills.com', 'Fresno');

INSERT INTO contacts (name, homeTown) VALUES ('Gerald', 'Barrie');

INSERT INTO contacts (name) VALUES (null);

DROP TABLE contacts;

CREATE TABLE contacts (
	name VARCHAR(25) NOT NULL, 
    email VARCHAR(50),
    homeTown VARCHAR(85) NOT NULL DEFAULT 'N/A'
);

INSERT INTO contacts (name) VALUES ('Mary');
INSERT INTO contacts (name, homeTown) VALUES ('Mary', 'Barrie');

CREATE TABLE table1
(name VARCHAR(10) DEFAULT 'none');
