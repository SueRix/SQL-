-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

-- lab 2 Kravchenko Yevhen IKM-222a

-- Task 1:
SELECT *
FROM `cities`
WHERE population >= 1000000
ORDER BY `population`;

-- Task 2:
SELECT *
FROM `cities`
WHERE region IN ('E', 'W')
ORDER BY `population` DESC;

-- Task 3:
SELECT *
FROM `cities`
WHERE population > 50000 AND region IN ('S', 'C', 'N');

-- Task 4:
SELECT *
FROM `cities`
WHERE population > 150000 AND population <= 350000 AND region IN ('E', 'W', 'N')
ORDER BY `name`
LIMIT 20;

-- Task 5:
SELECT *
FROM `cities`
WHERE region NOT IN ('E', 'W')
ORDER BY `population`
LIMIT 10
OFFSET 10;