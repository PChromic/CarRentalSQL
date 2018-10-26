-- -- -------------------------------------------------------------------------------
-- -- Task : For every customer find year and month when he had the biggest number of rentals
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
-- Section: solution
-- -- -------------------------------------------------------------------------------
delimiter // 

CREATE FUNCTION rental_max (idClient INT) RETURNS VARCHAR(100) 
DETERMINISTIC
BEGIN
 DECLARE max_rental_date VARCHAR(100) ;

WITH counted_rentals AS(
	SELECT *
	FROM(
		SELECT 
			YEAR(start_date) AS yr, 
			MONTH(start_date) AS mth, 
			COUNT(MONTH(start_date)) AS rental_max, 
			RANK() OVER(ORDER BY COUNT(MONTH(start_date)) DESC) AS rental_rank
		FROM 
			rentals
			WHERE fk_idCustomer = idClient
			GROUP BY YEAR(start_date), MONTH(start_date)
			) as help_t WHERE rental_rank = 1
		)
SELECT GROUP_CONCAT(concat_ws('.', mth, yr) ORDER BY yr ASC SEPARATOR ' ') INTO max_rental_date
FROM counted_rentals;

RETURN max_rental_date; 
            
END;//

SELECT idCustomer, rental_max(idCustomer)
FROM
customers;
DROP FUNCTION rental_max;