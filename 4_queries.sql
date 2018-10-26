-- -- -------------------------------------------------------------------------------
-- -- Task: Write SQL queries
-- -- -------------------------------------------------------------------------------

-- -- -------------------------------------------------------------------------------
-- Section: setting sql_mode
-- -- -------------------------------------------------------------------------------

SET sql_mode='ONLY_FULL_GROUP_BY,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -- -------------------------------------------------------------------------------
-- Section: USE
-- -- -------------------------------------------------------------------------------
USE pchromic;

-- -- -------------------------------------------------------------------------------
-- Section: Tasks solution
-- -- -------------------------------------------------------------------------------

-- -- -------------------------------------------------------------------------------
-- 1)	List all tables from your database
-- -- -------------------------------------------------------------------------------
SHOW TABLES LIKE '%work%';
-- -- -------------------------------------------------------------------------------
-- 2)	Display info about fields and datatypes in Workers table
-- -- -------------------------------------------------------------------------------
SHOW COLUMNS FROM workers;
DESCRIBE workers;
-- -- -------------------------------------------------------------------------------
-- 3)	Find workers older than 25 years
-- -- -------------------------------------------------------------------------------
SELECT 
    w.first_name_worker,
    w.last_name_worker,
    w.birth_date_worker,
    CURDATE(),
    TIMESTAMPDIFF(YEAR,
        w.birth_date_worker,
        CURDATE()) AS age
FROM
    workers w
WHERE
    TIMESTAMPDIFF(YEAR,
        w.birth_date_worker,
        CURDATE()) > 25;
-- -- -------------------------------------------------------------------------------        
-- 4) Find workers whose last names are longer than 5 signs; take special and polish signs in account
-- -- -------------------------------------------------------------------------------
SELECT 
    w.last_name_worker
FROM
    workers w
WHERE
    CHAR_LENGTH(last_name_worker) > 5;
    
-- -- -------------------------------------------------------------------------------
-- 5) Find workers, in whose last names there is "a" letter on second place
-- -- -------------------------------------------------------------------------------

SELECT 
    w.last_name_worker
FROM
    workers w
WHERE
    w.last_name_worker LIKE '_a%';
    
-- -- -------------------------------------------------------------------------------
-- 6) Find customers, who have e-mail. The e-mail should contain nonnumeric at second place of local-part (before "@"), domain (after "@") is ".pl" or ".eu"
-- -- -------------------------------------------------------------------------------

SELECT 
    c.email_customer 
FROM
    customers c
WHERE
    c.email_customer REGEXP '^[a-zA-Z0-9.][^a-zA-Z][a-zA-Z0-9.]*@[a-z]+(\.pl|\.eu)$';
    
-- -- -------------------------------------------------------------------------------
-- 7) Find customers, who have e-mail not capable with e-mail adress format, like: "test@wp." instead of "test@wp.pl"
-- -- -------------------------------------------------------------------------------

SELECT 
    c.email_customer
FROM
    customers c
WHERE
    c.email_customer REGEXP '^[a-zA-Z0-9]*@[a-z]+$';
    
-- -- -------------------------------------------------------------------------------
-- 8) Count number of cars having distance between 200 000 and 300 000 km
-- -- -------------------------------------------------------------------------------

SELECT 
    COUNT(*)
FROM
    cars c
WHERE
	  c.distance BETWEEN 200000 and 300000;

-- -- -------------------------------------------------------------------------------        
-- 9)	Find all managers
-- -- -------------------------------------------------------------------------------

SELECT 
    w_p.worker_position, w.first_name_worker, w.last_name_worker
FROM
    workers_positions w_p
JOIN
	workers w ON w_p.fk_idWorker = w.idWorker
	WHERE
		w_p.worker_position = 'manager';
		
-- -- -------------------------------------------------------------------------------    
-- 10)	Find cars with the greatest distance
-- -- -------------------------------------------------------------------------------
SELECT 
    *
FROM
    cars c
WHERE
    distance = (SELECT 
            MAX(distance)
        FROM
            cars);
            
