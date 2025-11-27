-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/11/2025 às 22:46
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ltr_control`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `actuator_data`
--

CREATE TABLE `actuator_data` (
  `id` int(11) NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  `fan_signal` float DEFAULT NULL,
  `heater_signal` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `commands`
--

CREATE TABLE `commands` (
  `id` int(11) NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  `command_name` varchar(50) DEFAULT NULL,
  `value` float DEFAULT NULL,
  `executed` tinyint(1) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `commands`
--

INSERT INTO `commands` (`id`, `timestamp`, `command_name`, `value`, `executed`, `user_id`) VALUES
(29, '2025-11-15 13:00:33', 'temperatura_alvo', 10, 0, NULL),
(30, '2025-11-15 13:05:52', 'temperatura_alvo', 20, 0, NULL),
(31, '2025-11-15 13:06:09', 'temperatura_alvo', 40.5, 0, NULL),
(32, '2025-11-15 13:06:29', 'temperatura_alvo', 30.5, 1, NULL),
(33, '2025-11-15 13:07:51', 'temperatura_alvo', 1, 0, NULL),
(34, '2025-11-15 13:07:55', 'temperatura_alvo', 60, 0, NULL),
(35, '2025-11-15 13:07:58', 'temperatura_alvo', 30.5, 1, NULL),
(36, '2025-11-15 13:10:57', 'temperatura_alvo', 2, 0, NULL),
(37, '2025-11-17 14:04:42', 'temperatura_alvo', 50, 1, NULL),
(38, '2025-11-17 14:04:51', 'temperatura_alvo', 30, 1, NULL),
(39, '2025-11-17 14:06:36', 'temperatura_alvo', 50.2, 0, NULL),
(40, '2025-11-17 14:06:48', 'temperatura_alvo', 30.6, 0, NULL),
(41, '2025-11-17 14:06:51', 'temperatura_alvo', 30.5, 0, NULL),
(42, '2025-11-17 14:08:28', 'temperatura_alvo', 40, 0, NULL),
(43, '2025-11-17 14:10:27', 'temperatura_alvo', 30, 0, NULL),
(44, '2025-11-17 14:11:03', 'temperatura_alvo', 40, 0, NULL),
(45, '2025-11-17 14:11:10', 'temperatura_alvo', 30, 0, NULL),
(46, '2025-11-17 14:12:17', 'temperatura_alvo', 30.5, 0, NULL),
(47, '2025-11-17 14:12:32', 'temperatura_alvo', 31.5, 0, NULL),
(48, '2025-11-17 14:12:51', 'temperatura_alvo', 40, 0, NULL),
(49, '2025-11-17 14:20:24', 'temperatura_alvo', 50, 0, NULL),
(50, '2025-11-17 14:20:38', 'temperatura_alvo', 35.1, 1, NULL),
(51, '2025-11-17 14:20:43', 'temperatura_alvo', 35, 0, NULL),
(52, '2025-11-17 14:20:47', 'temperatura_alvo', 35.1, 1, NULL),
(53, '2025-11-17 14:24:08', 'temperatura_alvo', 30, 0, NULL),
(54, '2025-11-17 14:24:18', 'temperatura_alvo', 35.1, 1, NULL),
(55, '2025-11-17 14:28:14', 'temperatura_alvo', 1, 0, NULL),
(56, '2025-11-17 14:40:43', 'temperatura_alvo', 50, 0, NULL),
(57, '2025-11-17 14:40:49', 'temperatura_alvo', 55, 0, NULL),
(58, '2025-11-17 14:41:18', 'temperatura_alvo', 40, 0, NULL),
(59, '2025-11-17 14:41:21', 'temperatura_alvo', 45, 0, NULL),
(60, '2025-11-17 14:42:39', 'temperatura_alvo', 44, 0, NULL),
(61, '2025-11-17 14:42:58', 'temperatura_alvo', 44, 0, NULL),
(62, '2025-11-17 14:43:42', 'temperatura_alvo', 50, 0, NULL),
(63, '2025-11-17 14:56:32', 'temperatura_alvo', 12, 0, NULL),
(64, '2025-11-17 14:56:53', 'temperatura_alvo', 12, 0, NULL),
(65, '2025-11-17 15:02:32', 'temperatura_alvo', 12, 0, NULL),
(66, '2025-11-17 15:02:34', 'temperatura_alvo', 23, 0, NULL),
(67, '2025-11-17 15:02:42', 'temperatura_alvo', 34, 0, NULL),
(68, '2025-11-17 15:03:43', 'temperatura_alvo', 45, 0, NULL),
(69, '2025-11-17 15:03:51', 'temperatura_alvo', 56, 0, NULL),
(70, '2025-11-17 15:17:48', 'temperatura_alvo', 23, 0, NULL),
(71, '2025-11-17 15:17:52', 'temperatura_alvo', 23, 0, NULL),
(72, '2025-11-17 15:18:07', 'temperatura_alvo', 23, 0, NULL),
(73, '2025-11-17 15:18:55', 'temperatura_alvo', 23, 0, NULL),
(74, '2025-11-17 15:18:58', 'temperatura_alvo', 34, 0, NULL),
(75, '2025-11-17 15:22:19', 'temperatura_alvo', 100, 0, NULL),
(76, '2025-11-17 15:22:21', 'temperatura_alvo', 23, 0, NULL),
(77, '2025-11-17 15:23:03', 'temperatura_alvo', 34, 0, NULL),
(78, '2025-11-17 15:23:05', 'temperatura_alvo', 23, 0, NULL),
(79, '2025-11-17 15:23:07', 'temperatura_alvo', 12, 0, NULL),
(80, '2025-11-17 15:23:26', 'temperatura_alvo', 100, 0, NULL),
(81, '2025-11-17 15:23:27', 'temperatura_alvo', 32, 0, NULL),
(82, '2025-11-17 15:23:57', 'temperatura_alvo', 32, 0, NULL),
(83, '2025-11-17 15:28:40', 'temperatura_alvo', 32, 0, NULL),
(84, '2025-11-17 16:53:43', 'temperatura_alvo', 1, 0, NULL),
(85, '2025-11-17 16:53:47', 'temperatura_alvo', 30.5, 0, NULL),
(86, '2025-11-17 16:55:54', 'temperatura_alvo', 12, 0, NULL),
(87, '2025-11-17 16:55:56', 'temperatura_alvo', 23, 0, NULL),
(88, '2025-11-17 16:56:00', 'temperatura_alvo', 30.5, 0, NULL),
(89, '2025-11-17 16:56:03', 'temperatura_alvo', 35.1, 1, NULL),
(90, '2025-11-17 17:07:31', 'temperatura_alvo', 1, 0, NULL),
(91, '2025-11-17 17:07:35', 'temperatura_alvo', 35.1, 1, NULL),
(92, '2025-11-17 17:21:04', 'temperatura_alvo', 35.1, 0, NULL),
(93, '2025-11-17 18:33:08', 'temperatura_alvo', 50, 0, NULL),
(94, '2025-11-17 18:33:21', 'temperatura_alvo', 32.1, 0, NULL),
(95, '2025-11-17 18:35:24', 'temperatura_alvo', 40, 0, NULL),
(96, '2025-11-17 18:35:52', 'temperatura_alvo', 40, 0, NULL),
(97, '2025-11-17 18:36:31', 'temperatura_alvo', 40, 0, NULL),
(98, '2025-11-17 18:37:03', 'temperatura_alvo', 40, 0, NULL),
(99, '2025-11-17 18:37:14', 'temperatura_alvo', 30, 0, NULL),
(100, '2025-11-17 18:40:14', 'temperatura_alvo', 40, 0, NULL),
(101, '2025-11-17 18:40:17', 'temperatura_alvo', 30, 0, NULL),
(102, '2025-11-17 18:40:25', 'temperatura_alvo', 32.1, 1, NULL),
(103, '2025-11-17 18:41:54', 'temperatura_alvo', 40, 0, NULL),
(104, '2025-11-17 18:41:58', 'temperatura_alvo', 32.1, 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `latest_command`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `latest_command` (
`id` int(11)
,`timestamp` datetime
,`command_name` varchar(50)
,`value` float
);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `latest_sensor_data`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `latest_sensor_data` (
`id` int(11)
,`timestamp` datetime
,`throttle_angle` float
,`temp_inlet` float
,`temp_outlet` float
,`pressure` float
,`air_mass` float
);

-- --------------------------------------------------------

--
-- Estrutura para tabela `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `acao` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `logs`
--

