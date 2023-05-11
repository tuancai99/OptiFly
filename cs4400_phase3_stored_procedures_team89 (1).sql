-- CS4400: Introduction to Database Systems (Fall 2021)
-- Phase III: Stored Procedures & Views [v0] Tuesday, November 9, 2021 @ 12:00am EDT
-- Team 89
-- Team Member Quyen Pham (qpham36)
-- Team Member Tuan Cai (tcai44)
-- Team Member Eric Xu (exu31)
-- Team Member Jay Sandeep Mulay (jmulay3)
-- Directions:
-- Please follow all instructions for Phase III as listed on Canvas.
-- Fill in the team number and names and GT usernames for all members above.


-- ID: 1a
-- Name: register_customer
drop procedure if exists register_customer;
delimiter //
create procedure register_customer (
    in i_email varchar(50),
    in i_first_name varchar(100),
    in i_last_name varchar(100),
    in i_password varchar(50),
    in i_phone_number char(12),
    in i_cc_number varchar(19),
    in i_cvv char(3),
    in i_exp_date date,
    in i_location varchar(50)
) 
sp_main: begin
IF  exists (Select Email From customer Where Email = i_email)
THEN leave sp_main; 
END IF;

IF exists (Select Phone_Number From Clients Where Phone_Number = i_phone_number)
THEN leave sp_main; 
END if;

IF exists (Select CcNumber From customer Where CcNumber = i_cc_number) 
THEN leave sp_main; 
END IF;

IF exists (Select Email From clients)
THEN 
	IF not exists(Select CcNumber From customer where CcNumber = i_cc_number )
	THEN
		Insert into accounts value (i_email,i_first_name, i_last_name, i_password); 
		Insert into clients value (i_email, i_phone_number); 
		Insert into customer value (i_email, 
									i_cc_number, i_cvv, i_exp_date, i_location); 
	END IF;
END IF;
end //
delimiter ;

call register_customer('falcon@gmail.com', 'Samuel', 'Wilson', 'password22', '777-469-5347', 
'9121 2762 7467 5215', '809', '2022-05-11', 'Baton Rouge');

-- ID: 1b
-- Name: register_owner
drop procedure if exists register_owner;
delimiter //
create procedure register_owner (
    in i_email varchar(50),
    in i_first_name varchar(100),
    in i_last_name varchar(100),
    in i_password varchar(50),
    in i_phone_number char(12)
) 
sp_main: begin
If i_email not in (Select Email From owners)
	and i_phone_number not in (Select Phone_Number From Clients)
	Then
		Insert into accounts value (i_email, i_first_name, i_last_name, i_password); 
		Insert into clients value (i_email, i_phone_number); 
		Insert into owners value (i_email);
End if; 

IF exists(Select Email From customer where Email = i_email)
THEN
		Insert into accounts value (i_email,i_first_name, i_last_name, i_password); 
		Insert into clients value (i_email, i_phone_number); 
		Insert into owners value (i_email); 
	END IF;

end //
delimiter ;

call register_owner('worldchampion@gmail.com', 'Magnus', 'Carlsen', 
'password25', '404-720-5367');

-- ID: 1c
-- Name: remove_owner
drop procedure if exists remove_owner;
delimiter //
create procedure remove_owner (
    in i_owner_email varchar(50)
)
sp_main: begin
-- 1. If not an owner
If i_owner_email not in (Select Email From owners) then leave sp_main;
End if;
-- 2. if is an owner, but not contain any property
If i_owner_email not in (Select Owner_Email From property)
Then
	-- 2. Case 1: if is a customer
	-- If an owner is deleted, their reviews of customers should be deleted as well
    -- If an owner is deleted, customer reviews of the owner should be deleted as well
    If i_owner_email in (Select Email From customer)
    Then
		Delete From owners Where Email = i_owner_email;
		Delete From customers_rate_owners Where Owner_Email = i_owner_email;
        Delete From owners_rate_customers Where Owner_Email = i_owner_email;
    Else 
		-- 2. Case 2: is is not a customer
		Delete From owners Where Email = i_owner_email;
		Delete From customers_rate_owners Where Owner_Email = i_owner_email;
        Delete From owners_rate_customers Where Owner_Email = i_owner_email;
        Delete From clients Where Email = i_owner_email;
        Delete From accounts Where Email = i_owner_email;
    End if;
