-- Create Tables
CREATE TABLE customer(
-- 	Define columns and datatypes
	customer_id SERIAL PRIMARY KEY, -- Primary Key must be unique and Not Null
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	address VARCHAR(150),
	billing_info VARCHAR(150)
);

-- Add order table
CREATE TABLE order_(
	order_id SERIAL PRIMARY KEY,
	order_date DATE DEFAULT CURRENT_DATE,
	sub_total NUMERIC(8,2),
	total NUMERIC(9,2),
	-- Add Foreign Key
	-- First create the column
	customer_id INTEGER NOT NULL, -- NOT NULL CONSTRAINT means this can't be empty
	-- Second add foreign key constraint -- FOREIGN KEY (name_of_column) REFERENCES table(column)
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

-- Create inventory table
CREATE TABLE inventory(
	inventory_id SERIAL PRIMARY KEY,
	product_id INTEGER NOT NULL,
	order_id INTEGER,
	FOREIGN KEY(order_id) REFERENCES order_(order_id)
);

-- Create product table
CREATE TABLE product(
	product_id SERIAL PRIMARY KEY,
	prod_name VARCHAR(100),
	prod_description VARCHAR(150),
	amount NUMERIC(5,2),
	seller_id INTEGER NOT NULL
);

-- Alter inventory to add FK constraint
ALTER TABLE inventory
ADD FOREIGN KEY(product_id) REFERENCES product(product_id);


-- Add seller table
CREATE TABLE seller(
	seller_id SERIAL PRIMARY KEY,
	seller_name VARCHAR(150),
	contact_number VARCHAR(15),
	address VARCHAR(150)
);

-- Add foreign key to product for seller
ALTER TABLE product
ADD FOREIGN KEY(seller_id) REFERENCES seller(seller_id);


-- Example of how drop works
CREATE TABLE example(
	example_id SERIAL PRIMARY KEY,
	fk INTEGER,
	FOREIGN KEY(fk) REFERENCES seller(seller_id)
);


DROP TABLE IF EXISTS example;

