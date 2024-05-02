-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 18 2024 г., 21:18
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kanban_board`
--

-- --------------------------------------------------------

--
-- Структура таблицы `projects`
--

CREATE TABLE `projects` (
  `id_project` int NOT NULL,
  `id_user` int NOT NULL,
  `project_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `project_description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `projects`
--

INSERT INTO `projects` (`id_project`, `id_user`, `project_name`, `project_description`, `start_date`, `end_date`) VALUES
(162, 4, 'Колбаса', '', '2024-04-20', '2024-04-30'),
(163, 4, 'Батон', '', '2024-04-30', '2024-06-09'),
(207, 4, 'ООО &quot;Рога И Копыта&quot;', '', '2024-04-20', '2024-04-21');

-- --------------------------------------------------------

--
-- Структура таблицы `tasks`
--

CREATE TABLE `tasks` (
  `id_task` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `id_project` int DEFAULT NULL,
  `task_status` int NOT NULL,
  `task_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `task_color` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deadline` date NOT NULL,
  `user_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tasks`
--

INSERT INTO `tasks` (`id_task`, `id_user`, `id_project`, `task_status`, `task_name`, `task_description`, `task_color`, `deadline`, `user_name`) VALUES
(51, 16, 162, 3, 'Новый таск 2', '', '#f0ad4e', '2024-05-12', 'danil'),
(57, 17, 162, 1, 'Новый год', 'новый', '#5cb85c', '2024-12-31', 'eva'),
(63, 4, 162, 2, 'Воскресняя задача', 'Новая задача', '#f0ad4e', '2024-04-21', 'user'),
(64, 4, 162, 1, 'авпва', '', '#5cb85c', '2024-04-25', 'eva'),
(65, 4, 162, 3, 'Регистрация', '', '#f0ad4e', '2024-04-21', 'denis'),
(66, 4, 207, 1, 'Модуль регистрации пользователей', '', '#f0ad4e', '2024-04-20', 'denis');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `user`, `password`, `role`) VALUES
(1, 'admin', '$2y$10$w1beYGOz6s7Kd8CPA.m9pualGIOSsugxtvLh84G2srcUfXo./.FTS', 'admin'),
(2, 'user', '$2y$10$m1j/x/4zA02XRtpU1Kia4u6BmosrhJi2eeTVUvcVBVHViRd01ElCy', 'user'),
(3, 'denis', '$2y$10$lSbL6BzPcWP2HM9RCHqDcerOXVHKbIVfxjFbqZDxNxt5xRldWYvnu', 'user'),
(4, 'danil', '$2y$10$cb3kQXFvh0kZC40wJbKKDuOHcRPMyHbbge8YZNjHYmXDbUvH8JnvO', 'admin'),
(5, 'eva', '$2y$10$ZciYiJOmh4D51iQkwkMjMusqmS.G5t0VL.mm9IYELrWge9dMIfsjq', 'user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id_project`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id_task`),
  ADD KEY `tasks_id_user` (`id_user`),
  ADD KEY `tasks_id_project` (`id_project`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `user` (`user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `projects`
--
ALTER TABLE `projects`
  MODIFY `id_project` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT для таблицы `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id_task` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
