-- -- -------------------------------------------------------------------------------
-- -- Create view which shows clients along with their rentals dates and car marks
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
-- Section: Task solution
-- -- -------------------------------------------------------------------------------
DROP VIEW IF EXISTS cusmtomer_rentals_cars_view;

CREATE VIEW cusmtomer_rentals_cars_view AS
    SELECT 
        cust.first_name_customer,
        cust.last_name_customer,
        r.start_date,
        r.end_date,
        c.mark
    FROM
        rentals r
            INNER JOIN
        customers cust ON r.fk_idCustomer = cust.idCustomer
            INNER JOIN
        cars c ON r.fk_idRentCar = c.idCar;
    
SELECT 
    *
FROM
    cusmtomer_rentals_cars_view;
