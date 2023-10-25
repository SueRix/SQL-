-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

-- lab 4 Kravchenko Yevhen IKM-222a

-- Task 1:
SELECT UPPER(name) AS upper_name
FROM cities
ORDER BY name
LIMIT 5 OFFSET 5;


-- Task 2:
SELECT name, LENGTH(name) AS name_length
FROM cities
WHERE LENGTH(name) NOT IN (8, 9, 10);



-- Task 3:
SELECT region, SUM(population) AS population_in_C_S
FROM cities
WHERE region IN ('C', 'S')
GROUP BY region;


-- Task 4:
SELECT AVG(population) AS avg_population_in_W
FROM cities
WHERE region = 'W';


-- Task 5:
SELECT COUNT(*) AS city_count_in_E
FROM cities
WHERE region = 'E';

