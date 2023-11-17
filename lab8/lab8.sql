
-- lab 8 Kravchenko Yevhen IKM-222a

-- Task:

CREATE TABLE `users` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL UNIQUE,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `projects` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `project_users` (
  `project_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`project_id`, `user_id`),
  CONSTRAINT `project_users_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tasks` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` INT UNSIGNED NOT NULL,
  `author_id` INT UNSIGNED NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `status` ENUM('open', 'in progress', 'closed') NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `task_assignees` (
  `task_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`task_id`, `user_id`),
  CONSTRAINT `task_assignees_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `task_assignees_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `files` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` INT UNSIGNED,
  `task_id` INT UNSIGNED,
  `file_url` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- Роз'яснення:

-- Таблиця users:
-- Ця таблиця призначена для зберігання інформації про користувачів, які можуть бути авторами та виконавцями задач.
-- Кожен користувач має унікальний ідентифікатор (id), ім'я (name) та електронну адресу (email).


-- Таблиця projects:
-- Таблиця проектів містить інформацію про різні проекти, над якими працюють користувачі. Кожен проект має унікальний ідентифікатор (id), назву (name) та опис (description).


-- Таблиця project_users:
-- Ця таблиця є зв'язною таблицею, яка визначає, які користувачі залучені до яких проектів.
-- Вона містить зовнішні ключі, що посилаються на users і projects, забезпечуючи зв'язок між користувачами та проектами.


-- Таблиця tasks:
-- У таблиці задач зберігається інформація про індивідуальні задачі, що створюються в рамках проектів. 
-- Кожна задача має ідентифікатор (id), ідентифікатор проекту (project_id), автора (author_id), назву (title), опис (description) та статус (status), який може приймати обмежені значення, такі як 'open', 'in progress', 'closed'.


-- Таблиця task_assignees:
-- Це ще одна зв'язна таблиця, яка визначає, які користувачі призначені виконавцями для кожної задачі. Це дозволяє мати багато виконавців на одну задачу.


-- Таблиця files:
-- Таблиця файлів призначена для зберігання посилань на файли, які можуть бути асоційовані з проектами та задачами.
-- Кожен файл має унікальний ідентифікатор (id), може бути пов'язаний з проектом (project_id), задачею (task_id) та містить URL до файла (file_url).

-- Кожна з цих таблиць пов'язана з іншими через зовнішні ключі, що дозволяє створювати складні запити, які можуть відображати відносини та залежності між різними елементами управління проектами та задачами.
-- Наприклад, це дозволяє визначити, хто є автором задачі, хто є виконавцями, які файли асоційовані з задачею або проектом і так далі.