INSERT INTO `logs` (`id`, `id_usuario`, `acao`, `timestamp`) VALUES
(1, NULL, 'Tentativa de login falhada para o email: \'teste@com\'', '2025-11-17 17:12:00'),
(2, NULL, 'Tentativa de login falhada para o email: \'teste@com\'', '2025-11-17 17:12:08'),
(3, NULL, 'Tentativa de login falhada para o email: \'teste@com\'', '2025-11-17 17:12:11'),
(4, NULL, 'Tentativa de login falhada para o email: \'teste@com\'', '2025-11-17 17:12:13'),
(5, NULL, 'Tentativa de login falhada para o email: \'teste@com\'', '2025-11-17 17:12:16'),
(6, 6, 'Criou o usuário: \'teste\' (teste@com)', '2025-11-17 17:18:17');

-- --------------------------------------------------------

--
-- Estrutura para tabela `readings`
--

CREATE TABLE `readings` (
  `id` int(11) NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  `command_name` varchar(50) DEFAULT NULL,
  `value_encrypted` varchar(255) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `readings`
--

INSERT INTO `readings` (`id`, `timestamp`, `command_name`, `value_encrypted`, `device_id`) VALUES
(67, '2025-11-17 18:22:32', 'throttle_angle', 'U2FsdGVkX19rVKdlcIbxC6XGiiqLlnS23c+geq+4WiE=', NULL),
(68, '2025-11-17 18:22:32', 'temp_inlet', 'U2FsdGVkX1+VQvOjtZcD6oLVTZ/BUpkRbF+obTjGUnI=', NULL),
(69, '2025-11-17 18:22:32', 'temp_outlet', 'U2FsdGVkX1+8axAqagvDMudH/lo0C/TqfYTpv7X5ut0=', NULL),
(70, '2025-11-17 18:22:32', 'pressure', 'U2FsdGVkX1/GXKJZpuqYc7fwgsSyo1ZIC9g1GRRKnSo=', NULL),
(71, '2025-11-17 18:22:32', 'air_mass', 'U2FsdGVkX1+n7Bh9PbrtnHsw/7gYuM+eUUibh6cesss=', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sensor_data`
--

CREATE TABLE `sensor_data` (
  `id` int(11) NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp(),
  `throttle_angle` float DEFAULT NULL,
  `temp_inlet` float DEFAULT NULL,
  `temp_outlet` float DEFAULT NULL,
  `pressure` float DEFAULT NULL,
  `air_mass` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sensor_data`
--

INSERT INTO `sensor_data` (`id`, `timestamp`, `throttle_angle`, `temp_inlet`, `temp_outlet`, `pressure`, `air_mass`) VALUES
(1, '2025-11-13 12:56:33', 50.2, 30.5, 45, 102.3, 29.8),
(2, '2025-11-13 13:13:14', 50.2, 30.5, 45, 102.3, 29.8),
(3, '2025-11-13 14:50:15', 50.2, 30.5, 45, 102.3, 29.8),
(4, '2025-11-14 15:58:47', 50.2, 30.5, 45, 102.3, 29.8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `user_type` enum('admin','engineer','technician','operator','viewer') NOT NULL DEFAULT 'operator',
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `password_hash`, `user_type`, `email`, `created_at`) VALUES
(6, 'Matheus', '$2y$10$AracBtNHWYEZpY395NSCFO/0ara6xK2Y/Pv/Sy8Z0YiJZIt5vvF8G', 'admin', 'mat@com', '2025-11-11 13:52:41'),
(7, 'teste', '$2y$10$rJ1gmidD52x/4tKnkjkceeSwtYyuYgAz815srekvZmAk5FFm9Og6C', '', 'teste@com', '2025-11-17 20:18:17');

-- --------------------------------------------------------

--
-- Estrutura para view `latest_command`
--
DROP TABLE IF EXISTS `latest_command`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `latest_command`  AS SELECT `commands`.`id` AS `id`, `commands`.`timestamp` AS `timestamp`, `commands`.`command_name` AS `command_name`, `commands`.`value` AS `value` FROM `commands` WHERE `commands`.`executed` = 0 ORDER BY `commands`.`timestamp` DESC LIMIT 0, 1 ;

-- --------------------------------------------------------

--
-- Estrutura para view `latest_sensor_data`
--
DROP TABLE IF EXISTS `latest_sensor_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `latest_sensor_data`  AS SELECT `sensor_data`.`id` AS `id`, `sensor_data`.`timestamp` AS `timestamp`, `sensor_data`.`throttle_angle` AS `throttle_angle`, `sensor_data`.`temp_inlet` AS `temp_inlet`, `sensor_data`.`temp_outlet` AS `temp_outlet`, `sensor_data`.`pressure` AS `pressure`, `sensor_data`.`air_mass` AS `air_mass` FROM `sensor_data` ORDER BY `sensor_data`.`timestamp` DESC LIMIT 0, 1 ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `actuator_data`
--
ALTER TABLE `actuator_data`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `commands`
--
ALTER TABLE `commands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_commands_user_id` (`user_id`);

--
-- Índices de tabela `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `logs_fk_user` (`id_usuario`);

--
-- Índices de tabela `readings`
--
ALTER TABLE `readings`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `sensor_data`
--
ALTER TABLE `sensor_data`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `actuator_data`
--
ALTER TABLE `actuator_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `commands`
--
ALTER TABLE `commands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de tabela `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `readings`
--
ALTER TABLE `readings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de tabela `sensor_data`
--
ALTER TABLE `sensor_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `commands`
--
ALTER TABLE `commands`
  ADD CONSTRAINT `fk_commands_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Restrições para tabelas `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_fk_user` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
