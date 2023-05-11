-- CS4400: Introduction to Database Systems (Fall 2021)
-- Phase II: Create Table & Insert Statements [v0] Thursday, October 14, 2021 @ 2:00pm EDT

-- Team 89
-- Team Member Name: Quyen Pham (GT qpham36)
-- Team Member Name: Tuan Cai (GT tcai44 )
-- Team Member Name: Jay Sandeep Mulay (GT jay.mulay)
-- Team Member Name: Eric Xu (GT exu31)

-- Directions:
-- Please follow all instructions for Phase II as listed on Canvas.
-- Fill in the team number and names and GT usernames for all members above.
-- Create Table statements must be manually written, not taken from an SQL Dump file.
-- This file must run without error for credit.

-- ------------------------------------------------------
-- CREATE TABLE STATEMENTS AND INSERT STATEMENTS BELOW

DROP DATABASE IF EXISTS phaseII;
CREATE DATABASE IF NOT EXISTS phaseII;
USE phaseII;

-- 1. Table struture for table Accounts
DROP TABLE IF EXISTS Accounts;
CREATE TABLE Accounts (
username varchar(100) NOT NULL,
fname varchar(50) NOT NULL,
lname varchar(50) NOT NULL,
pword varchar(20) NOT NULL,
PRIMARY KEY (username)
) ENGINE = InnoDB;

INSERT INTO Accounts (username, fname, lname, pword )
 VALUES ('mmoss1@travelagency.com','Mark','Moss','password1');
INSERT INTO Accounts (username, fname, lname, pword )
 VALUES ('asmith@travelagency.com','Aviva','Smith','password2');
INSERT INTO Accounts (username, fname, lname, pword )
 VALUES ('mscott22@gmail.com','Michael','Scott','password3');
INSERT INTO Accounts (username, fname, lname, pword )
 VALUES ('arthurread@gmail.com','Arthur','Read','password4');
INSERT INTO Accounts (username, fname, lname, pword )
 VALUES ('jwayne@gmail.com','John','Wayne','password5');
INSERT INTO Accounts (username, fname, lname, pword )
 VALUES ('gburdell3@gmail.com','George','Burdell','password6');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('mj23@gmail.com','Michael','Jordan','password7');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('lebron6@gmail.com','Lebron','James','password8');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('msmith5@gmail.com','Michael','Smith','password9');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('ellie2@gmail.com','Ellie','Johnson','password10');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('scooper3@gmail.com','Sheldon','Cooper','password11');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('mgeller5@gmail.com','Monica','Geller','password12');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('cbing10@gmail.com','Chandler','Bing','password13');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('hwmit@gmail.com','Howard','Wolowitz','password14');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('swilson@gmail.com','Samantha','Wilson','password16');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('aray@tiktok.com','Addison','Ray','password17');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('cdemilio@tiktok.com','Charlie','Demilio','password18');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('bshelton@gmail.com','Blake','Shelton','password19');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('lbryan@gmail.com','Luke','Bryan','password20');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('tswift@gmail.com','Taylor','Swift','password21');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('jseinfeld@gmail.com','Jerry','Seinfeld','password22');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('maddiesmith@gmail.com','Madison','Smith','password23');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('johnthomas@gmail.com','John','Thomas','password24');
INSERT INTO Accounts (username,fname,lname,pword )
 VALUES ('boblee15@gmail.com','Bob','Lee','password25');
 
 -- 2. Table struture for table Admins
DROP TABLE IF EXISTS Admins;
CREATE TABLE Admins (
username varchar(100) NOT NULL,
FOREIGN KEY (username) REFERENCES Accounts (username),
PRIMARY KEY (username)
) ENGINE = InnoDB;

INSERT INTO Admins (username)
 VALUES ('mmoss1@travelagency.com');
INSERT INTO Admins (username)
 VALUES ('asmith@travelagency.com');
 
 -- 3. Table struture for table Clients
DROP TABLE IF EXISTS Clients;
CREATE TABLE Clients (
username varchar(100) NOT NULL,
phonenumber char (12) NOT NULL, 
PRIMARY KEY (username),
FOREIGN KEY (username) REFERENCES Accounts (username)
) ENGINE = InnoDB;

INSERT INTO Clients (username, phonenumber)
 VALUES ('mscott22@gmail.com', '555-123-4567');
INSERT INTO Clients (username, phonenumber)
 VALUES ('arthurread@gmail.com', '555-234-5678');
INSERT INTO Clients (username, phonenumber)
 VALUES ('jwayne@gmail.com', '555-345-6789');
INSERT INTO Clients (username,phonenumber)
 VALUES ('gburdell3@gmail.com','555-456-7890');
 INSERT INTO Clients (username,phonenumber)
 VALUES ('mj23@gmail.com', '555-567-8901');
INSERT INTO Clients (username,phonenumber)
 VALUES ('lebron6@gmail.com', '555-678-9012');
INSERT INTO Clients (username,phonenumber)
 VALUES ('msmith5@gmail.com', '555-789-0123');
INSERT INTO Clients (username,phonenumber)
 VALUES ('ellie2@gmail.com', '555-890-1234');
INSERT INTO Clients (username,phonenumber)
 VALUES ('scooper3@gmail.com','678-123-4567');
INSERT INTO Clients (username,phonenumber)
 VALUES ('mgeller5@gmail.com','678-234-5678');
 INSERT INTO Clients (username,phonenumber)
 VALUES ('cbing10@gmail.com', '678-345-6789');
INSERT INTO Clients (username,phonenumber)
 VALUES ('hwmit@gmail.com', '678-456-7890');
INSERT INTO Clients (username,phonenumber)
 VALUES ('swilson@gmail.com', '770-123-4567');
