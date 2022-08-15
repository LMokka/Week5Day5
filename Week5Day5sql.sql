--Create table syntax
--CREATE TABLE table_name(col_name DATA_TYPE, ...)

CREATE TABLE salesperson(
			 salesperson_id SERIAL PRIMARY KEY,
			 sp_first_name VARCHAR(50),
			 sp_last_name VARCHAR(50),
			 sp_pay_grade CHAR(1));

SELECT *
FROM salesperson;

CREATE TABLE car(
			 car_id SERIAL PRIMARY KEY,
			 serial_id VARCHAR(100),
			 car_brand_name VARCHAR(50),
			 car_model_name VARCHAR(50),
			 car_year_name INT,
			 car_color VARCHAR(50),
			 car_type VARCHAR(50),
			 car_transmission VARCHAR(50),
			 car_mileage VARCHAR(50),
			 car_price FLOAT,
			 salesperson_id INTEGER NOT NULL,
			 FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
			 customer_id INTEGER NOT NULL,
			 FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
			 --mechanic_id INTEGER NOT NULL,
			 --FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id));

SELECT *
FROM car;

CREATE TABLE invoice(
			 invoice_id SERIAL PRIMARY KEY,
			 price FLOAT,
			 car_id INTEGER NOT NULL,
			 FOREIGN KEY(car_id) REFERENCES car(car_id),
			 salesperson_id INTEGER NOT NULL,
			 FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
			 customer_id INTEGER NOT NULL,
			 FOREIGN KEY(customer_id) REFERENCES customer(customer_id));

SELECT *
FROM invoice;

CREATE TABLE customer(
			 customer_id SERIAL PRIMARY KEY,
			 c_first_name VARCHAR(50),
			 c_last_name VARCHAR(50));

SELECT *
FROM customer;

CREATE TABLE mechanic(
			 mechanic_id SERIAL PRIMARY KEY,
			 m_first_name VARCHAR(50),
			 m_last_name VARCHAR(50),
			 m_pay_grade CHAR(1),
			 car_id INTEGER NOT NULL,
			 FOREIGN KEY(car_id) REFERENCES car(car_id));

SELECT *
FROM mechanic;

CREATE TABLE service_ticket(
			 service_id SERIAL PRIMARY KEY,
			 services VARCHAR(1000),
			 service_price FLOAT,
			 serial_id VARCHAR(100) NOT NULL,
			 FOREIGN KEY(serial_id) REFERENCES car(serial_id),
			 customer_id INTEGER NOT NULL,
			 FOREIGN KEY(customer_id) REFERENCES customer(customer_id));

SELECT *
FROM service_ticket
			
DROP TABLE IF EXISTS car CASCADE;

CREATE TABLE car(
			 serial_id VARCHAR(100) PRIMARY KEY,
			 car_brand_name VARCHAR(50),
			 car_model_name VARCHAR(50),
			 car_year_name INT,
			 car_color VARCHAR(50),
			 car_type VARCHAR(50),
			 car_transmission VARCHAR(50),
			 car_mileage VARCHAR(50),
			 car_price FLOAT,
			 salesperson_id INTEGER NOT NULL,
			 FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
			 customer_id INTEGER NOT NULL,
			 FOREIGN KEY(customer_id) REFERENCES customer(customer_id));
			 --mechanic_id INTEGER NOT NULL,
			 --FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id));

SELECT *
FROM car;

ALTER TABLE invoice
ADD COLUMN serial_id VARCHAR(100) NOT NULL;

ALTER TABLE invoice 
ADD FOREIGN KEY(serial_id) REFERENCES car(serial_id);
			 
SELECT *
FROM invoice;

ALTER TABLE invoice 
DROP COLUMN car_id

SELECT *
FROM invoice

SELECT *
FROM mechanic;

ALTER TABLE mechanic 
ADD COLUMN serial_id VARCHAR(100) NOT NULL;

ALTER TABLE mechanic
ADD FOREIGN KEY(serial_id) REFERENCES car(serial_id);

SELECT * 
FROM mechanic;

ALTER TABLE mechanic 
DROP COLUMN car_id

SELECT *
FROM mechanic

SELECT *
FROM service_ticket 

ALTER TABLE car
ADD COLUMN mechanic_id INTEGER NOT NULL;

ALTER TABLE car
ADD FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id);

SELECT *
FROM mechanic 

SELECT *
FROM salesperson 

INSERT INTO salesperson(sp_first_name, sp_last_name, sp_pay_grade)
VALUES('Brian','Stanton','A')

SELECT *
FROM salesperson

INSERT INTO salesperson(sp_first_name, sp_last_name, sp_pay_grade)
VALUES('Keith','Couch','B') 

SELECT *
FROM salesperson

DELETE FROM salesperson 
WHERE sp_first_name LIKE 'Keith';

SELECT *
FROM salesperson

INSERT INTO salesperson(sp_first_name, sp_last_name, sp_pay_grade)
VALUES('Bryan','Glover','B') 

SELECT *
FROM salesperson 

SELECT *
FROM car

INSERT INTO customer(c_first_name, c_last_name)
VALUES('Naiyl','Rashid')

INSERT INTO customer(c_first_name, c_last_name)
VALUES('Javier','Rios')

SELECT *
FROM customer

SELECT *
FROM car 

ALTER TABLE car
DROP COLUMN salesperson_id;

ALTER TABLE car
DROP COLUMN customer_id;

ALTER TABLE car 
DROP COLUMN mechanic_id;

SELECT *
FROM car

CREATE OR REPLACE PROCEDURE add_new_car(serial_id VARCHAR(100),
			 car_brand_name VARCHAR(50),
			 car_model_name VARCHAR(50),
			 car_year_name INT,
			 car_color VARCHAR(50),
			 car_type VARCHAR(50),
			 car_transmission VARCHAR(50),
			 car_mileage VARCHAR(50),
			 car_price FLOAT)
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO car(serial_id, car_brand_name, car_model_name, car_year_name, car_color, car_type,
			 car_transmission,
			 car_mileage,
			 car_price)
	VALUES(serial_id, car_brand_name, car_model_name, car_year_name, car_color, car_type,
			 car_transmission,
			 car_mileage,
			 car_price);
END;
$$;

CALL add_new_car('ABC123','Toyota', 'RAV4','2009','silver','SUV','4WD','20000',20000);
CALL add_new_car('GXF924','Toyota','Camry','2010','red','sedan','Frontwheeldrive','10000',15000);

SELECT *
FROM car
SELECT *
FROM customer
SELECT *
FROM salesperson  
SELECT *
FROM invoice

INSERT INTO invoice(price,salesperson_id,customer_id,serial_id)
VALUES(20000,1,1,'ABC123')
INSERT INTO invoice(price,salesperson_id,customer_id,serial_id)
VALUES(15000,4,2,'GXF924')
SELECT *
FROM invoice

SELECT *
FROM mechanic
INSERT INTO mechanic(m_first_name,m_last_name,m_pay_grade,serial_id)
VALUES('Mike','Cleveland','C','ABC123')
INSERT INTO mechanic(m_first_name,m_last_name,m_pay_grade,serial_id)
VALUES('Gary','Anderson','C','GXF924')
SELECT *
FROM mechanic
SELECT *
FROM service_ticket
INSERT INTO service_ticket(services,service_price,serial_id,customer_id)
VALUES('Replace brakes',500,'ABC123',1)
INSERT INTO service_ticket(services,service_price,serial_id,customer_id)
VALUES('Replace tires',800,'GXF924',2)
SELECT *
FROM service_ticket
SELECT *
FROM car
SELECT *
FROM customer
SELECT *
FROM invoice