End if;
end //
delimiter ;

call remove_owner('jseinfeld@gmail.com');

-- ID: 2a
-- Name: schedule_flight

drop procedure if exists schedule_flight;
delimiter //
create procedure schedule_flight (
    in i_flight_num char(5),
    in i_airline_name varchar(50),
    in i_from_airport char(3),
    in i_to_airport char(3),
    in i_departure_time time,
    in i_arrival_time time,
    in i_flight_date date,
    in i_cost decimal(6, 2),
    in i_capacity int,
    in i_current_date date
)
sp_main: begin
-- TODO: Implement your solution here
-- 1. The flight has the same to_airport and from_airport
if (i_from_airport = i_to_airport) Then leave sp_main; End if;

-- 2. The flight date must be in the future
if (i_current_date >= i_flight_date) then leave sp_main; End if;
-- 3. departure time < arrival time 
if (i_departure_time > i_arrival_time) then leave sp_main; End if;

-- 4. The flightNum + Airline'Name = unique
if i_flight_num not in (Select Flight_Num
From flight)
Then 
Insert into flight value (i_flight_num, i_airline_name,i_from_airport, i_to_airport,
			i_departure_time, i_arrival_time, i_flight_date, i_cost, i_capacity);
else 
-- 5. Flight # is not unique --> check the airline_Name
	If i_airline_name not in (Select airline_Name
	From flight where Flight_Num = i_flight_num)
	Then 
    Insert into flight value (i_flight_num,i_airline_name,i_from_airport, i_to_airport,
			i_departure_time, i_arrival_time, i_flight_date, i_cost, i_capacity);
	Else leave sp_main;
    End if;
End if;
end //
delimiter ;
-- Test: 
call schedule_flight('3', 'Southwest Airlines', 'MIA','DFW', '130000', '160000', '2021-10-18', 350, 125, '2021-10-04');
-- ID: 2b
-- Name: remove_flight
drop procedure if exists remove_flight;
delimiter //
create procedure remove_flight ( 
    in i_flight_num char(5),
    in i_airline_name varchar(50),
    in i_current_date date
) 
sp_main: begin
-- TODO: Implement your solution here
If i_current_date <= (Select Flight_Date From flight Where i_airline_name = Airline_Name and i_flight_num = Flight_Num)
Then 
Delete From book Where i_airline_name = Airline_Name and i_flight_num = Flight_Num;
Delete From flight where i_airline_name = Airline_Name and i_flight_num = Flight_Num;
End if;
end //
delimiter ;
call remove_flight('2', 'Southwest Airlines', '2021-08-01');

-- ID: 3a
-- Name: book_flight
drop procedure if exists book_flight;
delimiter //
create procedure book_flight (
    in i_customer_email varchar(50),
    in i_flight_num char(5),
    in i_airline_name varchar(50),
    in i_num_seats int,
    in i_current_date date
)
sp_main: begin
-- TODO: Implement your solution here
-- 1. Check the date
If (i_current_date >= (Select Flight_Date From flight 
    Where Flight_Num = i_flight_num and Airline_Name = i_airline_name)) then leave sp_main; 
    End if;
    
-- 2. The number of seats left on the flight is greater than or equal to the number of seats to be booked.
Select Capacity into @capacity From flight Where Flight_Num = i_flight_num and Airline_Name = i_airline_name;
If exists (Select Flight_Num, Airline_Name, Was_Cancelled 
From book Where Airline_Name = i_airline_name and Flight_Num = i_flight_num and not Was_Cancelled)
Then
    select sum(Num_Seats) into @booked_seats From book 
	Where Flight_Num = i_flight_num and Airline_Name = i_airline_name and not Was_Cancelled;    
		If (@capacity - @booked_seats) < i_num_seats
			Then leave sp_main; 
		End if;
End if;

