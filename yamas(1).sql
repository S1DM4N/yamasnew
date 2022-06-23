-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 23 2022 г., 16:13
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yamas`
--

-- --------------------------------------------------------

--
-- Структура таблицы `coach`
--

CREATE TABLE `coach` (
  `id_coach` int(32) NOT NULL,
  `coach_surname` varchar(128) NOT NULL,
  `coach_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `coach`
--

INSERT INTO `coach` (`id_coach`, `coach_surname`, `coach_name`) VALUES
(1, 'Иванов', 'Игорь'),
(2, 'Кравченко', 'Алексей'),
(3, 'Савельев ', 'Герман'),
(4, 'Абдуллаев', 'Альберт'),
(5, 'Не выбрано', 'Не выбрано');

-- --------------------------------------------------------

--
-- Структура таблицы `feedback`
--

CREATE TABLE `feedback` (
  `id_feedback` int(32) NOT NULL,
  `feedback_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `review_text` text NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `feedback`
--

INSERT INTO `feedback` (`id_feedback`, `feedback_date`, `review_text`, `id_user`) VALUES
(1, '2022-06-22 11:44:06', 'Отзыв', 13),
(2, '2022-06-22 11:45:56', 'Отзыв', 13),
(3, '2022-06-22 12:25:34', 'Новый отзыв', 13),
(4, '2022-06-22 12:27:02', 'dfgfdgdffgdgfggfdgd', 3),
(5, '2022-06-22 13:49:34', 'asdsadqeqwasdqwdsadd', 17);

-- --------------------------------------------------------

--
-- Структура таблицы `schedule`
--

CREATE TABLE `schedule` (
  `id_schedule` int(32) NOT NULL,
  `schedule_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `schedule_duration` time NOT NULL,
  `id_coach` int(32) NOT NULL,
  `id_sport` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `schedule`
--

INSERT INTO `schedule` (`id_schedule`, `schedule_date`, `schedule_duration`, `id_coach`, `id_sport`) VALUES
(1, '2022-06-09 09:00:00', '03:00:00', 1, 1),
(2, '2022-06-08 16:00:00', '03:00:00', 4, 4),
(3, '2021-12-31 21:00:00', '01:00:00', 4, 5),
(4, '2022-06-09 01:00:00', '03:00:00', 1, 2),
(5, '2022-06-23 04:00:00', '01:30:00', 4, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `section`
--

CREATE TABLE `section` (
  `id_section` int(32) NOT NULL,
  `section_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `section`
--

INSERT INTO `section` (`id_section`, `section_name`) VALUES
(1, 'Бассейн'),
(2, 'Спортзал'),
(3, 'Не выбрано\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `sport`
--

CREATE TABLE `sport` (
  `id_sport` int(11) NOT NULL,
  `sport_name` varchar(128) NOT NULL,
  `id_section` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `sport`
--

INSERT INTO `sport` (`id_sport`, `sport_name`, `id_section`) VALUES
(1, 'Плавание', 1),
(2, 'Гимнастика', 2),
(3, 'Йога', 2),
(4, 'Водное поло', 1),
(5, 'Не выбрано', 1),
(6, 'Не выбрано', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `subscrption`
--

CREATE TABLE `subscrption` (
  `id_subscrption` int(32) NOT NULL,
  `subscrption_number` int(64) NOT NULL,
  `id_user` int(32) NOT NULL,
  `id_schedule` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `transaction`
--

CREATE TABLE `transaction` (
  `id_transaction` int(32) NOT NULL,
  `transaction_number` varchar(64) NOT NULL,
  `price` decimal(30,2) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_transaction_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `transaction`
--

INSERT INTO `transaction` (`id_transaction`, `transaction_number`, `price`, `id_user`, `id_transaction_status`) VALUES
(2, '71020c54f6cfe8faf1fd32d9b45fffaf', '20000.00', 11, 1),
(3, '990127990', '20000.00', 12, 1),
(4, '1403657255', '20000.00', 13, 2),
(5, '1845191648', '20000.00', 14, 2),
(6, '1098708770', '20000.00', 15, 1),
(7, '170716158', '20000.00', 16, 1),
(8, '4164974030', '20000.00', 17, 2),
(9, '1257566014', '20000.00', 18, 1),
(10, '3270415149', '20000.00', 19, 1),
(11, '3100218764', '20000.00', 20, 1),
(12, '2017139136', '20000.00', 21, 1),
(13, '3188507173', '20000.00', 22, 1),
(14, '4009749045', '20000.00', 23, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `transaction_status`
--

CREATE TABLE `transaction_status` (
  `id_stransaction_status` int(11) NOT NULL,
  `transaction_status_name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `transaction_status`
--

INSERT INTO `transaction_status` (`id_stransaction_status`, `transaction_status_name`) VALUES
(1, 'Счет на оплату'),
(2, 'Счет по оплате');

-- --------------------------------------------------------

--
-- Структура таблицы `user_yamas`
--

CREATE TABLE `user_yamas` (
  `id_user` int(32) NOT NULL,
  `user_surname` varchar(128) NOT NULL,
  `user_name` varchar(128) NOT NULL,
  `user_middle_name` varchar(128) NOT NULL,
  `user_phone` varchar(32) NOT NULL,
  `user_login` varchar(128) NOT NULL,
  `user_password` varchar(128) NOT NULL,
  `id_section` int(11) DEFAULT NULL,
  `id_coach` int(11) DEFAULT NULL,
  `id_sport` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `user_yamas`
--

INSERT INTO `user_yamas` (`id_user`, `user_surname`, `user_name`, `user_middle_name`, `user_phone`, `user_login`, `user_password`, `id_section`, `id_coach`, `id_sport`) VALUES
(3, 'fsadf', 'asdf', 'sadfasdf', '13245234523452345', 'asdf', '5274e08c745c2ed4a55e2c22a1c9fbef', 1, 3, 1),
(4, 'ljasdl;kjfljasdflasd', 'l;aksjdf;lkjw', 'asdpfohi', '371845987', 'asdf23', '00dbb2461d232901bf5ee369942a5aec', 2, 2, 3),
(5, ';alskdf', 'a;idjalk', 'ljsdfl;j', '392845923475', 'kjalsdf', '5274e08c745c2ed4a55e2c22a1c9fbef', 2, 3, 3),
(11, 'Иванов', 'Иван', 'Иванович', '+7 (996) 693-9351', 'user', '5274e08c745c2ed4a55e2c22a1c9fbef', NULL, NULL, 5),
(12, 'lkjslkdf', 'kl;lkdskf', 'lkjl;jlkgj', '+7 (996) 693-9350', 'lksj', '5274e08c745c2ed4a55e2c22a1c9fbef', 1, 5, 5),
(13, 'фдывлоаоДОДО', 'длодфылвоад', 'дофдывола', '0982149', 'для', '5274e08c745c2ed4a55e2c22a1c9fbef', 1, 5, 1),
(14, 'ddddd', 'eee', 'www', '123123', 'asdasd', '6dad4750d83453251c9e45f454d8a3df', 1, 5, 4),
(15, 'dsflgkjlsdk;fg', 'жало', 'апвап', '1983275981', 'lkjalsdjf', '6014f84a54d062bd349e2d62dddb4f45', 3, 5, 5),
(16, 'asd', 'asd', 'asd', '+7 (910) 220-1281', 'asd', '7ae05844a3042de29b21e8007b0aeb27', 3, 5, 5),
(17, 'sdflkdskvdlks', 'adflmdsvk', 'sdvs;lmddpovsj', '+7 (234) 343-2421', 'tyyrsasczxcsadsa', '5f7d5cf21db7558f24c319af379b7f55', 1, 5, 1),
(18, 'aslknakvnalk', 'sdkvmdskllkndslkns', 'dkdlkvnslkdnvlkdn', '+7 (812) 828-1891', 'asdsadlknqwsaajsjcbjjsbacnalknvald', 'ee12303fc85427ef4c9e25579e7e5582', 3, 5, 5),
(19, 'Иванов', 'Иван', 'Иванович', '+7 (913) 123-1231', 'user123', '3f7d75527e54ef75baaedee8ee01fae2', 3, 5, 5),
(20, 'Степанов', 'Илья', 'Олегович', '+7 (912) 312-3432', 'user2312', '754a79f8037db85ef4ce52aaba55c3df', 3, 5, 5),
(21, 'Зубенко', 'Михаил', 'Петрович', '+7 (132) 421-1231', 'lord228', '5ce6e3f3de512c7081ddcab9779a8ad7', 3, 5, 5),
(22, 'Васильев', 'Лев', 'Георгевич', '+7 (928) 122-3342', 'user321', '5308d7daf86249b64f4c0e7d43e3760b', 1, 3, 1),
(23, 'Иванов', 'Игорь', 'Степанович', '', 'user22122', '3dbb63748728dd7bbe7a4db6cc2a86fc', 3, 5, 5);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `coach`
--
ALTER TABLE `coach`
  ADD PRIMARY KEY (`id_coach`);

--
-- Индексы таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id_feedback`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id_schedule`),
  ADD KEY `id_coache` (`id_coach`,`id_sport`),
  ADD KEY `id_selection` (`id_sport`);

--
-- Индексы таблицы `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id_section`);

--
-- Индексы таблицы `sport`
--
ALTER TABLE `sport`
  ADD PRIMARY KEY (`id_sport`),
  ADD KEY `id_section` (`id_section`);

--
-- Индексы таблицы `subscrption`
--
ALTER TABLE `subscrption`
  ADD PRIMARY KEY (`id_subscrption`),
  ADD KEY `id_user` (`id_user`,`id_schedule`),
  ADD KEY `id_schedule` (`id_schedule`);

--
-- Индексы таблицы `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id_transaction`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `transaction-status` (`id_transaction_status`);

--
-- Индексы таблицы `transaction_status`
--
ALTER TABLE `transaction_status`
  ADD PRIMARY KEY (`id_stransaction_status`);

--
-- Индексы таблицы `user_yamas`
--
ALTER TABLE `user_yamas`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `user_login` (`user_login`),
  ADD UNIQUE KEY `user_phone` (`user_phone`),
  ADD KEY `id_section` (`id_section`),
  ADD KEY `id_coach` (`id_coach`),
  ADD KEY `id_sport` (`id_sport`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `coach`
--
ALTER TABLE `coach`
  MODIFY `id_coach` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id_feedback` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id_schedule` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `section`
--
ALTER TABLE `section`
  MODIFY `id_section` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `sport`
--
ALTER TABLE `sport`
  MODIFY `id_sport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `subscrption`
--
ALTER TABLE `subscrption`
  MODIFY `id_subscrption` int(32) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id_transaction` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `transaction_status`
--
ALTER TABLE `transaction_status`
  MODIFY `id_stransaction_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user_yamas`
--
ALTER TABLE `user_yamas`
  MODIFY `id_user` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user_yamas` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`id_coach`) REFERENCES `coach` (`id_coach`),
  ADD CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`id_sport`) REFERENCES `sport` (`id_sport`);

--
-- Ограничения внешнего ключа таблицы `sport`
--
ALTER TABLE `sport`
  ADD CONSTRAINT `sport_ibfk_1` FOREIGN KEY (`id_section`) REFERENCES `section` (`id_section`);

--
-- Ограничения внешнего ключа таблицы `subscrption`
--
ALTER TABLE `subscrption`
  ADD CONSTRAINT `subscrption_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user_yamas` (`id_user`),
  ADD CONSTRAINT `subscrption_ibfk_2` FOREIGN KEY (`id_schedule`) REFERENCES `schedule` (`id_schedule`);

--
-- Ограничения внешнего ключа таблицы `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user_yamas` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`id_transaction_status`) REFERENCES `transaction_status` (`id_stransaction_status`);

--
-- Ограничения внешнего ключа таблицы `user_yamas`
--
ALTER TABLE `user_yamas`
  ADD CONSTRAINT `user_yamas_ibfk_1` FOREIGN KEY (`id_section`) REFERENCES `section` (`id_section`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_yamas_ibfk_2` FOREIGN KEY (`id_coach`) REFERENCES `coach` (`id_coach`),
  ADD CONSTRAINT `user_yamas_ibfk_3` FOREIGN KEY (`id_sport`) REFERENCES `sport` (`id_sport`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
