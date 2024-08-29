CREATE TABLE ports (
    port_id SERIAL CONSTRAINT port_key PRIMARY KEY,
    major_us_coast_port varchar(25) NOT NULL,
    major_us_coast_airport varchar(25) NOT NULL,
    city varchar(20),
    state char(5),
    coast char(12),
    CONSTRAINT check_port_coast CHECK (coast IN('East', 'West', 'South Region', 'Territory'))
);

CREATE TABLE freights (
    freight_id SERIAL CONSTRAINT freight_key PRIMARY KEY,
    freight_type char(8) NOT NULL,
    route_starting_city varchar(25) NOT NULL,
    route_starting_country varchar(25) NOT NULL,
    route_us_coast varchar(12) NOT NULL,
    CONSTRAINT check_coast CHECK (route_us_coast IN('East', 'West', 'South Region', 'Territory')),
    CONSTRAINT check_freight_type CHECK (freight_type IN('maritime', 'air')),
    port_id int REFERENCES port_info (port_id) ON DELETE CASCADE,
);

CREATE TABLE labor_force_participation_rates (
    labor_force_id SERIAL CONSTRAINT labor_force_key PRIMARY KEY,
    labor_force_population int NOT NULL,
    employed_population int NOT NULL,
    lfpr_date date NOT NULL,
    freight_id int REFERENCES freights (freight_id) ON DELETE CASCADE,
);

CREATE TABLE covid_cases (
    case_id SERIAL CONSTRAINT case_key PRIMARY KEY,
    date date NOT NULL,
    cases int NOT NULL,
    deaths int NOT NULL,
    labor_force_id int REFERENCES labor_force_participation_rates (labor_force_id)
);

COPY covid_cases
FROM 'C:\temp\us-counties.csv'
WITH (FORMAT CSV, HEADER);

COPY covid_cases
FROM 'C:\temp\us-counties-recent.csv'
WITH (FORMAT CSV, HEADER);



CREATE TABLE commodity_import_fluctuate (
    import_id SERIAL CONSTRAINT import_key PRIMARY KEY,
    base_price int NOT NULL,
    import_price int NOT NULL,
    import_date date NOT NULL,
    freight_id int REFERENCES freights (freight_id) ON DELETE CASCADE
);

CREATE TABLE maritime_freight (
    maritime_freight_id SERIAL CONSTRAINT maritime_freight_key PRIMARY KEY,
    mf_fuel_price int NOT NULL,
    mf_global_shipping_price int NOT NULL,
    mf_china_wecoast_shipping_price int NOT NULL,
    mf_china_eacoast_shipping_price int NOT NULL,
    mf_date date NOT NULL,
    freight_id int REFERENCES freights (freight_id) ON DELETE CASCADE,
    container_id int REFERENCES container (container_id) ON DELETE CASCADE
);

CREATE TABLE air_freight (
    air_freight_id SERIAL CONSTRAINT air_freight_key PRIMARY KEY,
    af_fuel_price int NOT NULL,
    af_shipping_price int NOT NULL,
    af_date date NOT NULL,
    freight_id text REFERENCES freights (freight_id) ON DELETE CASCADE
    cargo_id int REFERENCES cargo (cargo_id) ON DELETE CASCADE
);

CREATE TABLE container (
    container_id SERIAL CONSTRAINT container_key PRIMARY KEY,
    region_abbreviation char(4) NOT NULL,
    container_throughput int NOT NULL,
    container_date date NOT NULL
);

CREATE TABLE cargo (
    cargo_id SERIAL CONSTRAINT cargo_key PRIMARY KEY,
    air_freight_traffic int NOT NULL,
    traffic_date date NOT NULL
);


