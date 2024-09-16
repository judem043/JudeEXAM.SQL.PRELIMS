CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    contact_info TEXT
);

CREATE TABLE Vehicles (
    vehicle_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    make TEXT,
    model TEXT,
    year INTEGER,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE ServiceJobs (
    service_id INTEGER PRIMARY KEY,
    vehicle_id INTEGER,
    mechanic_id INTEGER,
    service_date TEXT,
    service_description TEXT,
    cost REAL,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    FOREIGN KEY (mechanic_id) REFERENCES Mechanics(mechanic_id)
);

CREATE TABLE Mechanics (
    mechanic_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    expertise TEXT
);

CREATE TABLE PartsUsed (
    part_id INTEGER PRIMARY KEY,
    service_id INTEGER,
    part_name TEXT,
    part_cost REAL,
    FOREIGN KEY (service_id) REFERENCES ServiceJobs(service_id)
);
