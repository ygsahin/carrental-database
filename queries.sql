create database autonomous_car_share;
use autonomous_car_share;

CREATE TABLE User (
user_id INT PRIMARY KEY, 
name VARCHAR(100), 
password VARCHAR(100),
zip VARCHAR(10) 
); 

CREATE TABLE PaymentMethod (
method_id INT PRIMARY KEY, 
card_number VARCHAR(16), 
card_type VARCHAR(20), 
user_id INT, 
FOREIGN KEY (user_id) REFERENCES User(user_id)
); 

CREATE TABLE Location (
city_name VARCHAR(20),
location_id INT PRIMARY KEY, 
name VARCHAR(100),
latitude DECIMAL(9,6), 
longitude DECIMAL(9,6)
); 

CREATE TABLE Car (
car_id INT PRIMARY KEY, 
model VARCHAR(100), 
current_location_id INT, 
capacity INT,
battery_level DECIMAL(5,2),
is_available BOOLEAN,
price_rate DECIMAL(5,2),
photo_URL VARCHAR(1000),
FOREIGN KEY (current_location_id) REFERENCES Location(location_id)
);

CREATE TABLE Reservation (
reservation_id INT auto_increment, 
user_id INT,
car_id INT,
pickup_location_id INT, 
dropoff_location_id INT, 
start_time DATETIME,
end_time DATETIME,
PRIMARY KEY (reservation_id),
FOREIGN KEY (user_id) REFERENCES User(user_id),
FOREIGN KEY (car_id) REFERENCES Car(car_id),
FOREIGN KEY (pickup_location_id) REFERENCES Location(location_id),
FOREIGN KEY (dropoff_location_id) REFERENCES Location(location_id) 
);

ALTER TABLE reservation auto_increment=0;

CREATE TABLE ChargingStation (
station_id INT PRIMARY KEY, 
location_id INT, 
FOREIGN KEY (location_id) REFERENCES Location(location_id) 
);

CREATE TABLE ChargesAt (
car_id INT, 
station_id INT, 
charge_time TIMESTAMP, 
charge_duration_seconds INT, 
charged_amount DECIMAL(10,2), 
PRIMARY KEY (car_id, station_id), 
FOREIGN KEY (car_id) REFERENCES Car(car_id), FOREIGN KEY (station_id) REFERENCES ChargingStation(station_id)
 ); 

CREATE TABLE IncidentReport ( 
incident_id INT PRIMARY KEY,
car_id INT, 
report_time TIMESTAMP,
description TEXT,
FOREIGN KEY (car_id) REFERENCES Car(car_id)
 ); 

CREATE TABLE MaintenanceLog ( 
maintenance_id INT PRIMARY KEY,
car_id INT, 
scheduled_time TIMESTAMP, 
completion_time TIMESTAMP, 
status VARCHAR(50), 
description TEXT, 
FOREIGN KEY (car_id) REFERENCES Car(car_id) 
); 

CREATE TABLE ReservationPayment (
reservation_id INT PRIMARY KEY, 
method_id INT, 
trip_cost DECIMAL(10,2), 
FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id), 
FOREIGN KEY (method_id) REFERENCES PaymentMethod(method_id) 
);

insert into location values ('istanbul', 0, 'taksim', 40.456, 27.012);
insert into location values ('istanbul', 1, 'koc univ', 40.234, 27.632);
INSERT INTO Location VALUES ('Istanbul', 2, 'Sultanahmet Square', 41.005610, 28.976960);
INSERT INTO Location VALUES ('Istanbul', 3, 'Hagia Sophia', 41.008580, 28.980173);
INSERT INTO Location VALUES ('Istanbul', 4, 'Blue Mosque', 41.005409, 28.976813);
INSERT INTO Location VALUES ('Istanbul', 5, 'Topkapi Palace', 41.011510, 28.983470);
INSERT INTO Location VALUES ('Istanbul', 6, 'Grand Bazaar', 41.010610, 28.968210);
INSERT INTO Location VALUES ('Istanbul', 7, 'Galata Tower', 41.025600, 28.974400);
INSERT INTO Location VALUES ('Istanbul', 8, 'Dolmabahçe Palace', 41.039150, 29.000230);
INSERT INTO Location VALUES ('Istanbul', 9, 'Maiden\'s Tower', 41.021110, 29.004722);
INSERT INTO Location VALUES ('Istanbul', 10, 'Ortaköy Mosque', 41.047239, 29.027123);
INSERT INTO Location VALUES ('Istanbul', 11, 'Çamlıca Hill', 41.024200, 29.065000);

