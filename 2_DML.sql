-- -- -------------------------------------------------------------------------------
-- -- DB POPULATE DATA
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
-- Section: Populate tables with data
-- -- -------------------------------------------------------------------------------
-- CARS --
-- -- -------------------------------------------------------------------------------
INSERT INTO cars (idCar,mark,model_type,production_year,distance,engine_capacity,horsepower,color) 
VALUES (1,"BMW","SUV",2017,123456,2200,200,"blue");
INSERT INTO cars (idCar,mark,model_type,production_year,distance,engine_capacity,horsepower,color) 
VALUES (2,"BMW","COMBI",2018,200111,1700,170,"red");
INSERT INTO cars (idCar,mark,model_type,production_year,distance,engine_capacity,horsepower,color) 
VALUES (3,"BMW","SPORT",2016,258698,1500,180,"green");
INSERT INTO cars (idCar,mark,model_type,production_year,distance,engine_capacity,horsepower,color) 
VALUES (4,"SKODA","SEDAN",2015,301567,1300,110,"black");
INSERT INTO cars (idCar,mark,model_type,production_year,distance,engine_capacity,horsepower,color) 
VALUES (5,"SKODA","SUV",2017,90000,1200,130,"pink");
INSERT INTO cars (idCar,mark,model_type,production_year,distance,engine_capacity,horsepower,color) 
VALUES (6,"SKODA","COMBI",2017,125,1800,150,"white");
INSERT INTO cars (idCar,mark,model_type,production_year,distance,engine_capacity,horsepower,color) 
VALUES (7,"AUDI","SPORT",2014,456789,3000,358,"golden");
INSERT INTO cars (idCar,mark,model_type,production_year,distance,engine_capacity,horsepower,color) 
VALUES (8,"FIAT","SEDAN",2016,456789,1000,90,"silver");
INSERT INTO cars (idCar,mark,model_type,production_year,distance,engine_capacity,horsepower,color) 
VALUES (9,"MAN","SUV",2016,199876,1900,168,"brown");
INSERT INTO cars (idCar,mark,model_type,production_year,distance,engine_capacity,horsepower,color) 
VALUES (10,"LADA","COMBI",2015,11111,1600,155,"yellow");
INSERT INTO cars (idCar,mark,model_type,production_year,distance,engine_capacity,horsepower,color) 
VALUES (110,"CITROEN","SUV",2017,123456,2200,200,"blue");
-- -- -------------------------------------------------------------------------------
-- OFFICES --
-- -- -------------------------------------------------------------------------------
INSERT INTO offices (idOffice,adress_office,email_office,phone_number_office)
VALUES (1,"25 Annamark Pass", "evasiliu0@constantcontact.com", 97325321);
INSERT INTO offices (idOffice,adress_office,email_office,phone_number_office)
VALUES (2,"7098 Glendale Parkway", "bseeger1@acquirethisname.com", 17973471);
INSERT INTO offices (idOffice,adress_office,email_office,phone_number_office)
VALUES (3,"33 Springview Park", "swinn9@tinypic.com", 47339262);
-- -- -------------------------------------------------------------------------------
-- WORKERS --
-- -- -------------------------------------------------------------------------------
-- OFFICEID 1 --
INSERT INTO workers (idWorker,first_name_worker,last_name_worker,birth_date_worker,fk_idOffice)
VALUES (1,"Bernice","Escoffrey",'1988-10-15',1);
INSERT INTO workers (idWorker,first_name_worker,last_name_worker,birth_date_worker,fk_idOffice)
VALUES (2,"Paule","Tooher",'1999-10-15',1);
INSERT INTO workers (idWorker,first_name_worker,last_name_worker,birth_date_worker,fk_idOffice)
VALUES (3,"Renado","Burnes",'1995-10-15',1);
INSERT INTO workers (idWorker,first_name_worker,last_name_worker,birth_date_worker,fk_idOffice)
VALUES (4,"Przemysław","Szczęśniak",'1995-04-10',1);
-- OFFICEID 2 --
INSERT INTO workers (idWorker,first_name_worker,last_name_worker,birth_date_worker,fk_idOffice)
VALUES (5,"Tomasz","Dragoński",'2000-11-04',2);
INSERT INTO workers (idWorker,first_name_worker,last_name_worker,birth_date_worker,fk_idOffice)
VALUES (6,"Darnall","Fairest",'1990-05-01',2);
INSERT INTO workers (idWorker,first_name_worker,last_name_worker,birth_date_worker,fk_idOffice)
VALUES (7,"Adam","Żółw",'1992-06-06',2);
INSERT INTO workers (idWorker,first_name_worker,last_name_worker,birth_date_worker,fk_idOffice)
VALUES (8,"Marta","Kat",'1993-02-28',2);
-- OFFICEID 3 --
INSERT INTO workers (idWorker,first_name_worker,last_name_worker,birth_date_worker,fk_idOffice)
VALUES (9,"Shauna","Bestwerthick",'1994-02-11',3);
INSERT INTO workers (idWorker,first_name_worker,last_name_worker,birth_date_worker,fk_idOffice)
VALUES (10,"Paweł","Tymber",'1997-02-11',3);
INSERT INTO workers (idWorker,first_name_worker,last_name_worker,birth_date_worker,fk_idOffice)
VALUES (11,"Stanisław","Bikiewicz",'1994-03-08',3);
INSERT INTO workers (idWorker,first_name_worker,last_name_worker,birth_date_worker,fk_idOffice)
VALUES (12,"Aleksandra","Filipiak",'1996-04-09',3);
-- -- -------------------------------------------------------------------------------
-- CUSTOMERS --
-- -- -------------------------------------------------------------------------------

