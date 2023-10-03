-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

-- lab 3 Kravchenko Yevhen IKM-222a

-- Task 1:
SELECT *
FROM `cities`
WHERE `name` LIKE '%ськ';

-- Task 2:
SELECT *
FROM `cities`
WHERE `name` LIKE '%донец%';

-- Task 3:
SELECT CONCAT(`name`, ' (', `region`, ')') AS `region`
FROM `cities`
WHERE `population` > 100000
ORDER BY `region` ASC;

-- Task 4:
SELECT `name`, `population`, (100 * `population` / 40000000) AS `percent_of_population`
FROM `cities`
ORDER BY `population` DESC
LIMIT 10;

-- Task 5:
SELECT CONCAT(`name`, ' - ', (100 * `population` / 40000000), '%') AS `population_percentage`
FROM `cities`
WHERE (100 * `population` / 40000000) >= 0.1
ORDER BY `population` DESC;