-- 3. If the customer not yet book that flight
If i_customer_email not in (Select Customer
From book Where Customer = i_customer_email and Flight_Num = i_flight_num 
and Airline_Name = i_airline_name)
Then
-- Check if customer already book a flight on that date
	Select Flight_Date into @booking_date From flight
    
    Where Flight_Num = i_flight_num and Airline_Name = i_airline_name;
	If i_customer_email not in (Select Customer From book join flight 
    Where book.Airline_Name = flight.Airline_Name and book.Flight_Num = flight.Airline_Name
    and not Was_Cancelled and Flight_Date = @booking_date and Customer = i_customer_email)
    Then
		Insert into book values (i_customer_email, i_flight_num ,i_airline_name, i_num_seats, false);
	End if; 
Elseif (Select Customer, Flight_Number, Airline_Name, Was_Cancelled From book
    Where Customer = i_customer_email and Flight_Num = i_flight_num 
    and Airline_Name = i_airline_name and not Was_Cancelled)
    Then
	Update book SET Num_Seats = Num_Seats + i_num_seats; 
Else 
	leave sp_main;
End if;

end //
delimiter ;
call book_flight('scooper3@gmail.com', '2', 'Southwest Airlines', 122, '2021-10-01');

-- ID: 3b
-- Name: cancel_flight_booking
drop procedure if exists cancel_flight_booking;
delimiter //
create procedure cancel_flight_booking ( 
    in i_customer_email varchar(50),
    in i_flight_num char(5),
    in i_airline_name varchar(50),
    in i_current_date date
)
sp_main: begin
-- TODO: Implement your solution here
IF exists (SELECT CONCAT(Customer, Flight_Num, Airline_Name), Was_Cancelled, Flight_Num, Airline_Name FROM Book 
WHERE CONCAT(Customer, Flight_Num, Airline_Name) = CONCAT(i_customer_email, i_flight_num, i_airline_name) AND
Was_Cancelled = 0 AND
Flight_Num = i_flight_num AND
Airline_Name = i_airline_name
) THEN
	IF exists (SELECT CONCAT(Flight_Num, Airline_Name), Flight_Date FROM Flight
    WHERE CONCAT(Flight_Num, Airline_Name) = CONCAT(i_flight_num, i_airline_name) AND Flight_Date > i_current_date) THEN
		UPDATE Book 
		SET Was_Cancelled = 1 
		WHERE Customer = i_customer_email and Flight_Num = i_flight_num and Airline_Name = i_airline_name; 
    END IF;
END IF;
end //
delimiter ;

call cancel_flight_booking('bshelton@gmail.com', '4', 'United Airlines', '2021-10-01');

-- ID: 3b
-- Name: cancel_flight_booking
drop procedure if exists cancel_flight_booking;
delimiter //
create procedure cancel_flight_booking ( 
    in i_customer_email varchar(50),
    in i_flight_num char(5),
    in i_airline_name varchar(50),
    in i_current_date date
)
sp_main: begin
-- TODO: Implement your solution here
IF exists (SELECT CONCAT(Customer, Flight_Num, Airline_Name), Was_Cancelled, Flight_Num, Airline_Name FROM Book 
WHERE CONCAT(Customer, Flight_Num, Airline_Name) = CONCAT(i_customer_email, i_flight_num, i_airline_name) AND
Was_Cancelled = 0 AND
Flight_Num = i_flight_num AND
Airline_Name = i_airline_name
) THEN
	IF exists (SELECT CONCAT(Flight_Num, Airline_Name), Flight_Date FROM Flight
    WHERE CONCAT(Flight_Num, Airline_Name) = CONCAT(i_flight_num, i_airline_name) AND Flight_Date > i_current_date) THEN
		UPDATE Book 
		SET Was_Cancelled = 1 
		WHERE Customer = i_customer_email and Flight_Num = i_flight_num and Airline_Name = i_airline_name; 
    END IF;
END IF;
end //
delimiter ;

call cancel_flight_booking('bshelton@gmail.com', '4', 'United Airlines', '2021-10-01');
-- Error Code: 1305. PROCEDURE travel_reservation_service.cancel_flight_booking does not exist

-- Error Code: 1054. Unknown column 'Start_Date' in 'field list'
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.