INSERT INTO customers
VALUES (1,	 "Alicja","Wąsik",1565419061424080,"a1cjawasik@wp.pl",8735915893,'1996-04-09', "Nowowiejska 15, 45-460, Opole, Polska");
INSERT INTO customers
VALUES (2,	 "Andrzej","Gaj",3559256954003960,"andzejgaj@gmail",8735915893, '1994-03-08',"Opolska 25/6, 55-460, Wrocław, Polska");
INSERT INTO customers
VALUES (3,	 "Wojciech","Gajowy",60484466220576400,"w!jciech123@onet.eu",8735915893, '1997-02-11',"Jedności Narodowej 153, 55-311, Wrocław, Polska");
INSERT INTO customers
VALUES (4,	 "Arkadiusz","Milik",3565726331478610,"m%lo1992@gmail.com",8735915893, '1994-02-11',"JRRTolkien Street 15a, 88-777, London, United Kingdom");
INSERT INTO customers
VALUES (5,	 "Tomasz","Lewandowski",6373794738822300,"lewygola@wp.eu",8735915893,'1988-10-15', "Kasztanowa 1, 11-123, Brzeg, Polska");
INSERT INTO customers
VALUES (6,	 "Karyna","Sebix",3534294176320250,"plastikfantastik@blabla",8735915893, '1999-10-15',"Fallstrasse 55, 22-678, Berlin, Niemcy");
INSERT INTO customers
VALUES (7,	 "Krzysztof","Gruby",4405769032292010,"chudy@hotmail.eu",8735915893,'1995-04-10', "Falloutbaby 666, 66-123, Cleveland, United States of America");
INSERT INTO customers
VALUES (8,	 "Jakub","Toma",560224893134945000,"tralala@wp.pl",8735915893, '1992-06-06',"Grzechotnikowa 123, 60-460, Warszawa, Polska");
INSERT INTO customers
VALUES (9,	 "Krzysztof","Hołowczyc",5602248931111145000,"rajdowiec@wp.pl",8735914567, '1992-02-06',"Krzywa 44, 12-187, Warszawa, Polska");
INSERT INTO customers
VALUES (10,	 "Anna","Cicha",30334514558631,"cichosza@yahoo.org",8735915893,'1980-06-30', "Prosta 12, 56-378, Gdańsk, Polska");
INSERT INTO customers
VALUES (11, "Kleopatra","Cezar",30334514558631,"cichosza@yahoo.org",8735915893,'1980-06-30', "Prosta 12, 56-378, Gdańsk, Polska");

-- -- -------------------------------------------------------------------------------
-- RENTALS --
-- -- -------------------------------------------------------------------------------
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (1,	4,	1,	2,	'2018-06-13 10:10:00',	3,	'2018-06-28-10:10:00',	750);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (2,	4,	3,	2,	'2018-06-11 10:10:00',	3,	'2018-06-22 10:10:00',	750);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (3,	1,	2,	2,	'2018-06-02 10:10:00',	3,	'2018-06-30 10:10:00',	750);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (4,	1,	4,	2,	'2018-06-03 10:10:00',	3,	'2018-06-08 10:10:00',	750);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (5,	2,	7,	1,	'2017-12-23 10:10:00',	1,	'2017-12-31 10:10:00',	1200);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (6,	2,	11,	1,	'2017-12-15 10:10:00',	1,	'2017-12-17 10:10:00',	300);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (7,	10,	11,	1,	'2017-12-16 10:10:00',	1,	'2017-12-20 10:10:00',	450);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (8,	10,	4,	1,	'2017-12-13 10:10:00',	1,	'2017-12-21 10:10:00',	550);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (9,	7,	7,	1,	'2017-10-10 10:10:00',	3,	'2017-10-20 10:10:00',	1500);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (10,	8,	6,	2,	'2017-10-01 10:10:00',	3,	'2017-10-18 10:10:00',	2550);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (11,	6,	8,	2,	'2017-09-14 10:10:00',	2,	'2017-09-29 10:10:00',	2250);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (12,	9,	5,	2,	'2017-07-07 10:10:00',	1,	'2017-07-29 10:10:00',	3300);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (13,	10,	4,	1,	'2017-05-04 10:10:00',	1,	'2017-04-05 10:10:00',	150);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (14,	3,	4,	1,	'2017-04-04 10:10:00',	1,	'2017-04-05 10:10:00',	150);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (15,	3,	4,	3,	'2017-04-05 10:10:00',	1,	'2017-04-15 10:10:00',	1500);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (16,	1,	2,	3,	'2017-03-23 10:10:00',	1,	'2017-03-31 10:10:00',	1200);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (17,	3,	5,	3,	'2017-01-01 10:10:00',	1,	'2017-01-04 10:10:00',	450);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (18,	4,	10,	2,	'2017-02-20 10:10:00',	2,	'2017-02-28 10:10:00',	1200);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (19,	5,	9,	2,	'2016-06-14 10:10:00',	2,	'2016-06-29 10:10:00',	2250);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (20,	1,	1,	1,	'2016-06-13 10:10:00',	2,	'2016-06-28 10:10:00',	2250);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (21,	2,	2,	2,	'2016-05-05 10:10:00',	3,	'2016-05-10 10:10:00',	750);
INSERT INTO rentals (idRental,fk_idCustomer, fk_idRentCar,fk_idStartOffice, start_date,fk_idEndOffice,end_date, price)
VALUES (22,	2,	1,	2,	'2016-05-03 10:10:00',	3,	'2016-05-08 10:10:00',	750);