INSERT INTO Clients (username,phonenumber)
 VALUES ('aray@tiktok.com', '770-234-5678');
INSERT INTO Clients (username,phonenumber)
 VALUES ('cdemilio@tiktok.com', '770-345-6789');
INSERT INTO Clients (username,phonenumber)
 VALUES ('bshelton@gmail.com', '770-456-7890');
INSERT INTO Clients (username,phonenumber)
 VALUES ('lbryan@gmail.com', '770-567-8901');
INSERT INTO Clients (username,phonenumber)
 VALUES ('tswift@gmail.com', '770-678-9012');
INSERT INTO Clients (username,phonenumber)
 VALUES ('jseinfeld@gmail.com', '770-789-0123');
INSERT INTO Clients (username,phonenumber)
 VALUES ('maddiesmith@gmail.com','770-890-1234');
INSERT INTO Clients (username,phonenumber)
 VALUES ('johnthomas@gmail.com', '404-770-5555');
INSERT INTO Clients (username,phonenumber)
 VALUES ('boblee15@gmail.com', '404-678-5555');

-- 4. Table struture for table Owners
DROP TABLE IF EXISTS Owners;
CREATE TABLE Owners (
username varchar(100) NOT NULL,
FOREIGN KEY (username) REFERENCES Clients (username),
PRIMARY KEY (username)
) ENGINE = InnoDB;

INSERT INTO Owners (username)
 VALUES ('mscott22@gmail.com');
INSERT INTO Owners (username)
 VALUES ('arthurread@gmail.com');
INSERT INTO Owners (username)
 VALUES ('jwayne@gmail.com');
INSERT INTO Owners (username)
 VALUES ('gburdell3@gmail.com');
INSERT INTO Owners (username)
 VALUES ('mj23@gmail.com');
INSERT INTO Owners (username) 
VALUES ('lebron6@gmail.com');
INSERT INTO Owners (username) 
VALUES ('msmith5@gmail.com');
INSERT INTO Owners (username)
 VALUES ('ellie2@gmail.com');
 INSERT INTO Owners (username)
 VALUES ('scooper3@gmail.com');
INSERT INTO Owners (username)
 VALUES ('mgeller5@gmail.com');
INSERT INTO Owners (username)
 VALUES ('cbing10@gmail.com');
INSERT INTO Owners (username)
 VALUES ('hwmit@gmail.com');
 
 -- 5. Table struture for table Property
DROP TABLE IF EXISTS property;
CREATE TABLE property (
username varchar(100) NOT NULL,
pname varchar(100) NOT NULL,
p_description varchar (300) NOT NULL,
street varchar (50) NOT NULL,
city varchar (100) NOT NULL,
state char (2) NOT NULL,
zip char (5) NOT NULL,
costpernight decimal (6,2) NOT NULL,
capacity int (2) NOT NULL,
PRIMARY KEY (username, pname),
FOREIGN KEY (username) REFERENCES Owners (username)
) ENGINE = InnoDB;


Insert into property(pname, username, p_description, capacity, costpernight, street, city, state, zip) 
values ("Atlanta Great Property", "scooper3@gmail.com", "This is right in the middle of Atlanta near many attractions!",4, 600 , "2nd St", "ATL","GA",30008);

Insert into property(pname, username, p_description, capacity, costpernight, street, city, state, zip) 
values ("House near Georgia Tech", "gburdell3@gmail.com",	"Super close to bobby dodde stadium!",	3,	275, 	"North Ave",	"ATL",	"GA",	30008);

Insert into property(pname, username, p_description, capacity, costpernight, street, city, state, zip) 
values ("New York City Property",	"cbing10@gmail.com",	"A view of the whole city. Great property!",	2	,750 ,"123 Main St",	"NYC",	"NY",	10008);

Insert into property(pname, username, p_description, capacity, costpernight, street, city, state, zip) 
values ("Statue of Libery Property",	"mgeller5@gmail.com",	"You can see the statue of liberty from the porch",	5	,1000 ,	"1st St",	"NYC",	"NY",	10009);

Insert into property(pname, username, p_description, capacity, costpernight, street, city, state, zip) 
values ("Los Angeles Property",	"arthurread@gmail.com", "",3	,700 ,	"10th St",	"LA" ,	"CA",	90008);

Insert into property(pname, username, p_description, capacity, costpernight, street, city, state, zip) 
values ("LA Kings House",	"arthurread@gmail.com",	"This house is super close to the LA kinds stadium!",	4,	750 ,	"Kings St",	"LA",	"CA",	90011);

Insert into property(pname, username, p_description, capacity, costpernight, street, city, state, zip) 
values ("Beautiful San Jose Mansion", "arthurread@gmail.com",	"Huge house that can sleep 12 people. Totally worth it!",12	,900 ,	"Golden Bridge Pkwt",	"San Jose",	"CA",	90001);
Insert into property(pname, username, p_description, capacity, costpernight, street, city, state, zip) 
values ("LA Lakers Property",	"lebron6@gmail.com",	"This house is right near the LA lakers stadium. You might even meet Lebron James!",	4,	850, 	"Lebron Ave",	"LA",	"CA",	90011);

Insert into property(pname, username, p_description, capacity, costpernight, street, city, state, zip) 
values ("Chicago Blackhawks House",	"hwmit@gmail.com",	"This is a great property!",	3	,775 ,	"Blackhawks St",	"Chicago",	"IL",	60176);

Insert into property(pname, username, p_description, capacity, costpernight, street, city, state, zip) 
values("Chicago Romantic Getaway",	"mj23@gmail.com",	"This is a great property!",	2	,1050 	,"23rd Main St",	"Chicago",	"IL",	60176);

