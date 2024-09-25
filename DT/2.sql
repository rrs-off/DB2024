CREATE TABLE airline_info (
    airline_id INT PRIMARY KEY,
    airline_code VARCHAR(30) NOT NULL,
    airline_name VARCHAR(50) NOT NULL,
    airline_country VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    info VARCHAR(50)NOT NULL
);

SELECT * FROM  airline_info;
ALTER TABLE airline_info RENAME to airline;
ALTER TABLE airline DROP column info;


CREATE TABLE airport (
    airport_id INT PRIMARY KEY,
    airport_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    state VARCHAR(50)NOT NULL,
    city VARCHAR(50)NOT NULL,
    created_at TIMESTAMP NOT NULL ,
    updated_at TIMESTAMP NOT NULL
);
SELECT * FROM airport;




CREATE TABLE baggage_check (
    baggage_check_id INT PRIMARY KEY ,
    check_result VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    booking_id INT NOT NULL,
    passenger_id INT NOT NULL
);
SELECT * FROM baggage_check;




CREATE TABLE baggage (
    baggage_id INT PRIMARY KEY,
    weight_in_kg DECIMAL(4,2) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    booking_id INT NOT NULL
);
SELECT * FROM baggage;




CREATE TABLE boarding_pass (
    boarding_pass_id INT PRIMARY KEY,
    booking_id INT NOT NULL,
    seat VARCHAR(50) NOT NULL,
    boarding_time TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);
SELECT * FROM boarding_pass;




CREATE TABLE booking_flight (
    booking_flight_id INT PRIMARY KEY,
    booking_id INT NOT NULL,
    flight_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);
SELECT * FROM booking_flight;




CREATE TABLE booking (
    booking_id INT PRIMARY KEY,
    flight_id INT NOT NULL,
    passenger_id INT NOT NULL,
    booking_platform VARCHAR(50) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    status VARCHAR(50) NOT NULL,
    price DECIMAL(7,2) NOT NULL
);
SELECT * FROM booking;
alter table booking rename column price to ticket_price;



CREATE TABLE flights (
    flight_id INT PRIMARY KEY,
    sch_departure_time TIMESTAMP NOT NULL,
    sch_arrival_time TIMESTAMP NOT NULL,
    departing_airport_id INT NOT NULL,
    arriving_airport_id INT NOT NULL,
    departing_gate VARCHAR(50) NOT NULL,
    arriving_gate VARCHAR(50) NOT NULL,
    airline_id INT NOT NULL,
    act_departure_time TIMESTAMP NOT NULL,
    act_arrival_time TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);
SELECT * FROM  flights;


ALTER TABLE flights ALTER COLUMN departing_gate TYPE TEXT;



CREATE TABLE passengers (
    passenger_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(50) NOT NULL,
    country_of_citizenship VARCHAR(50) NOT NULL,
    country_of_residence VARCHAR(50) NOT NULL,
    passport_number VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);
SELECT * FROM passengers;




CREATE TABLE security_check (
    security_check_id INT PRIMARY KEY,
    check_result VARCHAR(20) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    passenger_id INT NOT NULL
);
SELECT * FROM security_check;

ALTER TABLE passengers
    ADD FOREIGN KEY (passenger_id) REFERENCES security_check(passenger_id),
    ADD FOREIGN KEY (passenger_id) REFERENCES booking(passenger_id),
    ADD FOREIGN KEY (passenger_id) REFERENCES baggage_check(passenger_id);
ALTER TABLE booking
    ADD FOREIGN KEY (booking_id) REFERENCES baggage_check(booking_id),
    ADD FOREIGN KEY (booking_id) REFERENCES baggage(booking_id),
    ADD FOREIGN KEY (booking_id) REFERENCES boarding_pass(booking_id),
    ADD FOREIGN KEY (booking_id) REFERENCES booking_flight(booking_id);
Alter table flights
    ADD FOREIGN KEY (flight_id) REFERENCES booking_flight(flight_id);
ALTER TABLE flights
    ADD FOREIGN KEY (arriving_airport_id) REFERENCES airport(airport_id),
    ADD FOREIGN KEY (departing_airport_id) REFERENCES airport(airport_id);