-- ID: 3c
-- Name: view_flight
create or replace view view_flight (
    flight_id,
    flight_date,
    airline,
    destination,
    seat_cost,
    num_empty_seats,
    total_spent
) as
-- TODO: replace this select query with your solution
select 
Flight.Flight_Num as flight_id, 
Flight.Flight_Date as flight_date, 
Flight.Airline_Name as airline, 
Flight.To_Airport as destination, 
Flight.Cost as seat_cost, 
(Flight.Capacity - IFNULL(SUM(Book.Num_Seats * if(Book.Was_Cancelled, 0, 1)), 0)) as num_empty_seats, 
IFNULL(SUM(Book.Num_Seats * Flight.Cost * if(Book.Was_Cancelled, 0.2, 1)), 0) as total_spent
 from Flight left join Book on Flight.Flight_Num = Book.Flight_Num and Flight.Airline_Name = Book.Airline_Name
 group by flight_id, airline;
 
 select * from view_flight;


-- ID: 4a
-- Name: add_property
drop procedure if exists add_property;
delimiter //
create procedure add_property (
    in i_property_name varchar(50),
    in i_owner_email varchar(50),
    in i_description varchar(500),
    in i_capacity int,
    in i_cost decimal(6, 2),
    in i_street varchar(50),
    in i_city varchar(50),
    in i_state char(2),
    in i_zip char(5),
    in i_nearest_airport_id char(3),
    in i_dist_to_airport int
) 
sp_main: begin
-- CHECK IF VALID INPUT
IF (i_nearest_airport_id = NULL or i_dist_to_airport = NULL) THEN
	leave sp_main; 
END IF;

-- DEAL WITH COMPOSITE
IF  exists (Select Street From Property Where Street = i_street) THEN 
	IF exists (Select City From Property Where City = i_city) THEN
		IF exists (Select State From Property Where State = i_state) THEN
			IF exists (Select Zip From Property Where Zip = i_zip) THEN 
				leave sp_main; 
            END IF;
		END IF;
	END IF;
END IF;

-- else where address is not in the the table
IF exists (SELECT CONCAT(Property_Name, Owner_Email) FROM Property WHERE CONCAT(Property_Name, Owner_Email) = CONCAT(i_property_name, i_owner_email))
		or not exists(Select AirPort_ID From Airport Where AirPort_ID = i_nearest_airport_id) THEN 
		INSERT INTO Property value (i_property_name, i_owner_email, i_description, i_capacity, i_cost, i_street, i_city, i_state, i_zip); 
ELSE
		INSERT INTO Property VALUE (i_property_name, i_owner_email, i_description, i_capacity, i_cost, i_street, i_city, i_state, i_zip); 
		INSERT INTO Is_Close_To VALUE (i_property_name, i_owner_email, i_nearest_airport_id, i_dist_to_airport);   
END IF;
end //
delimiter ;

call add_property('Dunder Mifflin', 'mscott22@gmail.com', 'A great paper company for an overnight stay!', 15, 50.00, 'Slough Avenue', 'Scranton', 'PA', 18503, 'LGA', 135); 