Insert into property(pname, username, p_description, capacity, costpernight, street, city, state, zip) 
values ("Beautiful Beach Property",	"msmith5@gmail.com",	"You can walk out of the house and be on the beach!",	2	,975 ,	"456 Beach Ave",	"Miami",	"FL",	33101);

Insert into property(pname, username, p_description, capacity, costpernight, street, city, state, zip) 
values ("Family Beach House", "ellie2@gmail.com","You can literally walk onto the beach and see it from the patio!", 6, 850 ,"1132 Beach Ave", 	"Miami", "FL",	33101);
Insert into property(pname, username, p_description, capacity, costpernight, street, city, state, zip) 
values ("Texas Roadhouse",	"mscott22@gmail.com",	"This property is right in the center of Dallas, Texas!",	3	,450 ,	"17th Street",	"Dallas",	"TX",	75043);
Insert into property(pname, username, p_description, capacity, costpernight, street, city, state, zip) 
values ("Texas Longhorns House",	"mscott22@gmail.com",	"You can walk to the longhorns stadium from here!",	10	,600 ,	"1125 Longhorns Way"	,"Dallas",	"TX",	75001);

-- 6. Table struture for table Amenities
DROP TABLE IF EXISTS amenity;
CREATE TABLE amenity (
p_name varchar(100) NOT NULL,
username varchar(100) NOT NULL,
a_name varchar(100) NOT NULL, 
PRIMARY KEY (username,p_name,a_name),   
FOREIGN KEY (username, p_name) REFERENCES property (username, pname)
) ENGINE = InnoDB;

Insert into amenity(p_name, username, a_name)
values ("Atlanta Great Property", "scooper3@gmail.com", "A/C & Heating");
Insert into amenity(p_name, username, a_name)
values ("Atlanta Great Property",	"scooper3@gmail.com",	"Pets allowed");
Insert into amenity(p_name, username, a_name)
values ("Atlanta Great Property",	"scooper3@gmail.com",	"Wifi & TV");
Insert into amenity(p_name, username, a_name)
values ("Atlanta Great Property",	"scooper3@gmail.com",	"Washer and Dryer");
Insert into amenity(p_name, username, a_name)
values ("House near Georgia Tech",	"gburdell3@gmail.com",	"Wifi & TV");
Insert into amenity(p_name, username, a_name)
values ("House near Georgia Tech",	"gburdell3@gmail.com",	"Washer and Dryer");
Insert into amenity(p_name, username, a_name)
values ("House near Georgia Tech",	"gburdell3@gmail.com",	"Full Kitchen");
Insert into amenity(p_name, username, a_name)
values ("New York City Property",	"cbing10@gmail.com",	"A/C & Heating");
Insert into amenity(p_name, username, a_name)
values ("New York City Property",	"cbing10@gmail.com",	"Wifi & TV");
Insert into amenity(p_name, username, a_name)
values ("Statue of Libery Property",	"mgeller5@gmail.com",	"A/C & Heating");
Insert into amenity(p_name, username, a_name)
values ("Statue of Libery Property",	"mgeller5@gmail.com",	"Wifi & TV");
Insert into amenity(p_name, username, a_name)
values ("Los Angeles Property",	"arthurread@gmail.com",	"A/C & Heating");
Insert into amenity(p_name, username, a_name)
values ("Los Angeles Property",	"arthurread@gmail.com",	"Pets allowed");
Insert into amenity(p_name, username, a_name)
values ("Los Angeles Property",	"arthurread@gmail.com",	"Wifi & TV");
Insert into amenity(p_name, username, a_name)
values ("LA Kings House",	"arthurread@gmail.com",	"A/C & Heating");
Insert into amenity(p_name, username, a_name)
values ("LA Kings House",	"arthurread@gmail.com",	"Wifi & TV");
Insert into amenity(p_name, username, a_name)
values ("LA Kings House",	"arthurread@gmail.com",	"Washer and Dryer");
Insert into amenity(p_name, username, a_name)
values ("LA Kings House",	"arthurread@gmail.com",	"Full Kitchen");
Insert into amenity(p_name, username, a_name)
values ("Beautiful San Jose Mansion",	"arthurread@gmail.com",	"A/C & Heating");
Insert into amenity(p_name, username, a_name)
values ("Beautiful San Jose Mansion",	"arthurread@gmail.com",	"Pets allowed");
Insert into amenity(p_name, username, a_name)
values ("Beautiful San Jose Mansion",	"arthurread@gmail.com",	"Wifi & TV");
Insert into amenity(p_name, username, a_name)
values ("Beautiful San Jose Mansion",	"arthurread@gmail.com",	"Washer and Dryer");
Insert into amenity(p_name, username, a_name)
values ("Beautiful San Jose Mansion",	"arthurread@gmail.com",	"Full Kitchen");
Insert into amenity(p_name, username, a_name)
values ("LA Lakers Property",	"lebron6@gmail.com",	"A/C & Heating");
Insert into amenity(p_name, username, a_name)
values ("LA Lakers Property",	"lebron6@gmail.com",	"Wifi & TV");
Insert into amenity(p_name, username, a_name)
values ("LA Lakers Property",	"lebron6@gmail.com",	"Washer and Dryer");
Insert into amenity(p_name, username, a_name)
values ("LA Lakers Property",	"lebron6@gmail.com",	"Full Kitchen");
Insert into amenity(p_name, username, a_name)
values ("Chicago Blackhawks House",	"hwmit@gmail.com",	"A/C & Heating");
Insert into amenity(p_name, username, a_name)
values  ("Chicago Blackhawks House",	"hwmit@gmail.com",	"Wifi & TV");
Insert into amenity(p_name, username, a_name)
values ("Chicago Blackhawks House",	"hwmit@gmail.com",	"Washer and Dryer");
Insert into amenity(p_name, username, a_name)
values ("Chicago Blackhawks House",	"hwmit@gmail.com",	"Full Kitchen");
Insert into amenity(p_name, username, a_name)
values ("Chicago Romantic Getaway",	"mj23@gmail.com",	"A/C & Heating");
Insert into amenity(p_name, username, a_name)
values ("Chicago Romantic Getaway",	"mj23@gmail.com",	"Wifi & TV");
Insert into amenity(p_name, username, a_name)
values ("Beautiful Beach Property",	"msmith5@gmail.com",	"A/C & Heating");
Insert into amenity(p_name, username, a_name)
values ("Beautiful Beach Property",	"msmith5@gmail.com",	"Wifi & TV");
Insert into amenity(p_name, username, a_name)
values ("Beautiful Beach Property",	"msmith5@gmail.com",	"Washer and Dryer");
Insert into amenity(p_name, username, a_name)
values ("Family Beach House",	"ellie2@gmail.com",	"A/C & Heating");
Insert into amenity(p_name, username, a_name)
values ("Family Beach House",	"ellie2@gmail.com",	"Pets allowed");
Insert into amenity(p_name, username, a_name)
values ("Family Beach House",	"ellie2@gmail.com",	"Wifi & TV");
Insert into amenity(p_name, username, a_name)
values ("Family Beach House",	"ellie2@gmail.com",	"Washer and Dryer");
Insert into amenity(p_name, username, a_name)
values ("Family Beach House",	"ellie2@gmail.com",	"Full Kitchen");
Insert into amenity(p_name, username, a_name)
values ("Texas Roadhouse",	"mscott22@gmail.com",	"A/C & Heating");
Insert into amenity(p_name, username, a_name)
values ("Texas Roadhouse",	"mscott22@gmail.com",	"Pets allowed");
Insert into amenity(p_name, username, a_name)
values ("Texas Roadhouse",	"mscott22@gmail.com",	"Wifi & TV");
Insert into amenity(p_name, username, a_name)
values ("Texas Roadhouse",	"mscott22@gmail.com",	"Washer and Dryer");
Insert into amenity(p_name, username, a_name)
values ("Texas Longhorns House",	"mscott22@gmail.com",	"A/C & Heating");
Insert into amenity(p_name, username, a_name)
values ("Texas Longhorns House",	"mscott22@gmail.com",	"Pets allowed");
Insert into amenity(p_name, username, a_name)
values ("Texas Longhorns House",	"mscott22@gmail.com",	"Wifi & TV");
Insert into amenity(p_name, username, a_name)
values ("Texas Longhorns House",	"mscott22@gmail.com",	"Washer and Dryer");
Insert into amenity(p_name, username, a_name)
values ("Texas Longhorns House",	"mscott22@gmail.com",	"Full Kitchen");


