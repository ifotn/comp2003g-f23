USE comp2003;

/*build the tables*/
CREATE TABLE brewers (
brewerId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL);

CREATE TABLE cases (
caseId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
size INT NOT NULL);

CREATE TABLE beers (
beerId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
brewerId INT NOT NULL,
FOREIGN KEY (brewerId) REFERENCES brewers(brewerId));

CREATE TABLE beerCases (
beerCaseId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
caseId INT NOT NULL,
beerId INT NOT NULL,
price DECIMAL(4,2) NOT NULL,
FOREIGN KEY (caseId) REFERENCES cases(caseId),
FOREIGN KEY (beerId) REFERENCES beers(beerId));

CREATE TABLE sales (
salesId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
date DATE NOT NULL,
beerCaseId INT NOT NULL,
quantity INT NOT NULL,
price DECIMAL(4,2),
FOREIGN KEY (beerCaseId) REFERENCES beerCases(beerCaseId));

USE comp2003;

INSERT INTO brewers (name) VALUES ('Molson'), ('Labatt'), ('Miller'), ('Muskoka');

INSERT INTO cases (size) VALUES (6), (12), (24);

INSERT INTO beers (name, brewerId) VALUES
('Canadian', 1),
('Export', 1),
('Blue', 2),
('50', 2),
('High Life', 3),
('Lite', 3),
('Cream Ale', 4),
('Premium Lager', 4);

INSERT INTO beerCases (caseId, beerId, price) VALUES
(1, 1, 10.50), (2, 1, 20.50), (3, 1, 37.95), 
(1, 2, 11.00), (2, 2, 19.95), (3, 2, 33.95), 
(1, 3, 9.95), (2, 3, 18.50), (3, 3, 32.95), 
(2, 4, 21.95), (3, 4, 41.50), 
(2, 5, 16.95), (3, 5, 29.70), 
(2, 6, 20.95), (3, 6, 38.95), 
(1, 7, 11.95), (2, 7, 24.95), (3, 7, 44.95), 
(1, 8, 12.95), (2, 8, 23.95), (3, 8, 43.95); 

INSERT INTO sales (date, beerCaseId, quantity, price) VALUES 
('2012-03-15', 1, 1, 10.50),
('2012-03-15', 2, 1, 20.50),
('2012-03-15', 3, 2, 37.95),
('2012-03-16', 5, 1, 19.95),
('2012-03-16', 6, 2, 33.95),
('2012-03-16', 7, 1, 9.95),
('2012-03-16', 8, 1, 18.50),
('2012-03-17', 1, 1, 10.50),
('2012-03-17', 9, 1, 32.95),
('2012-03-17', 12, 1, 16.95),
('2012-03-18', 12, 1, 15.95),
('2012-03-18', 14, 1, 20.95);

SELECT * FROM brewers;
SELECT * FROM beers;

INSERT INTO beers (name, brewerId) VALUES ('Corona', 28);
INSERT INTO beers (name) VALUES ('Corona');