INSERT INTO ports
VALUES 
       ('1', 'Port of Los Angeles', 'Los Angeles International Airport', 'Los Angeles', 'CA', 'West'),
       ('2', 'Port of Long Beach', 'Long Beach Airport', 'Long Beach', 'CA', 'West'),
       ('3', 'Port Newark–Elizabeth Marine Terminal', 'Kennedy International Airport', 'Newark', 'NY-NJ', 'East'),
       ('4', 'Port of Savannah', 'Tbilisi International Airport', 'Savannah', 'GA', 'East'),
       ('5', 'Port of Houston', 'George Bush Intercontinental Airport', 'Houston', 'TX', 'South Region'),
       ('6', 'Port of Seattle', 'Seattle-Tacoma International Airport', 'Seattle', 'WA', 'West'),
       ('7', 'Norfolk International', 'Terminals    Norfolk International Airport', 'Norfolk', 'VA', 'East'),
       ('8', 'Port of Tacoma', 'Seattle-Tacoma International Airport', 'Tacoma', 'WA', 'West'),
       ('9', 'Port of Charleston', 'Charleston International Airport', 'Charleston', 'SC', 'East'),
       ('10', 'Port of Oakland', 'Oakland International Airport', 'Oakland', 'CA', 'West'),
       ('11', 'PortMiami', 'Miami International Airport', 'Miami', 'FL', 'East'),
       ('12', 'Port Everglades', 'Fort Lauderdale–Hollywood International Airport', 'Fort Lauderdale', 'FL', 'East'),
       ('13', 'Port of Philadelphia', 'Philadelphia International Airport', 'Philadelphia', 'PHL', 'East'),
       ('14', 'Port of Baltimore', 'Baltimore/Washington International Thurgood Marshall Airport', 'Baltimore', 'MD', 'East'),
       ('15', 'Port of New Orleans', 'Louis Armstrong New Orleans International Airport', 'New Orleans', 'LA', 'South Region'),
       ('16', 'Port of San Juan', 'Luis Muñoz Marín International Airport', 'San Juan', 'PR', 'Territory'),
       ('17', 'Port of Jacksonville', 'Jacksonville International Airport', 'Jacksonville', 'AL', 'South Region'),
       ('18', 'Port of Wilmington', 'Wilmington Airport', 'Wilmington', 'DE', 'South Region'),
       ('19', 'Port of Mobile', 'Mobile Regional Airport', 'Mobile', 'AL', 'South Region'),
       ('20', 'Port of Boston', 'Boston Logan International Airport', 'Boston', 'MA', 'East'),
       ('21', 'Port of Palm Beach', 'Palm Beach International Airport', 'West Palm Beach', 'FL','East'),
       ('22', 'Port of Wilmington', 'Wilmington International Airport', 'Wilmington', 'NC', 'East'),
       ('23', 'Port of Chester', 'Philadelphia International Airport', 'Chester', 'PA', 'East'),
       ('24', 'Port of Gulfport', 'Gulfport–Biloxi International Airport', 'Gulfport', 'MI', 'South Region'),
       ('25', 'Port of San Diego', 'San Diego International Airport', 'San Diego', 'CA', 'West'),
       ('26', 'Port Hueneme', 'Santa Barbara Airport', 'Port Hueneme', 'CA', 'East'),
       ('27', 'Port Tampa Bay', 'Tampa International Airport', 'Tampa', 'FL', 'East'),
       ('28', 'Port Freeport', 'William P. Hobby Airport', 'Freeport', 'TX', 'South Region'),
       ('29', 'Honolulu Harbor', 'Daniel K. Inouye International Airport', 'Honolulu', 'HI', 'West'),
       ('30', 'Port of Everett', 'Seattle-Tacoma International Airport', 'Everett', 'WA', 'West');


