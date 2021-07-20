-- Data Manipulation Language (DML)
SELECT *
FROM customer;

-- Add data to our tables
-- INSERT INTO table_name(column1, column2, etc.) VALUES (val1, val2, etc.)
INSERT INTO customer(
	customer_id, 
	first_name, 
	last_name, 
	address, 
	billing_info
) VALUES(
	1, 
	'Brian', 
	'Stanton', 
	'123 Real Street',
	'123 Real Street'
);

-- Add another customer
INSERT INTO customer(
	last_name,
	first_name,
	billing_info,
	address
) VALUES (
	'Hawkins',
	'Derek',
	'555 Circle Drive',
	'222 W Ontario'
);

-- Add to order table
INSERT INTO order_(
	customer_id,
	sub_total,
	total
) VALUES (
	1,
	99.99,
	109.99
);

SELECT *
FROM order_;

INSERT INTO order_(
	customer_id,
	sub_total,
	total
) VALUES (
	2,
	9.99,
	10.99
);

-- Adding multiple rows to our table
INSERT INTO order_(customer_id, sub_total, total)
VALUES (1, 59.99, 65.55), (2, 25.50, 30.00), (1, 999.99, 1010.10);


-- To Update existing data
-- DONT FORGET YOUR WHERE WHEN YOU ARE UPDATING
UPDATE order_
SET sub_total = 100.00
WHERE customer_id = 1;

UPDATE customer
SET address = '321 Fake Street', billing_info = '321 Fake Street'
WHERE customer_id = 1;

SELECT *
FROM order_;

-- Delete rows of data
DELETE FROM order_
WHERE total > 100;