insert into user values (0, 'Quandale Dingles', '1234', '1234567890');
insert into user values (1, 'Stanislau Makushynski', '4321', '0987654321');
INSERT INTO User VALUES (2, 'Ahmet Katu', 'parola2', '10010');
INSERT INTO User VALUES (3, 'Batu Kırlı', 'parola1', '20020');
INSERT INTO User VALUES (4, 'Poyraz Takur', 'tak45', '30030');
INSERT INTO User VALUES (5, 'Nur Yılmaz', 'yıldız', '40040');
INSERT INTO User VALUES (6, 'Eda Yılmaz', 'e55567', '50050');
INSERT INTO User VALUES (7, 'Levent Tur', 'turLu', '60060');
INSERT INTO User VALUES (8, 'Ates Guven', 'ates1', '70070');
INSERT INTO User VALUES (9, 'Yılmaz Erdem', 'h212', '80080');
INSERT INTO User VALUES (10, 'Mikail Akgumus', '2iii2', '90090');
INSERT INTO User VALUES (11, 'Onuralp Keskin', 'onur2', '10101');

insert into paymentmethod values (0, '12345', 'Visa', 0);
insert into paymentmethod values (1, '098765456789', 'Ziraat', 1);
INSERT INTO PaymentMethod VALUES (2, '4111111111111111', 'Visa', 2);
INSERT INTO PaymentMethod VALUES (3, '5500000000000004', 'MasterCard', 3);
INSERT INTO PaymentMethod VALUES (4, '340000000000009', 'Amex', 4);
INSERT INTO PaymentMethod VALUES (5, '6011000000000004', 'Discover', 5);
INSERT INTO PaymentMethod VALUES (6, '3530111333300000', 'JCB', 6);
INSERT INTO PaymentMethod VALUES (7, '2223000048400011', 'MasterCard', 7);
INSERT INTO PaymentMethod VALUES (8, '4000056655665556', 'Visa', 8);
INSERT INTO PaymentMethod VALUES (9, '378282246310005', 'Amex', 9);
INSERT INTO PaymentMethod VALUES (10, '6011111111111117', 'Discover', 10);
INSERT INTO PaymentMethod VALUES (11, '4111111111111112', 'Visa', 11);
INSERT INTO PaymentMethod VALUES (12, '30569309025904', 'Diners Club', 2);
INSERT INTO PaymentMethod VALUES (13, '5555555555554444', 'MasterCard', 5);

INSERT INTO Car VALUES (
  0, 'Tesla Model 3 (Autopilot)', 0, 4, 85.00, TRUE, 1.50,
  'https://images.unsplash.com/photo-1617654112368-307921291f42?w=800&h=500&fit=crop'
);

INSERT INTO Car VALUES (
  1, 'Tesla Model Y (FSD Beta)', 1, 5, 90.00, TRUE, 1.70,
  'https://images.unsplash.com/photo-1617704548623-340376564e68?w=800&h=500&fit=crop'
);

INSERT INTO Car VALUES (
  2, 'Mercedes-Benz EQS (Drive Pilot)', 2, 5, 80.00, TRUE, 2.20,
  'https://images.unsplash.com/photo-1618843479313-40f8afb4b4d8?w=800&h=500&fit=crop'
);

INSERT INTO Car VALUES (
  3, 'BMW i7 (Level 3 Pilot Assist)', 3, 5, 76.50, TRUE, 2.00,
  'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=800&h=500&fit=crop'
);

INSERT INTO Car VALUES (
  4, 'Audi A8 (Traffic Jam Pilot)', 4, 5, 88.00, TRUE, 1.95,
  'https://images.unsplash.com/photo-1606664515524-ed2f786a0bd6?w=800&h=500&fit=crop'
);

INSERT INTO Car VALUES (
  5, 'Tesla Model S (Autopilot / FSD)', 5, 5, 95.00, TRUE, 2.40,
  'https://hips.hearstapps.com/hmg-prod/images/2025-tesla-model-s-1-672d42e172407.jpg'
);