-- 7. Table struture for table Customer
DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
username varchar(100) NOT NULL,
creditCardNum char (16) NOT NULL,
CVV char (3) NOT NULL,
expDate date NOT NULL,
currentLocation char(50),
PRIMARY KEY (username),
FOREIGN KEY (username) REFERENCES Clients(username)
) ENGINE = InnoDB;

INSERT INTO customer (username,creditCardNum,CVV,expDate,currentLocation )
 VALUES ('scooper3@gmail.com','6518555974461663','551', '2024-02-01', ''); 
INSERT INTO customer (username,creditCardNum,CVV,expDate,currentLocation )
 VALUES ('mgeller5@gmail.com','2328567043101965','644','2024-03-01', ''); 
INSERT INTO customer (username,creditCardNum,CVV,expDate,currentLocation )
 VALUES ('cbing10@gmail.com','8387952398279291','201', '2023-02-01', ""); 
INSERT INTO customer (username,creditCardNum,CVV,expDate,currentLocation )
 VALUES ('hwmit@gmail.com','6558859698525299','102','2023-04-01', ""); 
INSERT INTO customer (username,creditCardNum,CVV,expDate,currentLocation )
 VALUES ('swilson@gmail.com','9383321241981836','455','2022-08-01', ""); 
 INSERT INTO customer (username,creditCardNum,CVV,expDate,currentLocation )
 VALUES ('aray@tiktok.com','3110266979495605','744','2022-08-01', ""); 
 INSERT INTO customer (username,creditCardNum,CVV,expDate,currentLocation )
 VALUES ('cdemilio@tiktok.com', '2272355540784744', '606', '2025-02-01', ""); 
 INSERT INTO customer (username,creditCardNum,CVV,expDate,currentLocation )
 VALUES ('bshelton@gmail.com','9276763978834273','862','2023-09-01', ''); 
 INSERT INTO customer (username,creditCardNum,CVV,expDate,currentLocation )
 VALUES ('lbryan@gmail.com','4652372688643798','258','2023-05-01', ""); 
 INSERT INTO customer (username,creditCardNum,CVV,expDate,currentLocation )
 VALUES ('tswift@gmail.com','5478842044367471','857','2024-12-01', ''); 
 INSERT INTO customer (username,creditCardNum,CVV,expDate,currentLocation )
 VALUES ('jseinfeld@gmail.com','3616897712963372','295','2022-06-01', ''); 
 INSERT INTO customer (username,creditCardNum,CVV,expDate,currentLocation )
 VALUES ('maddiesmith@gmail.com','9954569863556952','794','2022-07-01', ''); 
 INSERT INTO customer (username,creditCardNum,CVV,expDate,currentLocation )
 VALUES ('johnthomas@gmail.com','7580327437245356','269','2025-10-01', ''); 
 INSERT INTO customer (username,creditCardNum,CVV,expDate,currentLocation )
 VALUES ('boblee15@gmail.com','7907351371614248','858','2025-11-01', ''); 


