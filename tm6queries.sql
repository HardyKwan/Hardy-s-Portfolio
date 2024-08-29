-------------1-1, 1-2, 1-3----------------
SELECT * FROM freights;
SELECT * FROM ports;
SELECT * FROM commodity_import_fluctuate;
SELECT * FROM labor_force_participation_rates;
SELECT * FROM covid_cases;
SELECT * FROM maritime_freight;
SELECT * FROM air_freight;
SELECT * FROM container;
SELECT * FROM cargo;
-------------Join #1------------------
SELECT city, state, coast, count(*)
FROM freights JOIN ports
ON freights.port_id = ports.port_id
GROUP BY city, state, coast
ORDER BY count(*) DESC;
------------Join #2--------------------

SELECT 
    ROUND((CAST(employed_population AS numeric(10,1)) / labor_force_population) * 100, 2) AS "pct_lfpr",
	ROUND((CAST(deaths AS numeric(10,1)) / cases) * 100, 2) AS "pct_death",
	date,
	rank() OVER (ORDER BY employed_population DESC)
FROM labor_force_participation_rates AS lfpr JOIN covid_cases AS cc
ON lfpr.lfpr_date = cc.date;


------------------------Visualized Data #1------------------------
SELECT route_starting_country, count(route_starting_country)
FROM freights
GROUP BY route_starting_country
ORDER BY count(route_starting_country) DESC;

SELECT freight_type, count(freight_type)
FROM freights
GROUP BY freight_type
ORDER BY count(freight_type) DESC;

SELECT coast, count(coast)
FROM freights JOIN ports
ON freights.port_id = ports.port_id
GROUP BY coast
ORDER BY count(coast) DESC;
----------------------Visualized Data #2----------------------------

SELECT labor_force_population,
       employed_population,
	   cases,
	   ROUND((CAST((cases - deaths) AS numeric(10,1)) / cases) * 100, 2) AS "pct_cure",
	   date
FROM labor_force_participation_rates JOIN covid_cases
ON labor_force_participation_rates.lfpr_date = covid_cases.date;

SELECT max(employed_population), 
       min(employed_population)
FROM labor_force_participation_rates;

---------------------Visualized Data #3-----------------------------

SELECT * FROM air_freight;
SELECT 
       round(avg(af_fuel_price), 0) AS "fuel_price_avg",
	   round(avg(af_shipping_price), 0) AS "shipping_price_avg"
FROM air_freight;



---------------------Visualized Data #4-----------------------------

SELECT * FROM container;
SELECT
    region_abbreviation,
    container_throughput,
    container_date,
    rank() OVER (PARTITION BY region_abbreviation ORDER BY container_throughput DESC)
FROM container;


---------------------Visualized Data #5--------------------------------

SELECT 
    ROUND((CAST(employed_population AS numeric(10,1)) 
		   / labor_force_population) * 100, 2) AS "pct_lfpr",
	ROUND((CAST(deaths AS numeric(10,1)) / cases) * 100, 2) AS "pct_death",
	ROUND((CAST(import_price AS numeric(10,1)) / base_price) * 100, 2) 
	       AS "pct_import_price_fluctuate",
	date
FROM labor_force_participation_rates AS lfpr JOIN covid_cases AS cc
ON lfpr.lfpr_date = cc.date
JOIN commodity_import_fluctuate AS cif
ON lfpr.freight_id = cif.freight_id;