-- ID: 4b
-- Name: remove_property
drop procedure if exists remove_property;
delimiter //
create procedure remove_property (
    in i_property_name varchar(50),
    in i_owner_email varchar(50),
    in i_current_date date
)
sp_main: begin
-- IF exists (SELECT CONCAT(Property_Name, Owner_Email) FROM Property WHERE CONCAT(Property_Name, Owner_Email) = CONCAT(i_property_name, i_owner_email)) THEN -- check if property is valid
-- 	IF exists (SELECT CONCAT(Property_Name, Owner_Email) FROM Reserve WHERE CONCAT(Property_Name, Owner_Email) = CONCAT(i_property_name, i_owner_email)) THEN
--     
-- 		IF exists (SELECT Start_Date, End_Date FROM Reserve WHERE i_current_date between Start_Date and End_Date ) THEN
-- 			IF exists (SELECT Was_Cancelled FROM Reserve Where Was_Cancelled = 1) THEN -- cancelled
-- 				Delete From Reserve Where Property_Name = i_property_name and Owner_Email = i_owner_email;
-- 				Delete From Review Where Property_Name = i_property_name and Owner_Email = i_owner_email;
-- 				Delete From Amenity Where Property_Name = i_property_name and Property_Owner = i_owner_email;
-- 				Delete From Is_Close_To Where Property_Name = i_property_name and Owner_Email = i_owner_email;
-- 				Delete From Property Where Property_Name = i_property_name and Owner_Email = i_owner_email;
-- 		    ELSE -- 0-> false-> was not cancelled
-- 				leave sp_main;
-- 			END IF;
-- 		ELSE -- when property is not in reserve 
-- 			Delete From Reserve Where Property_Name = i_property_name and Owner_Email = i_owner_email;
-- 			Delete From Review Where Property_Name = i_property_name and Owner_Email = i_owner_email;
-- 			Delete From Amenity Where Property_Name = i_property_name and Property_Owner = i_owner_email;
-- 			Delete From Is_Close_To Where Property_Name = i_property_name and Owner_Email = i_owner_email;
-- 			Delete From Property Where Property_Name = i_property_name and Owner_Email = i_owner_email;
-- 		END IF;
-- 	END IF;
-- END IF;

IF exists (SELECT CONCAT(Property_Name, Owner_Email) FROM Property WHERE CONCAT(Property_Name, Owner_Email) = CONCAT(i_property_name, i_owner_email)) THEN
	IF exists (SELECT CONCAT(Property_Name, Owner_Email), Was_Cancelled, Start_Date, End_Date 
    FROM Reserve 
    WHERE CONCAT(Property_Name,Owner_Email) = CONCAT(i_property_name, i_owner_email) and 
    Was_Cancelled = 0 and
    (i_current_date between Start_Date and End_Date)) THEN
		leave sp_main;
    END IF;
    Delete From Reserve Where Property_Name = i_property_name and Owner_Email = i_owner_email;
	Delete From Review Where Property_Name = i_property_name and Owner_Email = i_owner_email;
	Delete From Amenity Where Property_Name = i_property_name and Property_Owner = i_owner_email;
	Delete From Is_Close_To Where Property_Name = i_property_name and Owner_Email = i_owner_email;
	Delete From Property Where Property_Name = i_property_name and Owner_Email = i_owner_email;
END IF;
end //
delimiter ;

call remove_property('LA Lakers Property', 'lebron6@gmail.com', '2021-10-22'); 
-- Error Code: 1054. Unknown column 'i_customer_email' in 'where clause'
-- Error Code: 1054. Unknown column 'Was_Cancelled' in 'field list'

-- ID: 5a
-- Name: reserve_property
drop procedure if exists reserve_property;
delimiter //
create procedure reserve_property (
    in i_property_name varchar(50),
    in i_owner_email varchar(50),
    in i_customer_email varchar(50),
    in i_start_date date,
    in i_end_date date,
    in i_num_guests int,
    in i_current_date date
)
sp_main: begin
-- TODO: Implement your solution here

-- if combination of pname, owner and customer does exist --> exit
IF exists (SELECT CONCAT(Property_Name, Owner_Email, Customer) FROM Reserve WHERE CONCAT(Property_Name, Owner_Email, Customer) = CONCAT(i_property_name, i_owner_email, i_customer_email)) THEN
leave sp_main;
END IF;

-- if start date before current date --> exit
IF  i_start_date < i_current_date THEN
leave sp_main;
END IF;

-- check overlaps
IF  exists(select Start_Date, End_Date from Reserve WHERE 
((i_start_date between Start_Date and End_Date) or (i_end_date between Start_Date and End_Date))) THEN
	leave sp_main;
END IF;

IF exists (select Capacity from Property WHERE Capacity >= i_num_guests) THEN
	INSERT INTO RESERVE VALUE (i_property_name, i_owner_email, i_customer_email, i_start_date, i_end_date, i_num_guests, 0);
END IF;
end //
delimiter ;

