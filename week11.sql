USE comp2003;

-- try showing brewers and their beers without a JOIN
-- this gives a Cartesian Product with a duplicate set of records ??
SELECT * FROM
brewers, beers
WHERE brewers.brewerId = beers.brewerId;

SELECT * FROM beers;
DELETE FROM beers WHERE beerId > 8;

SELECT * FROM sales;
DELETE FROM sales WHERE salesId > 12;

SELECT * FROM beerCases;
DELETE FROM beerCases WHERE beerCaseId > 21;
SELECT * FROM cases;
DELETE FROM cases WHERE caseId > 3;

-- now show Brewer / Beer pairings with a JOIN
SELECT brewers.*, beers.*
FROM brewers 
INNER JOIN beers ON brewers.brewerId = beers.brewerId;

-- rewrite 2 column query with friendly column names & hide the id's
SELECT brewers.name AS brewer, beers.name AS beer, beers.photo
FROM brewers
INNER JOIN beers ON brewers.brewerId = beers.brewerId;

-- fetch a list of all sales that includes the beer names
-- price appears in 2 tables; we must specify which table to use for this
SELECT date, quantity, sales.price, name AS beer
FROM sales
INNER JOIN beerCases ON sales.beerCaseId = beerCases.beerCaseId
INNER JOIN beers ON beerCases.beerId = beers.beerId;

SELECT date, quantity, sales.price, name AS beer
FROM beers
INNER JOIN beerCases ON beers.beerId = beerCases.beerId
INNER JOIN sales ON beerCases.beerCaseId = sales.beerCaseId;

-- add brewer name to resultset showing all sales
SELECT date, quantity, sales.price, beers.name AS beer, brewers.name AS brewer
FROM beers
INNER JOIN beerCases ON beers.beerId = beerCases.beerId
INNER JOIN sales ON beerCases.beerCaseId = sales.beerCaseId
INNER JOIN brewers ON beers.brewerId = brewers.brewerId;

-- add case size to resultset showing all sales
SELECT date, size, quantity, sales.price, beers.name AS beer, brewers.name AS brewer
FROM beers
INNER JOIN beerCases ON beers.beerId = beerCases.beerId
INNER JOIN sales ON beerCases.beerCaseId = sales.beerCaseId
INNER JOIN brewers ON beers.brewerId = brewers.brewerId
INNER JOIN cases ON beerCases.caseId = cases.caseId;

-- total # of sales for each beer
-- v1: INNER JOIN only shows beers that have been sold at least once
SELECT COUNT(salesId) AS saleCount, beers.name
FROM beers
INNER JOIN beerCases ON beers.beerId = beerCases.beerId
INNER JOIN sales ON beerCases.beerCaseId = sales.beerCaseId
GROUP BY beers.name
ORDER by saleCount DESC;

-- v2: LEFT OUTER JOIN shows all parents (beerCases) even without children (sales)
SELECT COUNT(salesId) AS saleCount, beers.name
FROM beers
INNER JOIN beerCases ON beers.beerId = beerCases.beerId
LEFT OUTER JOIN sales ON beerCases.beerCaseId = sales.beerCaseId
GROUP BY beers.name
ORDER by saleCount DESC;

 -- Show all beers made by Labatt
SELECT brewers.name AS brewer, beers.name AS beer
FROM brewers
INNER JOIN beers ON brewers.brewerId = beers.brewerId
WHERE brewers.name = 'Labatt';

-- Show all beers available in 24 packs
SELECT beers.name AS beer, cases.size AS size
FROM beers
INNER JOIN beerCases ON beers.beerId = beerCases.beerId
INNER JOIN cases ON beerCases.caseId = cases.caseId
WHERE cases.size = 24;

-- Show the total sales revenue for Molson (use a Group function)
SELECT SUM(sales.price) AS revenue, brewers.name AS brewer
FROM sales
INNER JOIN beerCases ON sales.beerCaseId = beerCases.beerCaseId
INNER JOIN beers ON beerCases.beerId = beers.beerId
INNER JOIN brewers ON beers.brewerId = brewers.brewerId
WHERE brewers.name = "Molson";

-- Show how many sales were made by each brewer (use a Group function)
SELECT COUNT(salesId) AS sales, brewers.name
FROM sales
INNER JOIN beerCases ON sales.beerCaseId = beerCases.beerCaseId
INNER JOIN beers ON beerCases.beerId = beers.beerId
RIGHT OUTER JOIN brewers ON beers.brewerId = brewers.brewerId
GROUP BY brewers.name;

-- Show the total sales revenue by case size (use a Group function)
SELECT SUM(sales.price*sales.quantity) AS revenue, cases.size AS size
FROM sales
INNER JOIN beerCases ON sales.beerCaseId = beerCases.beerCaseId
INNER JOIN cases ON beerCases.caseId = cases.caseId
GROUP BY size
ORDER BY revenue DESC;