-- 8. Table struture for table Airline
DROP TABLE IF EXISTS airline;
CREATE TABLE airline (
airlineName varchar (50) NOT NULL,
rating float4 NOT NULL,
PRIMARY KEY (airlineName)
) ENGINE = InnoDB;

 INSERT INTO  airline (airlineName,rating)
 VALUES ('Delta Airlines',4.7); 
 INSERT INTO  airline (airlineName,rating)
 VALUES ('Southwest Airlines',4.4); 
 INSERT INTO  airline (airlineName,rating)
 VALUES ('American Airlines',4.6	); 
 INSERT INTO  airline (airlineName,rating)
 VALUES ('United Airlines',4.2	); 
 INSERT INTO  airline (airlineName,rating)
 VALUES ('JetBlue Airways',3.6	); 
 INSERT INTO  airline (airlineName,rating)
 VALUES ('Spirit Airlines',3.3); 
 INSERT INTO  airline (airlineName,rating)
 VALUES ('WestJet',3.9); 
 INSERT INTO  airline (airlineName,rating)
 VALUES ('Interjet',3.7); 
 -- 9. Table struture for table Airport
DROP TABLE IF EXISTS airport;
CREATE TABLE airport (
airportID char(3) NOT NULL,
airportName varchar (50) NOT NULL,
timeZone varchar(5) NOT NULL,
Street varchar (50) NOT NULL,
City varchar (50) NOT NULL,
State char (2) NOT NULL,
Zip char (5) NOT NULL,
PRIMARY KEY (airportID)
) ENGINE = InnoDB;

INSERT INTO  airport (airportID, airportName, timeZone, Street, City, State, Zip )
 VALUES ('ATL','Atlanta Hartsfield Jackson Airport','EST','6000 N Terminal Pkwy','Atlanta','GA',30320); 
 INSERT INTO  airport (airportID,airportName,timeZone,Street,City,State,Zip )
 VALUES ('JFK','John F Kennedy International Airport','EST','455 Airport Ave','Queens','NY',11430);
INSERT INTO  airport (airportID,airportName,timeZone,Street,City,State,Zip )
 VALUES ('LGA','Laguardia Airport','EST','790 Airport St','Queens','NY',11371);
 INSERT INTO  airport (airportID,airportName,timeZone,Street,City,State,Zip )
 VALUES ('LAX','Lost Angeles International Airport','PST','1 World Way','Los Angeles','CA',90045);
 INSERT INTO  airport (airportID,airportName,timeZone,Street,City,State,Zip )
 VALUES ('SJC','Norman Y. Mineta San Jose International Airport','PST','1702 Airport Blvd','San Jose','CA',95110);
INSERT INTO  airport (airportID,airportName,timeZone,Street,City,State,Zip )
 VALUES ('ORD',"O'Hare International Airport",'CST',"10000 W O'Hare Ave",'Chicago','IL',60666);
INSERT INTO  airport (airportID,airportName,timeZone,Street,City,State,Zip )
 VALUES ('MIA','Miami International Airport','EST','2100 NW 42nd Ave','Miami','FL',33126);
 INSERT INTO  airport (airportID,airportName,timeZone,Street,City,State,Zip )
 VALUES ('DFW','Dallas International Airport','CST','2400 Aviation DR','Dallas','TX',75261);

 -- 10. Table struture for table Flight
DROP TABLE IF EXISTS flight;
CREATE TABLE flight (
flightNum varchar (4) NOT NULL,
airlineName varchar (50) NOT NULL,
depart_from char (3) NOT NULL,
arrive_at char (3) NOT NULL,
departureTime time NOT NULL,
arrivalTime time NOT NULL,
departingDate date NOT NULL,
costPerSeat decimal (5, 2) NOT NULL,
capacity int  NOT NULL,
PRIMARY KEY (airlineName, flightNum),
FOREIGN KEY (airlineName) REFERENCES airline(airlineName), 
FOREIGN KEY (depart_from) REFERENCES airport(airportID),
FOREIGN KEY (arrive_at) REFERENCES airport(airportID)
) ENGINE = InnoDB;

  INSERT INTO  flight(flightNum,airlineName ,depart_from,arrive_at,departureTime,arrivalTime,departingDate,costPerSeat,capacity)
 VALUES (1,'Delta Airlines','ATL','JFK',"10:00","24:00" ,"2021-10-18",400,150); 
 INSERT INTO  flight(flightNum,airlineName  ,depart_from,arrive_at,departureTime,arrivalTime,departingDate,costPerSeat,capacity)
 VALUES (2,'Southwest Airlines','ORD','MIA',"10:30","14:30","2021-10-18",350,125); 
 INSERT INTO  flight(flightNum,airlineName  ,depart_from,arrive_at,departureTime,arrivalTime,departingDate,costPerSeat,capacity)
 VALUES (3,'American Airlines','MIA','DFW',"13:00","16:00","2021-10-18",350,125); 
 INSERT INTO  flight(flightNum,airlineName  ,depart_from,arrive_at,departureTime,arrivalTime,departingDate,costPerSeat,capacity)
 VALUES (4,'United Airlines','ATL','LGA',"16:30","18:30","2021-10-18",400,100); 
 INSERT INTO  flight(flightNum,airlineName  ,depart_from,arrive_at,departureTime,arrivalTime,departingDate,costPerSeat,capacity)
 VALUES (5,'JetBlue Airways','LGA','ATL',"11:00","13:00","2021-10-19",400,130); 
 INSERT INTO  flight(flightNum,airlineName  ,depart_from,arrive_at,departureTime,arrivalTime,departingDate,costPerSeat,capacity)
 VALUES (6,'Spirit Airlines','SJC','ATL',"12:30","21:30","2021-10-19",650,140);
 INSERT INTO  flight(flightNum,airlineName  ,depart_from,arrive_at,departureTime,arrivalTime,departingDate,costPerSeat,capacity)
 VALUES (7,'WestJet','LGA','SJC',"13:00","16:00","2021-10-19",700,100); 
 INSERT INTO  flight(flightNum,airlineName  ,depart_from,arrive_at,departureTime,arrivalTime,departingDate,costPerSeat,capacity)
 VALUES (8,'Interjet','MIA','ORD',"19:30","21:30","2021-10-19",350,125); 
 INSERT INTO  flight(flightNum,airlineName  ,depart_from,arrive_at,departureTime,arrivalTime,departingDate,costPerSeat,capacity)
 VALUES (9,'Delta Airlines','JFK','ATL', "8:00", "10:00","2021-10-20",375,150); 
 INSERT INTO  flight(flightNum,airlineName  ,depart_from,arrive_at,departureTime,arrivalTime,departingDate,costPerSeat,capacity)
 VALUES (10,'Delta Airlines','LAX','ATL',"9:15","18:15","2021-10-20",700,110);
 INSERT INTO  flight(flightNum,airlineName  ,depart_from,arrive_at,departureTime,arrivalTime,departingDate,costPerSeat,capacity)
 VALUES (11,'Southwest Airlines','LAX','ORD',"12:07","19:07","2021-10-20",600,95); 
 INSERT INTO  flight(flightNum,airlineName  ,depart_from,arrive_at,departureTime,arrivalTime,departingDate,costPerSeat,capacity)
 VALUES (12,'United Airlines','MIA','ATL',"15:35","17:35","2021-10-20",275,115);  
 -- 11. Table struture for table Attractions
