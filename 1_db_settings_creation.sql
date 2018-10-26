-- -- -------------------------------------------------------------------------------
-- -- DB SETTINGS AND CREATION
-- -- -------------------------------------------------------------------------------

-- -- -------------------------------------------------------------------------------
-- Section: setting sql_mode
-- -- -------------------------------------------------------------------------------

 SET sql_mode='ONLY_FULL_GROUP_BY,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -- -------------------------------------------------------------------------------
-- Section: DROP DATABASE or DROP Tables
-- -- -------------------------------------------------------------------------------

 DROP DATABASE IF EXISTS pchromic;
 CREATE database pchromic DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci; 
 
-- -- -------------------------------------------------------------------------------
-- Section: USE
-- -- -------------------------------------------------------------------------------

 USE pchromic;
 
-- -- -------------------------------------------------------------------------------
-- Section: CREATE
-- -- -------------------------------------------------------------------------------
CREATE TABLE cars (
    
	idCar INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    mark VARCHAR(20),
    model_type VARCHAR (45),
    production_year YEAR,
	distance INT,
    engine_capacity INT,
    horsepower INT,
	color VARCHAR(10)
  );	
 
CREATE TABLE rentals (
	idRental INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    start_date DATETIME,
    end_date DATETIME default NULL,
    price DECIMAL(8,2)
   );

CREATE TABLE customers (
	idCustomer INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_name_customer VARCHAR(20),
    last_name_customer VARCHAR(45),
	creditcard_number VARCHAR(19),
    email_customer VARCHAR(45),
    phone_number_customer VARCHAR(10),
    birth_date_customer DATE,
    adress_customer VARCHAR(70));

CREATE TABLE offices (
	idOffice INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    adress_office VARCHAR(45),
    email_office VARCHAR(45),
    phone_number_office INT(10));

CREATE TABLE workers (
	idWorker INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	first_name_worker VARCHAR(45),
    last_name_worker VARCHAR(45),
    birth_date_worker DATE);
    
CREATE TABLE workers_positions (
	idWorkerPosition INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	worker_position ENUM('mechanic', 'manager', 'accountant', 'dealer')
    );
    
CREATE TABLE workers_have_cars (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	idWorker INT NOT NULL,
	idCar INT NOT NULL
	);

-- -- -------------------------------------------------------------------------------
-- Section: ALTER TABLE
-- -- -------------------------------------------------------------------------------

ALTER TABLE rentals ADD fk_idStartOffice INT NOT NULL;
ALTER TABLE rentals
	ADD CONSTRAINT fk_rental_office_start 
	FOREIGN KEY (fk_idStartOffice) 
	REFERENCES offices(idOffice);

ALTER TABLE rentals ADD fk_idEndOffice INT NOT NULL;
ALTER TABLE rentals
	ADD CONSTRAINT fk_rental_office_end 
	FOREIGN KEY (fk_idEndOffice) 
	REFERENCES offices(idOffice);
    
ALTER TABLE rentals ADD fk_idRentCar INT NOT NULL;
ALTER TABLE rentals
	ADD CONSTRAINT fk_rental_car
	FOREIGN KEY (fk_idRentCar) 
	REFERENCES cars(idCar);
    
ALTER TABLE rentals ADD fk_idCustomer INT NOT NULL;
ALTER TABLE rentals
	ADD CONSTRAINT fk_rental_customer
	FOREIGN KEY (fk_idCustomer) 
	REFERENCES customers(idCustomer);  
    
ALTER TABLE workers ADD fk_idOffice INT NOT NULL;
ALTER TABLE workers
	ADD CONSTRAINT fk_office_workers 
	FOREIGN KEY (fk_idOffice) 
	REFERENCES offices(idOffice);

ALTER TABLE workers_positions ADD fk_idWorker INT NOT NULL;
ALTER TABLE workers_positions
	ADD CONSTRAINT fk_worker_postinion_worker 
	FOREIGN KEY (fk_idWorker) 
	REFERENCES workers(idWorker);

ALTER TABLE workers_have_cars
	ADD CONSTRAINT fk_worker_cared_car
	FOREIGN KEY (idCar) 
	REFERENCES cars(idCar);

ALTER TABLE workers_have_cars
	ADD CONSTRAINT fk_car_caring_worker 
	FOREIGN KEY (idWorker) 
	REFERENCES workers(idWorker);