-- -- -------------------------------------------------------------------------------
-- WORKERS POSITIONS --
-- -- -------------------------------------------------------------------------------
-- OFFICEID 1 --
INSERT INTO workers_positions (idWorkerPosition, worker_position, fk_idWorker)
VALUES (1,	"mechanic",1);
INSERT INTO workers_positions (idWorkerPosition, worker_position, fk_idWorker)
VALUES (2,	"manager",2);
INSERT INTO workers_positions (idWorkerPosition, worker_position, fk_idWorker)
VALUES (3,	"accountant",3);
INSERT INTO workers_positions (idWorkerPosition, worker_position, fk_idWorker)
VALUES (4,	"dealer",4);
-- OFFICEID 2 --
INSERT INTO workers_positions (idWorkerPosition, worker_position, fk_idWorker)
VALUES (5,	"mechanic",	5);
INSERT INTO workers_positions (idWorkerPosition, worker_position, fk_idWorker)
VALUES (6,	"manager",	6);
INSERT INTO workers_positions (idWorkerPosition, worker_position, fk_idWorker)
VALUES (7,	"accountant",	7);
INSERT INTO workers_positions (idWorkerPosition, worker_position, fk_idWorker)
VALUES (8,	"dealer",	8);
-- OFFICEID 3 --
INSERT INTO workers_positions (idWorkerPosition, worker_position, fk_idWorker)
VALUES (9,	"mechanic",	9);
INSERT INTO workers_positions (idWorkerPosition, worker_position, fk_idWorker)
VALUES (10,	"manager",	10);
INSERT INTO workers_positions (idWorkerPosition, worker_position, fk_idWorker)
VALUES (11,	"accountant",	11);
INSERT INTO workers_positions (idWorkerPosition, worker_position, fk_idWorker)
VALUES (12,	"dealer",	12);
-- -- -------------------------------------------------------------------------------
-- WORKERS AND THEIR CARS --
-- -- -------------------------------------------------------------------------------
INSERT INTO workers_have_cars (idWorker, idCar, fk_idWorker, fk_idCar)
VALUES (1,1,1,1);
INSERT INTO workers_have_cars (idWorker, idCar, fk_idWorker, fk_idCar)
VALUES (5,2,5,2);
INSERT INTO workers_have_cars (idWorker, idCar, fk_idWorker, fk_idCar)
VALUES (5,3,5,3);
INSERT INTO workers_have_cars (idWorker, idCar, fk_idWorker, fk_idCar)
VALUES (9,1,9,1);
INSERT INTO workers_have_cars (idWorker, idCar, fk_idWorker, fk_idCar)
VALUES (1,4,1,4);
INSERT INTO workers_have_cars (idWorker, idCar, fk_idWorker, fk_idCar)
VALUES (5,5,5,5);
INSERT INTO workers_have_cars (idWorker, idCar, fk_idWorker, fk_idCar)
VALUES (9,7,9,7);
INSERT INTO workers_have_cars (idWorker, idCar, fk_idWorker, fk_idCar)
VALUES (1,8,1,8);
INSERT INTO workers_have_cars (idWorker, idCar, fk_idWorker, fk_idCar)
VALUES (5,1,5,1);
INSERT INTO workers_have_cars (idWorker, idCar, fk_idWorker, fk_idCar)
VALUES (4,9,4,9);
INSERT INTO workers_have_cars (idWorker, idCar, fk_idWorker, fk_idCar)
VALUES (5,9,5,9);