INSERT INTO freights
VALUES 
       ('1', 'maritime', 'Shanghai', 'China', 'West', '1'),
       ('2', 'maritime', 'Shenzhen', 'China', 'West', '1'),
       ('3', 'maritime', 'Guangzhou', 'China', 'West', '6'),
       ('4', 'maritime', 'Tianjin', 'China', 'West', '8'),
       ('5', 'maritime', 'Ningbo',  'China', 'East', '3'),
       ('6','maritime', 'Qingdao', 'China', 'West', '30'),
       ('7', 'maritime', 'Xiamen', 'China', 'West', '29'),
       ('8', 'maritime', 'Dalian', 'China', 'West', '2'),
       ('9', 'maritime', 'Hong Kong', 'China', 'East', '4'),
       ('10', 'maritime', 'Busan', 'Korea', 'West', '10'),
       ('11', 'maritime', 'Kobe', 'Japan', 'West', '25'),
       ('12', 'maritime', 'Bangkok', 'Thailand', 'East', '7'),
       ('13', 'maritime', 'Kaohsiung', 'Taiwan', 'East', '9'),
       ('14', 'maritime', 'Tanjung Pelepas', 'Malaysia', 'East', '11'),
       ('15', 'maritime', 'Berlin', 'Germany', 'East', '13'),
       ('16', 'maritime', 'Naha', 'Japan', 'West', '8'),
       ('17', 'maritime', 'Ho Chi Minh',    'Vietnam', 'West', '6'),
       ('18', 'maritime', 'Laem Chabang', 'Cambodia', 'West', '1'),
       ('19', 'maritime', 'Hakata', 'Japan', 'West', '25'),
       ('20', 'maritime', 'Yokohama', 'Japan', 'West', '1'),
       ('21', 'air', 'Madrid', 'Spain', 'East','12'),
       ('22', 'air', 'London', 'United Kingdom', 'East',    '5'),
       ('23', 'air', 'Paris', 'France', 'East', '14'),
       ('24', 'air', 'Lyon', 'France', 'East', '20'),
       ('25', 'air', 'Casablanca', 'Morocco', 'East', '23'),
       ('26', 'air', 'Rio de Janeiro', 'Brazil', 'South Region', '15'),
       ('27', 'air', 'Lisbon', 'Protugal', 'East', '21'),
       ('28', 'air', 'Rome', 'Italy', 'East', '27'),
       ('29', 'air', 'Mexico City', 'Mexico', 'West', '2'),
       ('30', 'air', 'Taoyuan', 'Taiwan', 'West', '8'),
       ('31', 'air', 'Manila', 'the Philippines', 'West', '6'),
       ('32', 'air', 'Shanghai', 'China', 'West', '1'),
       ('33', 'air', 'Beijing', 'China', 'West', '2'),
       ('34', 'air', 'Guangzhou', 'China', 'West', '30'),
       ('35', 'air', 'Plymouth', 'United Kingdom', 'East', '22'),
       ('36', 'air', 'Frankfurt', 'Germany', 'South Region', '5'),
       ('37', 'air', 'Edinburgh', 'United Kingdom', 'South Region', '28'),
       ('38', 'maritime', 'Hamburg', 'Germany', 'Territory', '16'),
       ('39', 'maritime', 'Cape Town', 'South Africa', 'South Region', '18'),
       ('40', 'maritime', 'Sydney', 'Australia', 'South Region', '17');


INSERT INTO maritime_freight
VALUES 
       ('1', '2.6', '1555', '1520', '2891', '5/1/2019', '1', '1'),
       ('2', '2.6', '1555', '1520', '2891', '6/1/2019', '2', '2'),
       ('3', '2.6', '1555', '1520', '2891', '7/1/2019', '3', '3'),
       ('4', '2.6', '1555', '1520', '2891', '8/1/2019', '4', '4'),
       ('5', '2.6', '1555', '1520', '2891', '9/1/2019', '5', '5'),
       ('6', '2.6', '1555', '1520', '2891', '10/1/2019', '6', '6'),
       ('7', '2.6', '1555', '1520', '2891', '11/1/2019', '7', '7'),
       ('8', '2.25', '1315', '1349', '2626', '12/1/2019', '8', '8'),
       ('9', '2.6', '1555', '1520', '2891', '1/1/2020', '9', '9'),
       ('10', '2.6', '1468', '1507', '2847', '2/1/2020', '10', '10'),
       ('11', '2.6', '1358', '1331', '2560', '3/1/2020', '11', '11'),
       ('12', '2.13', '1437', '1608', '2780', '4/1/2020', '12', '12'),
       ('13', '2.13', '1487', '1645', '2719', '5/1/2020', '13', '13'),
       ('14', '2.13', '1556', '1866', '2700', '6/1/2020', '14', '14'),
       ('15', '2.11', '1859', '2811', '3411', '7/1/2020', '15', '15'),
       ('16', '2.11', '1828', '2912', '3411', '8/1/2020', '16', '16'),
       ('17', '2.11', '2112', '3716', '4469', '9/1/2020', '17', '17'),
       ('18', '2.06', '2242', '3863', '4684', '10/1/2020', '18', '18'),
       ('19', '2.06', '2264', '3852', '4676', '11/1/2020', '19', '19'),
       ('20', '2.06', '2782', '3878', '4925', '12/1/2020', '20', '20'),
       ('21', '2.18', '3448', '4195', '5402', '1/1/2021', '21', '21');
    


