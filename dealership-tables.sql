CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);


CREATE TABLE dealership(
	dealership_id SERIAL PRIMARY KEY,
	address VARCHAR(150),
	phone_number VARCHAR(15),
	car_id INTEGER,
	mechanic_id INTEGER,
	salesperson_id INTEGER,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id)
);


CREATE TABLE sales_invoice(
	sales_invoice_id SERIAL PRIMARY KEY,
	invoice_date DATE DEFAULT current_date,
	invoice_amount NUMERIC(8,2),
	salesperson_id INTEGER,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id)
);


CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(100),
	dealership_id INTEGER,
	FOREIGN KEY(dealership_id) REFERENCES dealership(dealership_id)
);

CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	make VARCHAR(100),
	model VARCHAR(100),
	car_year INTEGER,
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);


CREATE TABLE service_history(
	ticket_id SERIAL PRIMARY KEY,
	ticket_date DATE DEFAULT current_date,
	mechanic_id INTEGER,
	car_id INTEGER,
	FOREIGN KEY(car_id) REFERENCES car(car_id)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	ticket_id INTEGER, 
	FOREIGN KEY(ticket_id) REFERENCES service_history(ticket_id)
);

CREATE TABLE service_ticket(
	service_ticket_id SERIAL PRIMARY KEY,
	ticket_date DATE DEFAULT current_date,
	customer_id INTEGER,
	car_id INTEGER,
	mechanic_id INTEGER,
	parts_upc INTEGER, 
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	FOREIGN KEY(parts_upc) REFERENCES parts(parts_upc)
);


CREATE TABLE parts(
	parts_upc SERIAL PRIMARY KEY, 
	description VARCHAR(150),
	amount INTEGER,
	price NUMERIC(5,2)
);

CREATE TABLE customer_invoice(
	invoice_id SERIAL PRIMARY KEY, 
	invoice_date DATE DEFAULT current_date,
	invoice_amount NUMERIC(8,2),
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

