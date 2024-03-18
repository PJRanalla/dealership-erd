
INSERT INTO salesperson(salesperson_id, first_name, last_name)
VALUES(1, 'Bob', 'Jones');

INSERT INTO dealership(dealership_id, address, phone_number, car_id, mechanic_id, salesperson_id)
VALUES(00111, '123 Sesame Street Chicago, IL 87654', '888-888-8888', 2424, 1, 1);

INSERT INTO customer(customer_id, first_name, last_name, email, dealership_id)
VALUES(444, 'Bobby', 'Blakenship', 'bobbyb@gmail.com', 111);

CREATE OR REPLACE FUNCTION add_salesperson(_salesperson_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
RETURNS void 
AS $MAIN$
BEGIN 
	INSERT INTO salesperson(salesperson_id, first_name, last_name)
	VALUES (_salesperson_id, _first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;

-- Call of stored function to add a sales person
SELECT add_salesperson(2,'John','Wick');

-- Verify added salesperson
SELECT * FROM salesperson WHERE salesperson_id = 2;


CREATE OR REPLACE FUNCTION add_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _email VARCHAR, _dealership_id INTEGER)
RETURNS void 
AS $MAIN$
BEGIN 
	INSERT INTO customer(customer_id, first_name, last_name, email, dealership_id)
	VALUES (_customer_id, _first_name, _last_name, _email, _dealership_id);
END;
$MAIN$
LANGUAGE plpgsql;


SELECT add_customer(23, 'Billy', 'Jean', 'isnotmylover@mjfanclub.com', 111);
