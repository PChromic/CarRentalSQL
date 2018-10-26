DROP TABLE cars;
SELECT * FROM cars;

UPDATE customers SET adress_customer = "blabla" WHERE idCustomer = 1;

SELECT adress_customer FROM customers ORDER BY idCustomer;
ALTER TABLE customers DROP COLUMN adress_customer;