DROP TABLE IF EXISTS attraction;
CREATE TABLE attraction (
airportID char (3) NOT NULL,
attractionName varchar (50) NOT NULL,
PRIMARY KEY (airportID, attractionName),
FOREIGN KEY (airportID) REFERENCES airport(airportID)
) ENGINE = InnoDB;

 INSERT INTO  attraction (airportID,attractionName)
 VALUES ('ATL','The Coke Factory'); 
 INSERT INTO  attraction (airportID,attractionName)
 VALUES ('ATL','The Georgia Aquarium'); 
 INSERT INTO  attraction (airportID,attractionName)
 VALUES ('JFK',	'The Statue of Liberty'); 
 INSERT INTO  attraction (airportID,attractionName)
 VALUES ("JFK","The Empire State Building"); 
 INSERT INTO  attraction (airportID,attractionName)
 VALUES ("LGA","The Statue of Liberty"); 
 INSERT INTO  attraction (airportID,attractionName)
 VALUES ("LGA",	"The Empire State Building"); 
 INSERT INTO  attraction (airportID,attractionName)
 VALUES ('LAX','Lost Angeles Lakers Stadium'); 
 INSERT INTO  attraction (airportID,attractionName)
 VALUES ('LAX','Los Angeles Kings Stadium'); 
 INSERT INTO  attraction (airportID,attractionName)
 VALUES ('SJC','Winchester Mystery House'); 
 INSERT INTO  attraction (airportID,attractionName)
 VALUES ('SJC','San Jose Earthquakes Soccer Team'); 
 INSERT INTO  attraction (airportID,attractionName)
 VALUES ('ORD','Chicago Blackhawks Stadium'); 
 INSERT INTO  attraction (airportID,attractionName)
 VALUES ('ORD',	'Chicago Bulls Stadium'); 
 INSERT INTO  attraction (airportID,attractionName)
 VALUES ('MIA','Crandon Park Beach'); 
 INSERT INTO  attraction (airportID,attractionName)
 VALUES ('MIA',	'Miami Heat Basketball Stadium'); 
 INSERT INTO  attraction (airportID,attractionName)
 VALUES ('DFW','Texas Longhorns Stadium'); 
 INSERT INTO  attraction (airportID,attractionName)
 VALUES ('DFW','The Original Texas Roadhouse'); 
 
 -- 12. Table struture for table Book
DROP TABLE IF EXISTS book;
CREATE TABLE book (
customer_username varchar(100) NOT NULL,
flight_name varchar(50) NOT NULL,
flightNum varchar (4) NOT NULL,
numberOfSeat int(3) NOT NULL,
PRIMARY KEY (customer_username, flight_name, flightNum),
FOREIGN KEY (customer_username) REFERENCES customer(username),
FOREIGN KEY (flight_name, flightNum) REFERENCES flight(airlineName, flightNum) 
) ENGINE = InnoDB;

INSERT INTO  book (customer_username, flightNum, flight_name, numberOfSeat)
 VALUES ('swilson@gmail.com', 5, 'JetBlue Airways', 3); 
 INSERT INTO  book (customer_username, flightNum, flight_name, numberOfSeat)
 VALUES ('aray@tiktok.com', 1, 	'Delta Airlines', 2);
 INSERT INTO  book (customer_username, flightNum, flight_name, numberOfSeat)
 VALUES ('bshelton@gmail.com', 4, 'United Airlines', 4);
 INSERT INTO  book (customer_username, flightNum, flight_name, numberOfSeat)
 VALUES ('lbryan@gmail.com', 7, 'WestJet',	2);
 INSERT INTO  book (customer_username, flightNum, flight_name, numberOfSeat)
 VALUES ('tswift@gmail.com',7, 'WestJet',	2);
 INSERT INTO  book (customer_username, flightNum, flight_name, numberOfSeat)
 VALUES ('jseinfeld@gmail.com',7, 'WestJet',4);
 INSERT INTO  book (customer_username, flightNum, flight_name, numberOfSeat)
 VALUES ('maddiesmith@gmail.com', 8, 'Interjet',	2);
 INSERT INTO  book (customer_username, flightNum, flight_name, numberOfSeat)
 VALUES ('cbing10@gmail.com', 2, 'Southwest Airlines', 2);
 INSERT INTO  book (customer_username, flightNum, flight_name, numberOfSeat)
 VALUES ('hwmit@gmail.com', 2, 'Southwest Airlines', 5);

