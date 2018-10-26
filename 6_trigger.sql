-- -- -------------------------------------------------------------------------------
-- -- Task: Create trigger which sets minimal rental price as 100 zl if lower is to be added
-- -- -------------------------------------------------------------------------------

-- -- -------------------------------------------------------------------------------
-- Section: setting sql_mode
-- -- -------------------------------------------------------------------------------

SET sql_mode='ONLY_FULL_GROUP_BY,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';

-- -- -------------------------------------------------------------------------------
-- Section: USE
-- -- -------------------------------------------------------------------------------

USE pchromic;

-- -- -------------------------------------------------------------------------------
-- Section: rozwiazanie zadania
-- -- -------------------------------------------------------------------------------

drop trigger if exists trigger_value_before_rental_insert;
DELIMITER //
CREATE TRIGGER trigger_value_before_rental_insert
BEFORE INSERT ON rentals FOR EACH ROW IF NEW.price < 100 THEN SET NEW.price = 100;
END IF//

INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (23,	4,	1,	2,	'2018-06-13 10:10:00',	3,	'2018-06-28-10:10:00',	50);

SELECT * from rentals;