call reserve_property('Beautiful San Jose Mansion', 'arthurread@gmail.com', 'johnthomas@gmail.com', '2021-10-19', '2021-10-22', 1, '2021-10-01');
-- Error Code: 1054. Unknown column 'Customer_Email' in 'field list'
-- Error Code: 1136. Column count doesn't match value count at row 1



-- ID: 5b
-- Name: cancel_property_reservation
drop procedure if exists cancel_property_reservation;
delimiter //
create procedure cancel_property_reservation (
    in i_property_name varchar(50),
    in i_owner_email varchar(50),
    in i_customer_email varchar(50),
    in i_current_date date
)
sp_main: begin
-- TODO: Implement your solution here
IF exists (SELECT CONCAT(Property_Name, Owner_Email, Customer) FROM Reserve WHERE CONCAT(Property_Name, Owner_Email, Customer) = CONCAT(i_property_name, i_owner_email, i_customer_email)) THEN
	IF exists (SELECT Was_Cancelled FROM Reserve WHERE Was_Cancelled = 0) THEN
		IF exists (SELECT Start_Date FROM Reserve WHERE i_current_date < Start_Date) THEN
			UPDATE Reserve 
			SET Was_Cancelled = 1 
			WHERE i_property_name = Property_Name and i_owner_email = Owner_Email and i_customer_email = Customer;
		END IF;
	END IF;
END IF;
end //
delimiter ;

call cancel_property_reservation('Beautiful Beach Property', 'msmith5@gmail.com', 'cbing10@gmail.com', '2021-10-01'); 
-- Error Code: 1292. Incorrect date value: '2021-10-01' for column 'i_current_date' at row 1

-- ID: 5c
-- Name: customer_review_property
drop procedure if exists customer_review_property;
delimiter //
create procedure customer_review_property (
    in i_property_name varchar(50),
    in i_owner_email varchar(50),
    in i_customer_email varchar(50),
    in i_content varchar(500),
    in i_score int,
    in i_current_date date
)
sp_main: begin
IF  not exists (Select Property_Name From reserve Where Start_Date<= i_current_date AND Property_Name=i_property_name)
THEN leave sp_main; 
END IF;

IF  exists (Select Property_Name From review
Where Property_Name = i_property_name AND Owner_Email = i_owner_email AND Customer = i_customer_email)
THEN leave sp_main; 
END IF;

insert  into review (Property_Name,Owner_Email,Customer,Content,Score) value (i_property_name,i_owner_email,
		i_customer_email, i_content,i_score); 

   
end //
delimiter ;


-- ID: 5d
-- Name: view_properties
create or replace view view_properties (
    property_name, 
    average_rating_score, 
    description, 
    address, 
    capacity, 
    cost_per_night
) as
-- TODO: replace this select query with your solution
select property.Property_Name, avg(score), Descr,concat(Street,', ', City,', ',State,', ',Zip), Capacity, Cost 
from property LEFT JOIN review ON property.Property_Name=review.Property_Name 
GROUP BY property.Property_Name;


-- ID: 5e
-- Name: view_individual_property_reservations
drop procedure if exists view_individual_property_reservations;
delimiter //
create procedure view_individual_property_reservations (
    in i_property_name varchar(50),
    in i_owner_email varchar(50)
)
sp_main: begin
drop table if exists view_individual_property_reservations;
create table view_individual_property_reservations (
		property_name varchar(50) NOT NULL,
        start_date date NOT NULL,
        end_date date NOT NULL,
        customer_email varchar(50) NOT NULL,
        customer_phone_num char(12) NOT NULL,
        total_booking_cost decimal(6,2) NOT NULL,
        rating_score int,
        review varchar(500)
    );   
    -- TODO: replace this select query with your solution
   
   -- select 'col1', 'col2', 'col3', 'col4', 'col5', 'col6', 'col7', 'col8' from reserve;
     
IF NOT exists (Select * From property Where Property_Name =  i_property_name    ) 
THEN leave sp_main; 
END IF;

IF NOT exists (Select * From property Where Owner_Email=i_owner_email   ) 
THEN leave sp_main; 
END IF;