-- 13. Table struture for table Is related by
DROP TABLE IF EXISTS IsRatedBy;
CREATE TABLE IsRatedBy (
Owners_username varchar (100) NOT NULL,
customer_username varchar (100) NOT NULL,
score int,
PRIMARY KEY (customer_username, Owners_username),
FOREIGN KEY (customer_username) REFERENCES customer(username),
FOREIGN KEY (Owners_username) REFERENCES Owners(username)
) ENGINE = InnoDB;

 INSERT INTO  IsRatedBy (Owners_username,customer_username,score)
 VALUES ('gburdell3@gmail.com','swilson@gmail.com',5); 
 INSERT INTO  IsRatedBy (Owners_username,customer_username,score)
 VALUES ('cbing10@gmail.com','aray@tiktok.com',5); 
 INSERT INTO  IsRatedBy (Owners_username,customer_username,score)
 VALUES ('mgeller5@gmail.com','bshelton@gmail.com',4); 
 INSERT INTO  IsRatedBy (Owners_username,customer_username,score)
 VALUES ('arthurread@gmail.com','lbryan@gmail.com',4); 
 INSERT INTO  IsRatedBy (Owners_username,customer_username,score)
 VALUES ('arthurread@gmail.com','tswift@gmail.com',3); 
 INSERT INTO  IsRatedBy (Owners_username,customer_username,score)
 VALUES ('lebron6@gmail.com','jseinfeld@gmail.com',2); 
 INSERT INTO  IsRatedBy (Owners_username,customer_username,score)
 VALUES ('hwmit@gmail.com','maddiesmith@gmail.com',5); 
 
 -- 14. Table struture for table Rate
DROP TABLE IF EXISTS rate;
CREATE TABLE rate (
Owners_username varchar (100) NOT NULL,
customer_username varchar (100) NOT NULL,
score int NOT NULL,
PRIMARY KEY (customer_username, Owners_username),
FOREIGN KEY (customer_username) REFERENCES customer(username),
FOREIGN KEY (Owners_username) REFERENCES Owners(username)
) ENGINE = InnoDB;
 INSERT INTO  rate (Owners_username,customer_username,score)
 VALUES ('gburdell3@gmail.com','swilson@gmail.com',5); 
  INSERT INTO  rate (Owners_username,customer_username,score)
 VALUES ('cbing10@gmail.com','aray@tiktok.com',5); 
  INSERT INTO  rate (Owners_username,customer_username,score)
 VALUES ('mgeller5@gmail.com','bshelton@gmail.com',3); 
  INSERT INTO  rate (Owners_username,customer_username,score)
 VALUES ('arthurread@gmail.com','lbryan@gmail.com',4); 
  INSERT INTO  rate (Owners_username,customer_username,score)
 VALUES ('arthurread@gmail.com','tswift@gmail.com',4); 
  INSERT INTO  rate (Owners_username,customer_username,score)
 VALUES ('lebron6@gmail.com','jseinfeld@gmail.com',1); 
  INSERT INTO  rate (Owners_username,customer_username,score)
 VALUES ('hwmit@gmail.com','maddiesmith@gmail.com',2); 


-- 15. Table struture for table Reserve
DROP TABLE IF EXISTS reserve;
CREATE TABLE reserve (
customer_username varchar (100) NOT NULL,
Owners_username varchar (100) NOT NULL,
p_name varchar (50) NOT NULL,
start_date date NOT NULL,
end_date date NOT NULL,
numberOfGuest int NOT NULL,
PRIMARY KEY (customer_username, Owners_username, p_name),
FOREIGN KEY (customer_username) REFERENCES customer(username),
FOREIGN KEY (Owners_username, p_name) REFERENCES property(username, pname)
) ENGINE = InnoDB;
 
 INSERT INTO  reserve (p_name, Owners_username, customer_username, start_date, end_date, numberOfGuest)
 VALUES ('House near Georgia Tech',	'gburdell3@gmail.com', 'swilson@gmail.com', '2021-10-19', '2021-10-25',3); 
 INSERT INTO  reserve (p_name,Owners_username, customer_username, start_date, end_date, numberOfGuest)
 VALUES ('New York City Property','cbing10@gmail.com','aray@tiktok.com','2021-10-18',	'2021-10-23',2); 
 INSERT INTO  reserve (p_name,Owners_username, customer_username, start_date, end_date, numberOfGuest)
 VALUES ('New York City Property',	'cbing10@gmail.com',	'cdemilio@tiktok.com',	'2021-10-24',	'2021-10-30'	,2); 
 INSERT INTO  reserve (p_name,Owners_username, customer_username, start_date, end_date, numberOfGuest)
 VALUES ('Statue of Libery Property'	,'mgeller5@gmail.com',	'bshelton@gmail.com',	'2021-10-18',	'2021-10-22',	4); 
 INSERT INTO  reserve (p_name,Owners_username, customer_username, start_date, end_date, numberOfGuest)
 VALUES ('Los Angeles Property',	'arthurread@gmail.com',	'lbryan@gmail.com',	'2021-10-19',	'2021-10-25'	,2); 
 INSERT INTO  reserve (p_name,Owners_username, customer_username, start_date, end_date, numberOfGuest)
 VALUES ('Beautiful San Jose Mansion',	'arthurread@gmail.com',	'tswift@gmail.com',	'2021-10-19',	'2021-10-22',10); 
 INSERT INTO  reserve (p_name,Owners_username, customer_username, start_date, end_date, numberOfGuest)
 VALUES ('LA Lakers Property',	'lebron6@gmail.com',	'jseinfeld@gmail.com',	'2021-10-19'	,'2021-10-24'	,4); 
 INSERT INTO  reserve (p_name,Owners_username, customer_username, start_date, end_date, numberOfGuest)
 VALUES ('Chicago Blackhawks House',	'hwmit@gmail.com',	'maddiesmith@gmail.com',	'2021-10-19'	,'2021-10-23',	2); 
 INSERT INTO  reserve (p_name,Owners_username, customer_username, start_date, end_date, numberOfGuest)
 VALUES ('Chicago Romantic Getaway',	'mj23@gmail.com'	,'aray@tiktok.com'	,'2021-11-01'	,'2021-11-07'	,2); 
 INSERT INTO  reserve (p_name,Owners_username, customer_username, start_date, end_date, numberOfGuest)
 VALUES ('Beautiful Beach Property',	'msmith5@gmail.com'	,'cbing10@gmail.com','2021-10-18','2021-10-25'	,2); 
 INSERT INTO  reserve (p_name,Owners_username, customer_username, start_date, end_date, numberOfGuest)
 VALUES ('Family Beach House',	'ellie2@gmail.com',	'hwmit@gmail.com'	,'2021-10-18'	,'2021-10-28'	,5); 

