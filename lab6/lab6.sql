-- Adminer 4.8.1 MySQL 5.5.5-10.3.32-MariaDB-1:10.3.32+maria~focal dump

-- lab 6 Kravchenko Yevhen IKM-222a

-- Task 1:
SELECT c.name AS city, r.name AS region
FROM cities c
JOIN regions r ON c.region = r.uuid
WHERE c.population > 350000;


-- Task 2:
SELECT c.name AS city, r.name AS region
FROM cities c
JOIN regions r ON c.region = r.uuid
WHERE r.name = 'Nord';


-- Task 3:
DROP TABLE IF EXISTS `lines`;
CREATE TABLE `lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `line_id` int(10) unsigned NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `is_transfer_station` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `line_id` (`line_id`),
  CONSTRAINT `stations_ibfk_1` FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `transfers`;
CREATE TABLE `transfers` (
  `station_id` int(10) unsigned NOT NULL,
  `transfer_station_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`station_id`, `transfer_station_id`),
  CONSTRAINT `transfers_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `stations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transfers_ibfk_2` FOREIGN KEY (`transfer_station_id`) REFERENCES `stations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Пояснення до таблиці:

-- Лінії метрополітену (lines): Кожна лінія має свою назву та колір. Ця таблиця дозволяє відокремити станції за лініями і візуально представляти кожну лінію на мапі відповідно до її кольору.
-- Станції (stations): Станції зв'язані з лініями. Кожна станція має назву, вона належить до певної лінії (line_id) і має порядковий номер (sequence) на цій лінії. Це дозволяє відтворити послідовність станцій на кожній лінії.
-- Пересадки (transfers): Пересадки між станціями забезпечують зв'язок між різними лініями. Ця таблиця відображає зв'язки між станціями, де можлива пересадка.

-- Вибірка ліній: Визначаємо, які лінії існують у метрополітені, їх назви та кольори.
-- Вибірка станцій за лініями: Для кожної лінії отримуємо список станцій з їх порядковими номерами, що дозволяє нам відтворити послідовність станцій на мапі.
-- Визначення пересадок: Для станцій, які є пересадочними, встановлюємо зв'язки з іншими станціями, що дозволяє показати можливості переходу між різними лініями на мапі.
-- Відтворення мапи: Використовуючи зібрану інформацію, мапу можна візуально відтворити, наприклад, за допомогою програмного забезпечення для графіки або веб-додатків. Можна також створити інтерактивну мапу, яка дозволить користувачам переглядати різні лінії, станції та пересадки.