INSERT INTO Car VALUES (
  6, 'Nissan Ariya (ProPILOT 2.0)', 6, 5, 78.00, TRUE, 1.60,
  'https://cdn-ds.com/blogs-media/sites/346/2023/01/22053344/Side-view-of-the-2023-Nissan-Ariya-driving-on-the-road_A_o.jpg'
);

INSERT INTO Car VALUES (
  7, 'Ford Mustang Mach-E (BlueCruise)', 7, 5, 82.00, TRUE, 1.75,
  'https://images.unsplash.com/photo-1614200187524-dc4b892acf16?w=800&h=500&fit=crop'
);

INSERT INTO Car VALUES (
  8, 'Volvo XC90 Recharge (Pilot Assist)', 8, 7, 70.00, TRUE, 1.55,
  'https://cdn.pixabay.com/photo/2017/03/27/14/56/auto-2179220_1280.jpg'
);

INSERT INTO Car VALUES (
  9, 'Lucid Air (DreamDrive Pro)', 9, 5, 93.00, TRUE, 2.30,
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/2022_Lucid_Air_Grand_Touring_in_Zenith_Red%2C_front_left.jpg/500px-2022_Lucid_Air_Grand_Touring_in_Zenith_Red%2C_front_left.jpg'
);

INSERT INTO ChargingStation VALUES (1, 2);  -- Sultanahmet Square
INSERT INTO ChargingStation VALUES (2, 3);  -- Hagia Sophia
INSERT INTO ChargingStation VALUES (3, 4);  -- Blue Mosque
INSERT INTO ChargingStation VALUES (4, 5);  -- Topkapi Palace
INSERT INTO ChargingStation VALUES (5, 6);  -- Grand Bazaar
INSERT INTO ChargingStation VALUES (6, 7);  -- Galata Tower
INSERT INTO ChargingStation VALUES (7, 8);  -- Dolmabahce Palace
INSERT INTO ChargingStation VALUES (8, 9);  -- Maiden's Tower
INSERT INTO ChargingStation VALUES (9, 10); -- Ortakoy Mosque
INSERT INTO ChargingStation VALUES (10, 11);-- Camlica Hill

INSERT INTO ChargesAt VALUES (2, 1, '2025-06-17 09:30:00', 1800, 35.75);
INSERT INTO ChargesAt VALUES (3, 2, '2025-06-17 10:00:00', 2400, 42.10);
INSERT INTO ChargesAt VALUES (4, 3, '2025-06-17 11:15:00', 2100, 38.00);
INSERT INTO ChargesAt VALUES (5, 4, '2025-06-17 12:45:00', 2700, 45.60);
INSERT INTO ChargesAt VALUES (6, 5, '2025-06-17 14:20:00', 1600, 29.50);
INSERT INTO ChargesAt VALUES (7, 6, '2025-06-17 15:10:00', 2500, 43.25);
INSERT INTO ChargesAt VALUES (8, 7, '2025-06-17 16:30:00', 2200, 36.90);
INSERT INTO ChargesAt VALUES (9, 8, '2025-06-17 17:50:00', 2000, 33.75);

INSERT INTO Reservation (user_id, car_id, pickup_location_id, dropoff_location_id, start_time, end_time) VALUES
(2, 2, 0, 1, '2025-06-15 08:00:00', '2025-06-15 08:30:00'),
(3, 3, 1, 2, '2025-06-15 09:00:00', '2025-06-15 09:20:00'),
(4, 4, 2, 3, '2025-06-15 10:00:00', '2025-06-15 10:25:00'),
(5, 5, 3, 4, '2025-06-15 11:00:00', '2025-06-15 11:45:00'),
(6, 6, 4, 5, '2025-06-15 12:00:00', '2025-06-15 12:40:00'),
(7, 7, 5, 6, '2025-06-15 13:00:00', '2025-06-15 13:30:00'),
(8, 8, 6, 7, '2025-06-15 14:00:00', '2025-06-15 14:35:00');

INSERT INTO ReservationPayment (reservation_id, method_id, trip_cost) VALUES
(1, 0, 14.50),
(2, 1, 11.20),
(3, 2, 13.80),
(4, 3, 19.99),
(5, 4, 22.75),
(6, 0, 17.30),
(7, 1, 20.40);