insert into view_individual_property_reservations (property_name,start_date,end_date,customer_email,customer_phone_num,total_booking_cost,
rating_score,review)
SELECT reserve.Property_Name,Start_Date,End_Date,reserve.Customer,Phone_Number, Cost*(End_date-Start_Date+1)*(1-(Was_Cancelled*0.8)),Score,Content      
FROM (((reserve JOIN clients ON reserve.Customer=Email) JOIN property ON reserve.Property_Name = property.Property_Name)) JOIN review ON reserve.Property_Name = review.Property_Name
Where reserve.Property_Name =  i_property_name AND reserve.Owner_Email= i_owner_email ;   
 

	end //
delimiter ;


-- ID: 6a
-- Name: customer_rates_owner
drop procedure if exists customer_rates_owner;
delimiter //
create procedure customer_rates_owner (
    in i_customer_email varchar(50),
    in i_owner_email varchar(50),
    in i_score int,
    in i_current_date date
)
sp_main: begin
IF   NOT exists (Select Email From accounts Where i_customer_email=Email )
THEN leave sp_main; 
END IF;

IF   NOT exists (Select Email From accounts Where i_owner_email=Email )
THEN leave sp_main; 
END IF;

IF not exists (Select Start_Date From reserve Where  i_owner_email=Owner_Email 
OR i_customer_email=Customer AND i_current_date>=Start_Date AND Was_Cancelled=0
)
THEN leave sp_main; 
END IF;

IF exists (Select Owner_Email,Customer FROM customers_rate_owners WHERE i_owner_email=Owner_Email 
AND i_customer_email=Customer) 
THEN leave sp_main; 
END IF;

insert into customers_rate_owners (Customer,Owner_Email,Score) Values (i_customer_email,i_owner_email,i_score);

end //
delimiter ;


-- ID: 6b
-- Name: owner_rates_customer
drop procedure if exists owner_rates_customer;
delimiter //
create procedure owner_rates_customer (
    in i_owner_email varchar(50),
    in i_customer_email varchar(50),
    in i_score int,
    in i_current_date date
)
sp_main: begin
IF EXISTS (select * from travel_reservation_service.owners_rate_customers where owner_email=i_owner_email and customer = i_customer_email) then leave sp_main; end if;
IF NOT EXISTS (select * from travel_reservation_service.owners where email=i_owner_email) then leave sp_main; end if;
IF NOT EXISTS (select * from travel_reservation_service.customer where email=i_customer_email) then leave sp_main; end if;
IF NOT EXISTS (select * from travel_reservation_service.reserve where owner_email=i_owner_email and customer= i_customer_email and Was_Cancelled = 0) then leave sp_main;end if;
IF (select start_date from travel_reservation_service.reserve where owner_email=i_owner_email and customer= i_customer_email) > i_current_date then leave sp_main;end if; 
insert into owners_rate_customers(owner_email,customer,score) values (i_owner_email,i_customer_email,i_score);

end //
delimiter ;


-- ID: 7a
-- Name: view_airports
create or replace view OneQ AS
select count(*) as
tot_arriving_flights, To_Airport from
flight group by
To_Airport;

create or replace view  TwoQ AS
select
count(*)
as
tot_departing_flights, From_Airport from
flight group by
FROM_Airport;

create or replace view ThreeQ As 
SELECT Airport_Id,avg(cost) as AVG_COST FROM airport LEFT OUTER JOIN flight ON Airport_Id=From_Airport group by Airport_Id;

create or replace view view_airports (
    airport_id, 
    airport_name, 
    time_zone, 
    total_arriving_flights, 
    total_departing_flights, 
    avg_departing_flight_cost
) as
 
 select airport.Airport_Id, Airport_Name, Time_Zone,  COALESCE(tot_arriving_flights , 0 ), COALESCE(tot_departing_flights,0),AVG_COST from (((airport 
 LEFT OUTER JOIN flight ON Airport_Id=From_Airport) LEFT OUTER JOIN OneQ ON Airport_Id=OneQ.To_Airport)LEFT OUTER JOIN TwoQ ON Airport_Id=TwoQ.FROM_Airport) 
 LEFT OUTER JOIN ThreeQ ON airport.Airport_Id=ThreeQ.Airport_Id GROUP BY airport.Airport_Id;

