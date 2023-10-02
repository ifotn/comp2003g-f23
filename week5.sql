USE comp2003;

DROP TABLE orders;

CREATE TABLE orders (
orderId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
accountId INT NOT NULL,
paymentType VARCHAR(30) NOT NULL,
orderTotal DEC(10,2) NOT NULL,
orderDate DATETIME NOT NULL,
expectedDelivery DATE,
status VARCHAR(15) NOT NULL DEFAULT 'Paid',
deliveryOption VARCHAR(15) NOT NULL
);

/* try to insert some orders */
INSERT INTO orders (accountId, paymentType, orderTotal, orderDate, deliveryOption) VALUES 
(123, 'PayPal', 279.29, '2023-09-02 13:00', 'Standard');

/* mysql lets us assign pk values that should be auto incremented... NEVER do this! */
-- can we do this comment style for a single line?  Why yes we can
INSERT INTO orders (orderId, accountId, paymentType, orderTotal, orderDate, deliveryOption) VALUES 
(300, 456, 'Visa', 59.99, '2023-09-02 13:05', 'Standard');

INSERT INTO orders (orderId, accountId, paymentType, orderTotal, orderDate, deliveryOption) VALUES 
(2, 123, 'PayPal', 59.99, '2023-09-02 13:05', 'Standard');

SELECT * FROM orders;

-- modify table structure without rebuilding or deleting data
ALTER TABLE orders
AUTO_INCREMENT = 1000;

-- insert another record, orderId should now start at 1000
INSERT INTO orders (accountId, paymentType, orderTotal, orderDate, deliveryOption) VALUES 
(789, 'PayPal', 33.00, '2023-09-02 13:13', 'Overnight');

-- try to change a PK value
UPDATE orders
SET orderId = 3 WHERE orderId = 300;

-- remove duplicate order
DELETE FROM orders WHERE orderId = 1001;