-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 30 2021 г., 12:54
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: ` food_ordering`
--

-- --------------------------------------------------------

--
-- Структура таблицы `dish`
--

CREATE TABLE `dish` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `Image` blob,
  `description` varchar(1000) NOT NULL,
  `price` double NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `dish`
--

INSERT INTO `dish` (`id`, `name`, `Image`, `description`, `price`, `menu_id`) VALUES
(4, 'Борщ', NULL, '123', 400, 1),
(5, 'Суп', NULL, '123', 340, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `institution`
--

CREATE TABLE `institution` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `institution`
--

INSERT INTO `institution` (`id`, `name`, `description`) VALUES
(2, 'Pasta Basts', NULL),
(3, 'Хочу Піца', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `menu_category`
--

CREATE TABLE `menu_category` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `institution_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `menu_category`
--

INSERT INTO `menu_category` (`id`, `name`, `institution_id`) VALUES
(1, 'Перші страви', 2),
(3, 'Другі страви', 2),
(4, 'Перші страви', 3),
(5, 'Другі страви', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` bigint UNSIGNED NOT NULL,
  `number` bigint NOT NULL,
  `sum` double NOT NULL,
  `phone_num` varchar(15) NOT NULL,
  `customer` varchar(100) NOT NULL,
  `id_institution` bigint UNSIGNED NOT NULL,
  `id_dish` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `number`, `sum`, `phone_num`, `customer`, `id_institution`, `id_dish`) VALUES
(2, 1, 400, '+9040052334', 'User1', 2, 4),
(3, 2, 400, '+9043453434', 'User2', 3, 5);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `dish`
--
ALTER TABLE `dish`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Индексы таблицы `institution`
--
ALTER TABLE `institution`
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `menu_category`
--
ALTER TABLE `menu_category`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `institution_id` (`institution_id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_institution` (`id_institution`),
  ADD KEY `id_dish` (`id_dish`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `dish`
--
ALTER TABLE `dish`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `institution`
--
ALTER TABLE `institution`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `menu_category`
--
ALTER TABLE `menu_category`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `dish_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_category`
--
ALTER TABLE `menu_category`
  ADD CONSTRAINT `menu_category_ibfk_1` FOREIGN KEY (`institution_id`) REFERENCES `institution` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`id_institution`) REFERENCES `institution` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`id_dish`) REFERENCES `dish` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