-- -- -------------------------------------------------------------------------------    
-- 11)	Find customer with the greates number of rentals
-- -- -------------------------------------------------------------------------------

SELECT 
    *
FROM
    customers cust
        JOIN
    (SELECT 
        r.fk_idCustomer, COUNT(fk_idCustomer) AS count_cust_rentals
    FROM
        rentals r
    GROUP BY fk_idCustomer) cust_rentals ON cust_rentals.fk_idCustomer = cust.idCustomer
        JOIN
    (SELECT 
        COUNT(rent.fk_idCustomer) AS max_rentals
    FROM
        rentals AS rent
    GROUP BY rent.fk_idCustomer
    ORDER BY COUNT(rent.fk_idCustomer) DESC
    LIMIT 1) max_cust_rentals ON cust_rentals.count_cust_rentals = max_cust_rentals.max_rentals;
    
-- -- -------------------------------------------------------------------------------
-- 12)	Give number of all rentals in every month, regardless of year. Include only there, in which were any rentals
-- -- -------------------------------------------------------------------------------

SELECT 
    MONTH(start_date) AS mth, COUNT(*) AS month_rentals_sum
FROM
    rentals
WHERE
    start_date >= CURDATE() - INTERVAL 10 YEAR
GROUP BY mth
ORDER BY mth DESC;

-- -- -------------------------------------------------------------------------------
-- 13)	Display average rentals per customer for every month.
-- -- -------------------------------------------------------------------------------

SELECT 
    COUNT(fk_idRentCar) / COUNT(DISTINCT fk_idCustomer) AS avg_rental_per_customer,
    MONTH(start_date) AS mth,
    YEAR(start_date) as yr
FROM
    rentals
GROUP BY MONTH(start_date) , YEAR(start_date)
ORDER BY YEAR(start_date) DESC;

-- -- -------------------------------------------------------------------------------
-- 14)	Find cusomters, who rented the biggest amount of distinct cars
-- -- -------------------------------------------------------------------------------
    
SELECT 
    c.first_name_customer,
    c.last_name_customer,
    c.idCustomer,
    COUNT(*) AS different_cars
FROM
    customers AS c
        JOIN
    (SELECT DISTINCT
        fk_idRentCar, fk_idCustomer
    FROM
        rentals) AS unique_cars ON unique_cars.fk_idCustomer = c.idCustomer
GROUP BY c.first_name_customer , c.last_name_customer , c.idCustomer
ORDER BY different_cars DESC
LIMIT 3;
    
-- -- -------------------------------------------------------------------------------        
-- 15)	Find most frequently rented car marks
-- -- -------------------------------------------------------------------------------

SELECT 
	mark,
    rental_ranking,
    number_of_mark_records

FROM(
SELECT
		c.mark,
		COUNT(c.mark) AS number_of_mark_records,
		DENSE_RANK() OVER (ORDER BY COUNT(c.mark) DESC) AS rental_ranking
			
		FROM
			cars c
		INNER JOIN
			rentals r ON c.idCar = r.fk_idRentCar            

		GROUP BY
			c.mark) as temp_table
WHERE rental_ranking = 1;

-- -- -------------------------------------------------------------------------------
-- 16)	Find customers who payed most for rentals in current year. Create view.
-- -- -------------------------------------------------------------------------------

DROP VIEW IF EXISTS max_sum_price_customer;
CREATE VIEW max_sum_price_customer AS
    SELECT 
        rental_year, price, fk_idCustomer
    FROM
        (SELECT 
            fk_idCustomer, price, YEAR(start_date) AS rental_year
        FROM
            rentals) AS help_table
    WHERE
        rental_year = 2018;


  SELECT sum_of_rentals, fk_idCustomer
  FROM(
   SELECT
        SUM(price) AS sum_of_rentals,
        fk_idCustomer,
       DENSE_RANK() OVER(ORDER BY SUM(price) DESC) AS maximum_price_ranking
   FROM max_sum_price_customer
   JOIN customers cust ON cust.idCustomer = max_sum_price_customer.fk_idCustomer
   GROUP BY fk_idCustomer) AS help_t
   WHERE maximum_price_ranking = 1;