ALTER TABLE  flights
    ADD FOREIGN KEY (airline_id) REFERENCES  airline(airline_id);



insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (83, 35, 'Gabcube', 'China', '28/01/2024', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (38, 92, 'Youbridge', 'United States', '20/07/2024', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (82, 89, 'Skyndu', 'Cape Verde', '21/06/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (85, 6, 'Vinte', 'Germany', '31/12/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (76, 78, 'Cogidoo', 'Poland', '11/07/2024', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (5, 15, 'Tazz', 'China', '27/03/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (66, 20, 'Devbug', 'Indonesia', '26/11/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (49, 98, 'Wordware', 'Croatia', '20/05/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (103, 41, 'Divape', 'United States', '11/05/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (26, 79, 'Avaveo', 'Indonesia', '15/02/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (51, 64, 'Flipbug', 'Iran', '30/09/2020', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (57, 7, 'Vidoo', 'United States', '26/08/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (40, 37, 'Layo', 'China', '13/07/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (83, 29, 'Kimia', 'Ethiopia', '03/05/2024', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (76, 85, 'Miboo', 'Brazil', '18/11/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (89, 92, 'Livetube', 'Serbia', '10/10/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (93, 33, 'Voolith', 'Indonesia', '03/10/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (41, 95, 'Jaloo', 'Pakistan', '08/01/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (62, 48, 'Oloo', 'Philippines', '22/02/2024', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (58, 32, 'Einti', 'China', '24/02/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (18, 50, 'Devpoint', 'China', '21/05/2024', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (75, 29, 'Topiclounge', 'Japan', '27/05/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (62, 81, 'Meedoo', 'Peru', '02/08/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (71, 91, 'Yodoo', 'Nigeria', '25/01/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (110, 28, 'Leenti', 'Croatia', '22/06/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (80, 40, 'Jaxbean', 'Uganda', '27/09/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (14, 98, 'Flashspan', 'Yemen', '12/07/2024', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (66, 80, 'Feedfire', 'Peru', '22/11/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (54, 29, 'Voonder', 'Nicaragua', '30/09/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (27, 81, 'Cogilith', 'Germany', '26/06/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (24, 100, 'Skimia', 'Indonesia', '29/08/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (75, 29, 'Livepath', 'Philippines', '02/02/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (7, 88, 'Livetube', 'Russia', '14/08/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (32, 90, 'Avamm', 'China', '06/08/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (20, 39, 'Twitterlist', 'Portugal', '23/08/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (26, 60, 'Meezzy', 'Brazil', '25/01/2024', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (60, 44, 'Voolia', 'Belarus', '29/07/2024', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (73, 30, 'Voonte', 'China', '04/03/2024', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (12, 86, 'Nlounge', 'Bulgaria', '26/08/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (9, 56, 'Rhycero', 'Belarus', '25/08/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (75, 39, 'Roomm', 'Philippines', '25/07/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (64, 45, 'Mybuzz', 'Czech Republic', '03/08/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (90, 101, 'Leenti', 'Canada', '29/05/2024', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (30, 79, 'Topiczoom', 'Indonesia', '05/03/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (88, 34, 'Realfire', 'Brazil', '04/05/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (4, 24, 'Demivee', 'Sweden', '24/10/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (30, 32, 'Jetwire', 'Saudi Arabia', '05/10/2020', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (72, 93, 'Talane', 'Brazil', '17/12/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (70, 75, 'Kayveo', 'Poland', '28/08/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (95, 35, 'Livetube', 'China', '08/10/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (45, 40, 'Innojam', 'Poland', '16/01/2024', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (40, 53, 'Mita', 'Norway', '13/04/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (23, 21, 'Izio', 'Russia', '14/12/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (80, 21, 'Realpoint', 'Poland', '19/09/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (52, 36, 'Divanoodle', 'Indonesia', '13/09/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (59, 57, 'Vimbo', 'China', '10/07/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (5, 71, 'Meedoo', 'Malaysia', '21/07/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (17, 103, 'Yacero', 'China', '17/06/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (87, 80, 'Devpoint', 'China', '17/05/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (53, 49, 'Feednation', 'Portugal', '28/10/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (72, 22, 'Reallinks', 'Indonesia', '08/05/2024', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (19, 15, 'Zooxo', 'Poland', '18/06/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (86, 106, 'Roodel', 'Philippines', '09/11/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (15, 47, 'Demimbu', 'South Africa', '08/03/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (19, 97, 'Wordware', 'Cuba', '26/09/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (94, 72, 'Kazio', 'Greece', '05/10/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (76, 3, 'Skimia', 'Germany', '01/02/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (7, 60, 'Centidel', 'Portugal', '17/07/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (34, 34, 'Brainverse', 'China', '10/02/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (103, 82, 'Oozz', 'Brazil', '05/06/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (67, 44, 'Youspan', 'China', '15/05/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (46, 108, 'Voomm', 'Vietnam', '01/06/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (76, 69, 'Rhyloo', 'China', '09/04/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (55, 18, 'Twitterbeat', 'Indonesia', '01/07/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (103, 16, 'Mycat', 'Indonesia', '20/02/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (7, 18, 'Chatterpoint', 'Mexico', '22/10/2020', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (39, 33, 'Mudo', 'Indonesia', '17/12/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (77, 41, 'Yodoo', 'Peru', '01/05/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (30, 63, 'Linklinks', 'Slovenia', '23/07/2024', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (93, 15, 'Buzzshare', 'Syria', '16/09/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (91, 43, 'Gabtype', 'Sweden', '27/06/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (21, 109, 'Thoughtsphere', 'China', '25/10/2020', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (78, 33, 'Vimbo', 'Thailand', '24/11/2020', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (36, 65, 'Pixope', 'Colombia', '17/07/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (25, 26, 'Feedfire', 'Philippines', '25/08/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (61, 87, 'Photofeed', 'France', '05/11/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (6, 51, 'Yodoo', 'China', '05/07/2022', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (37, 53, 'Realfire', 'Belarus', '22/10/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (100, 51, 'Flashset', 'Canada', '11/10/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (87, 66, 'Realbuzz', 'China', '28/12/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (82, 88, 'Photofeed', 'Portugal', '23/07/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (53, 104, 'Zooveo', 'Spain', '18/04/2024', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (64, 31, 'Avamm', 'Panama', '22/01/2024', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (44, 16, 'Kwideo', 'Russia', '30/12/2020', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (24, 58, 'Vinte', 'Palestinian Territory', '29/12/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (4, 97, 'Meevee', 'China', '29/11/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (16, 30, 'Tambee', 'Portugal', '20/09/2023', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (11, 52, 'Quatz', 'Brazil', '16/05/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (85, 64, 'Avamm', 'China', '06/09/2021', '12/09/2024');
insert into airline (airline_id, airline_code, airline_name, airline_country, created_at, updated_at) values (28, 56, 'LiveZ', 'China', '02/02/2024', '12/09/2024');


insert into airline(airline_id, airline_code, airline_name, airline_country, created_at, updated_at)
VALUES (1,99,'KazAir', 'Kazakhstan','20/12/2020', '20/12/2021');

update airline
set airline_country = 'Turkey'
WHERE airline_name = 'KazAir';
DELETE From airline
WHERE airline_name = 'SIT';

INSERT INTO airline (airline_id, airline_code ,airline_name, airline_country , created_at, updated_at)
VALUES
    (113, 113,  'AirEasy', 'France','02/02/2024', '12/09/2024'),
    (114, 114,'FlyHigh', 'Brazil','02/02/2024', '12/09/2024'),
    (115, 115,'FlyFly', 'Poland','02/02/2024', '12/09/2024');
DELETE from flights
where EXTRACT (year from sch_arrival_time ) = 2024;

UPDATE booking
Set ticket_price=ticket_price * 1.1;

DELETE FROM booking
WHERE ticket_price < 1000;
Alter table booking_flight
add foreign key (booking_flight_id) references airline (airline_id);
delete from booking
where booking_id=100;

