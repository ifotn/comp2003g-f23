USE Northwind;

-- find all products above the average price for all products
SELECT AVG(UnitPrice) FROM products;

-- raise all prices 5%
UPDATE products
SET UnitPrice = UnitPrice * 1.05
WHERE ProductID > 0;

-- now use in subquery
-- original avg: 27.45938272
-- new avg after price update: 28.83235185
SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM products)
ORDER BY UnitPrice;

/* 
    Customer names and contact data with the same postal code as Helen Gonzalez
    All items purchased by people living in the same city as Thomas Hardy
    All orders on the most recent date
    All companies who made purchases after Jan 1, 1995.
*/

-- Customer names and contact data with the same postal code as Helen Gonzalez
-- Step 1: Find Miguel Angel Paolino's postal code
SELECT PostalCode
FROM Customers 
WHERE ContactName = 'Miguel Angel Paolino';

-- Step 2: Find all customers at Miguel's postal code
SELECT ContactName, Address, City, Phone, PostalCode
FROM Customers
WHERE PostalCode = (SELECT PostalCode
FROM Customers 
WHERE ContactName = 'Miguel Angel Paolino');

-- All items purchased by people living in the same city as Thomas Hardy
-- Step 1: Find city of Thomas Hardy
SELECT City
FROM Customers
WHERE ContactName = 'Thomas Hardy';

-- Step 2: Find customers in London
SELECT *
FROM Customers
WHERE City = (SELECT City
FROM Customers
WHERE ContactName = 'Thomas Hardy');

-- Step 3: Find all products ordered by customers in same city as Thomas Hardy
SELECT DISTINCT ProductName, City
FROM Products
INNER JOIN Order_Details ON Products.ProductID = Order_Details.ProductID
INNER JOIN Orders ON Order_Details.OrderID = Orders.OrderID
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE City = (SELECT City
FROM Customers
WHERE ContactName = 'Thomas Hardy')
ORDER BY ProductName;

-- All orders on the most recent date
-- Step 1: find most recent date of any order
SELECT OrderDate
FROM Orders
ORDER BY OrderDate DESC
LIMIT 1;

SELECT MAX(OrderDate)
FROM Orders;

-- Step 2: find all orders on the most recent order date
SELECT * 
FROM Orders
WHERE OrderDate = (SELECT MAX(OrderDate)
FROM Orders);

-- All companies who made purchases after Jan 1, 1995.
-- Step 1: Find CustomerID's ordering after 1/1/95
SELECT CustomerID
FROM Orders
WHERE OrderDate > '1995-01-01';

-- Step 2: Find Company Names ordering after 1/1/95
SELECT DISTINCT CompanyName
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.CustomerID IN (SELECT CustomerID
FROM Orders
WHERE OrderDate > '1995-01-01');

SELECT DISTINCT CompanyName FROM customers
INNER JOIN orders on customers.CustomerID = orders.CustomerID
WHERE OrderDate >= "1995-01-01";

/*
    Customer names and contact data in the 206 area code
    All customers who have placed orders
    Employees who have not processed any orders (use NOT IN)
    Suppliers who supply both beverages (CategoryID 1) and seafood (CategoryID 8)
    Employees who have processed orders for customers in the USA
*/
SELECT ContactName, Phone, Address
FROM Customers
WHERE Phone IN (SELECT Phone FROM Customers
WHERE Phone LIKE '(206%');

SELECT DISTINCT ContactName
FROM Customers 
WHERE CustomerID IN (
SELECT CustomerID
FROM Orders);

SELECT FirstName, LastName, Title, TitleOfCourtesy
FROM Employees
WHERE EmployeeID NOT IN (
SELECT DISTINCT EmployeeID
FROM Orders);

SELECT SupplierID
FROM Products
WHERE CategoryID = 1;

SELECT SupplierID
FROM Products
WHERE CategoryID = 8;

SELECT ContactName, CompanyName, Address, Phone
FROM Suppliers
WHERE SupplierID IN (SELECT SupplierID
FROM Products
WHERE CategoryID = 1)
AND SupplierID IN (
SELECT SupplierID
FROM Products
WHERE CategoryID = 8);

SELECT DISTINCT Employees.EmployeeID, FirstName, LastName
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE CustomerID IN 
(SELECT CustomerID
FROM Customers
WHERE Country = 'USA');

SELECT EmployeeID, employees.FirstName, employees.LastName FROM employees
WHERE EmployeeID IN (SELECT DISTINCT employees.EmployeeID FROM employees
INNER JOIN orders ON employees.EmployeeID = orders.EmployeeID
INNER JOIN customers ON customers.customerID = orders.CustomerID
WHERE customers.Country = "USA");

SELECT FirstName, LastName
FROM employees
WHERE EmployeeID IN (SELECT EmployeeID
FROM customers
INNER JOIN orders ON orders.CustomerID = customers.CustomerID
WHERE Country = 'USA');