-- -- -------------------------------------------------------------------------------
-- 17)	Find customers, who rented car of mark X between Y and Z dates 
-- -- -------------------------------------------------------------------------------

SELECT 
    c.mark, cust.first_name_customer
FROM
    rentals r
        JOIN
    cars c ON c.idCar = r.fk_idRentCar
        JOIN
    customers cust ON cust.idCustomer = r.fk_idCustomer
WHERE
    (r.start_date BETWEEN '2017-12-01 14:15:55' AND '2017-12-31 10:15:55')
        && c.mark = 'CITROEN';

-- -- -------------------------------------------------------------------------------
-- 18)	Find customers who had rented car of mark X between Y and Z dates. 
-- -- -------------------------------------------------------------------------------

SELECT 
    first_name_customer,
    last_name_customer,
    start_date,
    end_date
FROM
    rentals r
        JOIN
    cars c ON c.idCar = r.fk_idRentCar
        JOIN
    customers cust ON cust.idCustomer = r.fk_idCustomer
WHERE
    ((start_date BETWEEN '2018-06-04 10:10:10' AND '2018-06-25 10:10:10')
        OR (end_date BETWEEN '2018-06-04 10:10:10' AND '2018-06-25 10:10:10')
        OR (start_date <= '2018-06-04 10:10:10'
        AND end_date >= '2018-06-25 10:10:10'))
        AND (mark = 'BMW');

-- -- -------------------------------------------------------------------------------
-- 19)	Find customer who most frequently rents and returns cars in different offices
-- -- -------------------------------------------------------------------------------

SELECT *
FROM (
	SELECT idCustomer, first_name_customer, last_name_customer, DENSE_RANK() OVER (ORDER BY COUNT(idCustomer) DESC) AS rental_ranking
	FROM 
		rentals r
		JOIN customers cust ON cust.idCustomer = r.fk_idCustomer
		WHERE fk_idStartOffice  != fk_idEndOffice
		GROUP BY idCustomer
        ) AS help_t
	WHERE rental_ranking = 1;
    
-- -- -------------------------------------------------------------------------------
-- 20)	Find domain, where most of customers have their e-mail adresses
-- -- -------------------------------------------------------------------------------

WITH counted_domains AS(
	SELECT 
		substring_index(email_customer, '@', -1) domain,
    COUNT(*) domain_count
    FROM 
		customers 
    GROUP BY 
		domain)

SELECT 
	domain,
	domain_count 
FROM counted_domains
WHERE domain_count = ( SELECT MAX(domain_count) from counted_domains);

-- -- -------------------------------------------------------------------------------
-- 21)	Find cars having at least 2 carers
-- -- -------------------------------------------------------------------------------

WITH counted_carers AS (
SELECT 
	idCar,
    COUNT(idCar) AS number_of_carers
FROM workers_have_cars
GROUP BY idCar)

SELECT 
	counted_carers.idCar,
    c.mark,c.model_type,
	c.production_year,
	number_of_carers
FROM counted_carers
  JOIN cars AS c ON c.idCar = counted_carers.idCar
WHERE number_of_carers >= 2;

-- -- -------------------------------------------------------------------------------
-- 22)	Find workers who are not taking car of any car
-- -- -------------------------------------------------------------------------------

SELECT 
    w.idWorker, w.first_name_worker, w.last_name_worker
FROM
    workers w
        LEFT JOIN
    workers_have_cars AS work_cars ON w.idWorker = work_cars.idWorker
WHERE
    work_cars.idCar IS NULL;
    
-- -- -------------------------------------------------------------------------------
-- 23)	Update color of car
-- -- -------------------------------------------------------------------------------

UPDATE cars 
SET 
    color = 'gold2'
WHERE
    idCar = 11;
SELECT 
    *
FROM
    cars WHERE
    idCar = 11;
    
-- -- -------------------------------------------------------------------------------