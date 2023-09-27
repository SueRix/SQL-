-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

-- lab 1 Kravchenko Yevhen IKM-222a

-- Task 1:
SELECT *
FROM `cities`
ORDER BY `id`, `population`
LIMIT 10 OFFSET 10

-- Task 2:
SELECT *
FROM `cities`
ORDER BY `name` DESC
LIMIT 30

-- Task 3:
SELECT *
FROM `cities`
ORDER BY `population`, `region`
LIMIT 50

-- Task 4:
SELECT `region`
FROM `cities`
LIMIT 50

-- Task 5:
SELECT *
FROM `cities`
ORDER BY `region` DESC, `name` DESC
LIMIT 50