-- ID: 7b
-- Name: view_airlines
create or replace view view_airlines (
    airline_name, 
    rating, 
    total_flights, 
    min_flight_cost
) as
-- TODO: replace this select query with your solution
Select flight.airline_name, rating, count(flight.airline_name) as total_flights, min(cost) as min_flight_cost 
from airline left join flight on airline.airline_name = flight.airline_name
 group by airline_name;



create or replace view cust_name as
select email, concat(First_Name, " ", Last_Name) as customer_name from accounts where email in (select email from customer);

create or replace view cust_avg_rate as 
select customer,avg(score) as avg_rating from owners_rate_customers group by customer;

create or replace view cust_loc as
select email, location from customer;

create or replace view cust_binary as 
select email as is_owner from customer where email in (select * from owners);

create or replace view cust_seats as
select customer,sum(num_seats) as total_seats_purchased from book group by customer;
-- ID: 8a
-- Name: view_customers
create or replace view view_customers (
    customer_name, 
    avg_rating, 
    location, 
    is_owner, 
    total_seats_purchased
) as
-- TODO: replace this select query with your solution
-- view customers
#select customer_name,avg_rating,location,owner.is_owner is not null,total_seats_purchased from cust_name left join 
#cust_avg_rate on cust_name.email=cust_avg_rate.customer left join cust_loc on cust_avg_rate.customer=cust_loc.email
#left join cust_seats on cust_loc.email=cust_seats.customer left join cust_binary on cust_seats.customer=cust_binary.is_owner;
select cat_name as 'customer_name', rating as 'avg_rating', location as 'location', coalesce(owner_mark,0) as 'is_owner', 
coalesce(seats_bought,0) as 'total_seats_purchased' from customer
natural join (select email, concat(First_Name," ",Last_Name) as cat_name from customer natural join accounts) as temp1
left outer join (select customer, avg(score) as rating from owners_rate_customers group by customer) as temp2 on customer.email = temp2.Customer
left outer join (select customer.email, 1 as owner_mark from customer natural join owners) as temp3 on customer.email = temp3.email
left outer join (select customer, sum(Num_Seats) as seats_bought from book group by customer) as temp4 on customer.email = temp4.customer;


-- ID: 8b
-- Name: view_owners

create or replace view property_rating as 
select owner_email,avg(score) as avg_property_rating from review group by owner_email;

create or replace view num_prop as 
select owner_email, count(property_name) as num_properties_owned from property group by owner_email; 

create or replace view  own_rating as 
select owner_email, avg(score) as avg_rating from customers_rate_owners group by owner_email;

create or replace view  own_name as
select email,concat(first_name," " ,last_name) as owner_name from accounts where email in (select * from owners);

create or replace view view_owners (
    owner_name, 
    avg_rating, 
    num_properties_owned, 
    avg_property_rating
) as
-- TODO: replace this select query with your solution
select owner_name,avg_rating,IFNULL(num_properties_owned,0),avg_property_rating from own_name left join own_rating on own_name.email=own_rating.owner_email
left join num_prop on own_name.email= num_prop.owner_email
left join property_rating on num_prop.owner_email=property_rating.owner_email;
#select concat(first_name," " ,last_name) as owner_name, avg(customers_rate_owners.score) as avg_rating,count(property.property_name) as num_properties_owned,
#avg(review.score) as avg_property_rating from (select * from accounts where email in (select * from owners))Temp1 right join customers_rate_owners
#on Temp1.email = customers_rate_owners.owner_email join property on customers_rate_owners.owner_email = property.owner_email
# join review on property.owner_email = review.owner_email group by review.owner_email;

-- ID: 9a
-- Name: process_date
drop procedure if exists process_date;
delimiter //
create procedure process_date ( 
    in i_current_date date
)
sp_main: begin
update customer
join book on customer.email=book.customer
join flight on book.flight_num= flight.flight_num
join airport on flight.to_airport=airport.airport_id 
set customer.location=state
where book.flight_num in (select flight_num from flight where flight_date= i_current_date)
and was_cancelled = 0;

end //
delimiter ;