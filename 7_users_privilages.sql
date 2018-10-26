-- -- -------------------------------------------------------------------------------
-- -- Task: Create new users in database and grant/revoke them privilages as follows:
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

-- a) user user_ro may onl read data from all tables

DROP USER IF EXISTS 'user_ro'@'localhost';
CREATE USER 'user_ro'@'localhost' IDENTIFIED BY 'readonly';
GRANT SELECT ON pchromic.* to 'user_ro'@'localhost';

SHOW GRANTS FOR 'user_ro'@'localhost';

-- b) user user_rw has full access to table with customers, may only select other

DROP USER IF EXISTS 'user_rw'@'localhost';
CREATE USER 'user_rw'@'localhost' IDENTIFIED BY 'readwrite';

GRANT SELECT ON pchromic.* TO 'user_rw'@'localhost';
GRANT SELECT ON pchromic.customers TO 'user_rw'@'localhost';
GRANT INSERT ON pchromic.customers TO 'user_rw'@'localhost';
GRANT DELETE ON pchromic.customers TO 'user_rw'@'localhost';

-- REVOKE SELECT ON pchromic.* FROM 'user_rw'@'localhost';

SHOW GRANTS FOR 'user_rw'@'localhost';

-- c) user user_admin has all privilages 

DROP USER IF EXISTS 'user_admin'@'localhost';
CREATE USER 'user_admin'@'localhost' IDENTIFIED BY 'admin';

GRANT ALL PRIVILEGES ON pchromic.* TO 'user_admin'@'localhost';

SHOW GRANTS FOR 'user_admin'@'localhost';


FLUSH PRIVILEGES;



