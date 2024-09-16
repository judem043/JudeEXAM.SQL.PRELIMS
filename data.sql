INSERT INTO Customers (first_name, last_name, contact_info)
VALUES 
('Ivan', 'Pogi', 'Sirivanpogi@gmail.com'),
('Jude', 'Santos', 'judem043@gmail.com'),
('Alice', 'Guo', 'SpyngChina@gmail.com'),
('Quiboloy', 'Apolo', '10MillionBounty@gmail.com'),
('Chaknu', 'Grock', 'Pstinginnaman691@gmail.com'),
('IShowSpeed', 'Balut', 'ZombieApocalypsePH4114@gmail.com'),
('Manny', 'Pacquiao', 'HappyNewYear911@gmail.com'),
('Michael', 'Tedoso', 'YoungSeniorYR100@gmail.com'),
('Ninong', 'Ry', 'MalupitonBINI338@gmail.com'),
('Baby', 'Giant', 'LubanNo.7@gmail.com');

INSERT INTO Vehicles (customer_id, make, model, year)
VALUES
(1, 'Ford', 'Mustang', 2022),
(2, 'Porsche', '911', 2021),
(3, 'Lamborghini', 'Huracan', 2022),
(4, 'Nissan', 'GTR', 2023),
(5, 'Toyota', 'Supra', 2022),
(6, 'BMW', 'M3', 2022),
(7, 'Kalesa', 'Kabayo', 1946),
(8, 'Jeepney', 'Jeep', 1950),
(9, '5star', 'Bus', 1983),
(10, 'Electric Bike', 'Ebike', 2024);

INSERT INTO Mechanics (first_name, last_name, expertise)
VALUES 
('Edrick', 'Gorospe', 'Engine Specialist'),
('Jewel', 'Camaisa', 'Car detailing and restoration expert'),
('Janzel', 'Encabo', 'Brake and Tire Specialist'),
('Godwin', 'Rivera', 'General Maintenance'),
('Jayson', 'Garcia', 'Vehicle safety systems expert'),
('Lexi', 'Lore', 'Air conditioning and Heating system specialist'),
('Jed', 'Amoroto', 'Electrical Systems Expert');

INSERT INTO ServiceJobs (vehicle_id, mechanic_id, service_date, service_description, cost)
VALUES 
(1, 1, '2024-08-12', 'Engine oil change', 520.00),
(2, 2, '2024-08-11', 'Complete car detailing and restoration', 10000.00),
(3, 3, '2024-09-10', 'Brake replacement', 1500.00),
(4, 4, '2024-09-09', 'Electrical system diagnostic', 380.00),
(5, 5, '2024-09-08', 'General maintenance check', 1000.00);

INSERT INTO PartsUsed (service_id, part_name, part_cost)
VALUES 
(1, 'Engine oil', 500.00),
(2, 'Restoration cleaning supplies', 9000.00),
(3, 'Brake pads', 750.00),
(4, 'Diagnostic tools', 600.00),
(5, 'General maintenance', 5000.00);


#1

SELECT s.service_id, v.make, v.model, m.first_name AS mechanic_first_name, m.last_name AS mechanic_last_name, s.service_date, s.service_description
FROM ServiceJobs s
JOIN Vehicles v ON s.vehicle_id = v.vehicle_id
JOIN Mechanics m ON s.mechanic_id = m.mechanic_id;

#2

SELECT m.first_name, m.last_name, SUM(s.cost) AS total_service_cost
FROM Mechanics m
JOIN ServiceJobs s ON m.mechanic_id = s.mechanic_id
GROUP BY m.mechanic_id;

#3

SELECT DISTINCT v.vehicle_id, v.make, v.model
FROM Vehicles v
JOIN ServiceJobs s ON v.vehicle_id = s.vehicle_id
UNION
SELECT DISTINCT v.vehicle_id, v.make, v.model
FROM Vehicles v
JOIN ServiceJobs s ON v.vehicle_id = s.vehicle_id
JOIN PartsUsed p ON s.service_id = p.service_id;
