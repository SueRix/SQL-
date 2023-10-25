-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

-- lab 5 Kravchenko Yevhen IKM-222a

-- Task 1:
SELECT region, SUM(population) AS total_population
FROM cities
GROUP BY region;

-- Task 2:
SELECT region, SUM(population) AS total_population
FROM cities
GROUP BY region
HAVING COUNT(*) >= 10;

-- Task 3:
SELECT name, population
FROM cities
WHERE region IN (
    SELECT region
    FROM cities
    GROUP BY region
    HAVING COUNT(DISTINCT name) >= 5
)
ORDER BY population DESC
LIMIT 5 OFFSET 10;

-- Task 4:
SELECT region, SUM(population) AS total_population
FROM cities
WHERE population > 300000
GROUP BY region;

-- Task 5:
SELECT name, population
FROM cities
WHERE region IN (
    SELECT region
    FROM cities
    GROUP BY region
    HAVING COUNT(DISTINCT name) <= 5
)
AND population < 150000 OR population > 500000;