-- 16. Table struture for table Review
DROP TABLE IF EXISTS review;
CREATE TABLE review (
p_name varchar (50) NOT NULL,
Owners_username varchar (100) NOT NULL,
customer_username varchar (100) NOT NULL,
content varchar (300) NOT NULL,
score int NOT NULL,
PRIMARY KEY (customer_username, Owners_username, p_name),
FOREIGN KEY (customer_username) REFERENCES customer(username),
FOREIGN KEY (Owners_username, p_name) REFERENCES property(username, pname)
) ENGINE = InnoDB;

 INSERT INTO  review (p_name,Owners_username,customer_username,content,score)
 VALUES ('House near Georgia Tech','gburdell3@gmail.com','swilson@gmail.com','
 This was so much fun. I went and saw the coke factory, the falcons play, GT play, and the Georgia aquarium. Great time! Would highly recommend!',5); 
 INSERT INTO  review (p_name,Owners_username,customer_username,content,score)
 VALUES ('New York City Property','cbing10@gmail.com','aray@tiktok.com','This was the best 5 days ever! I saw so much of NYC!',5); 
 INSERT INTO  review (p_name,Owners_username,customer_username,content,score)
 VALUES ('Statue of Libery Property','mgeller5@gmail.com','bshelton@gmail.com','This was truly an excellent experience. I really could see the Statue of Liberty from the property!',4
); 
 INSERT INTO  review (p_name,Owners_username,customer_username,content,score)
 VALUES ('Los Angeles Property','arthurread@gmail.com','lbryan@gmail.com','I had an excellent time!',4
); 
 INSERT INTO  review (p_name,Owners_username,customer_username,content,score)
 VALUES ('Beautiful San Jose Mansion','arthurread@gmail.com','tswift@gmail.com',"We had a great time, but the house wasn't fully cleaned when we arrived",3
); 
 INSERT INTO  review (p_name,Owners_username,customer_username,content,score)
 VALUES ( 'LA Lakers Property','lebron6@gmail.com','jseinfeld@gmail.com','I was disappointed that I did not meet lebron james',2
); 
 INSERT INTO  review (p_name,Owners_username,customer_username,content,score)
 VALUES ('Chicago Blackhawks House','hwmit@gmail.com','maddiesmith@gmail.com','This was awesome! I met one player on the chicago blackhawks!',5
); 


-- 17. Table struture for table Is close to
DROP TABLE IF EXISTS isCloseTo;
CREATE TABLE isCloseTo (
p_name varchar (50) NOT NULL,
Owners_username varchar(100) NOT NULL,
airportID char(3) NOT NULL,
distance int NOT NULL,
PRIMARY KEY (p_name, Owners_username, airportID),
FOREIGN KEY (airportID) REFERENCES airport(airportID),
FOREIGN KEY (Owners_username,p_name) REFERENCES property(username, pname)
) ENGINE = InnoDB;

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("Atlanta Great Property",	"scooper3@gmail.com",	"ATL",	12);

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("House near Georgia Tech",	"gburdell3@gmail.com",	"ATL",	7);

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("New York City Property",	"cbing10@gmail.com",	"JFK",	10);

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("Statue of Libery Property",	"mgeller5@gmail.com",	"JFK",	8);

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("New York City Property",	"cbing10@gmail.com",	"LGA",	25);

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("Statue of Libery Property",	"mgeller5@gmail.com",	"LGA",	19);

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("Los Angeles Property",	"arthurread@gmail.com",	"LAX",	9
);

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("LA Kings House",	"arthurread@gmail.com",	"LAX",	12);

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("Beautiful San Jose Mansion",	"arthurread@gmail.com",	"SJC",	8);

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("Beautiful San Jose Mansion",	"arthurread@gmail.com",	"LAX",	30);

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("LA Lakers Property",	"lebron6@gmail.com",	"LAX",	6);

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("Chicago Blackhawks House",	"hwmit@gmail.com",	"ORD",	11);

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("Chicago Romantic Getaway",	"mj23@gmail.com",	"ORD",	13);

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("Beautiful Beach Property",	"msmith5@gmail.com",	"MIA",	21);

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("Family Beach House",	"ellie2@gmail.com",	"MIA",	19);

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("Texas Roadhouse",	"mscott22@gmail.com",	"DFW",	8);

Insert into isCloseTo (p_name, Owners_username, airportID, distance)
values ("Texas Longhorns House",	"mscott22@gmail.com",	"DFW",	17);


