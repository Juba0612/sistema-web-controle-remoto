-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07/11/2025 às 03:51
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ltr_control_equipe4`
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
  `target_temperature` float NOT NULL,
  `executed` tinyint(1) DEFAULT 0,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `commands`
--

INSERT INTO `commands` (`id`, `timestamp`, `target_temperature`, `executed`, `user_id`) VALUES
(1, '2025-11-06 23:14:34', 35.5, 0, 1);

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `latest_command`
-- (Veja abaixo para a visão atual)
--
CREATE TABLE `latest_command` (
`id` int(11)
,`timestamp` datetime
,`target_temperature` float
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
(4, '2025-11-06 23:32:16', 50.2, 30.5, 45, 102.3, 29.8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `user_type` enum('admin','standart') NOT NULL DEFAULT 'standart',
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `password_hash`, `user_type`, `email`, `created_at`) VALUES
(1, 'UsuarioTeste', '123456', 'standart', 'user@test.com', '2025-11-07 02:14:34');

-- --------------------------------------------------------

--
-- Estrutura para view `latest_command`
--
DROP TABLE IF EXISTS `latest_command`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `latest_command`  AS SELECT `commands`.`id` AS `id`, `commands`.`timestamp` AS `timestamp`, `commands`.`target_temperature` AS `target_temperature` FROM `commands` WHERE `commands`.`executed` = 0 ORDER BY `commands`.`timestamp` DESC LIMIT 0, 1 ;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sensor_data`
--
ALTER TABLE `sensor_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `commands`
--
ALTER TABLE `commands`
  ADD CONSTRAINT `fk_commands_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
