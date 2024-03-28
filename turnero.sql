-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3360
-- Generation Time: Mar 27, 2024 at 09:48 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `turnero`
--

-- --------------------------------------------------------

--
-- Table structure for table `ciudadano`
--

CREATE TABLE `ciudadano` (
  `ID_CIUDADANO` int(11) NOT NULL,
  `APELLIDO` varchar(255) DEFAULT NULL,
  `DIRECCION` varchar(255) DEFAULT NULL,
  `DNI` varchar(255) DEFAULT NULL,
  `FECHANAC` date DEFAULT NULL,
  `NOMBRE` varchar(255) DEFAULT NULL,
  `TELEFONO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ciudadano`
--

INSERT INTO `ciudadano` (`ID_CIUDADANO`, `APELLIDO`, `DIRECCION`, `DNI`, `FECHANAC`, `NOMBRE`, `TELEFONO`) VALUES
(1, 'Romero', 'Calle Goya, 15', '66699888L', '1986-06-03', 'Juan', '698523669'),
(2, 'Alonso', 'Calle Bravo Murillo, 125', '66633322M', '1979-05-12', 'Marta', '644555888'),
(3, 'Moreno', 'Calle Ginzo de Limia, 45', '77788999N', '1949-11-08', 'Carlos', '666777888'),
(4, 'Monereo', 'Calle Ponzano, 3', '88899777F', '1980-06-20', 'Miguel', '633222111'),
(5, 'Ramos', 'Calle Romero, 78', '99933666D', '1998-01-04', 'Esmeralda', '644222666'),
(6, 'Roca', 'Calle Pintado, 35', '44488325J', '2001-12-08', 'Antonio', '666999777'),
(7, 'Rubio', 'Calle Roma, 35', '65878632M', '1995-11-12', 'Amalia', '688797556'),
(8, 'Torres', 'Calle Rosales, 135', '98742653H', '1980-02-01', 'Vanesa', '788969554'),
(9, 'Serrano', 'Calle Marinero, 12', '56789354F', '2005-05-15', 'Isabel', '687432141'),
(10, 'Gil', 'Calle Zarzalejo, 250', '28579633E', '1949-11-22', 'David', '745983225'),
(11, 'Moreno', 'Calle Haya, 80', '57963297T', '1992-06-08', 'Laura', '698743652');

-- --------------------------------------------------------

--
-- Table structure for table `turno`
--

CREATE TABLE `turno` (
  `IDTURNO` int(11) NOT NULL,
  `DESCRIPCIONTRAMITE` varchar(255) DEFAULT NULL,
  `ESTADO` varchar(255) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `ciudadano_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `turno`
--

INSERT INTO `turno` (`IDTURNO`, `DESCRIPCIONTRAMITE`, `ESTADO`, `FECHA`, `ciudadano_id`) VALUES
(1, 'Renovar Dni', 'En espera', '2024-04-03', 1),
(2, 'Renovar Pasaporte', 'En espera', '2024-03-31', 1),
(3, 'Denuncia Robo', 'En espera', '2024-04-10', 2),
(4, 'Renovar Dni', 'En espera', '2024-05-05', 2),
(5, 'Renovar Pasaporte', 'En espera', '2024-05-04', 2),
(6, 'Renovar Tarjeta Sanitaria', 'En espera', '2024-04-10', 3),
(7, 'Renovar Carnet Conducir', 'En espera', '2024-05-05', 3),
(8, 'Denuncia Robo', 'En espera', '2024-03-31', 4),
(9, 'Renovar Tarjeta Sanitaria', 'En espera', '2024-04-03', 5),
(10, 'Renovar Carnet Conducir', 'En espera', '2024-04-10', 6),
(11, 'Renovar Carnet Conducir', 'En espera', '2024-05-12', 11),
(12, 'Renovar Carnet Conducir', 'Ya atendido', '2024-03-12', 9),
(13, 'Renovar Dni', 'Ya atendido', '2024-02-05', 7),
(14, 'Renovar Pasaporte', 'Ya atendido', '2024-02-01', 9),
(15, 'Renovar Carnet Conducir', 'Ya atendido', '2024-03-03', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ciudadano`
--
ALTER TABLE `ciudadano`
  ADD PRIMARY KEY (`ID_CIUDADANO`);

--
-- Indexes for table `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`IDTURNO`),
  ADD KEY `FK_TURNO_ciudadano_id` (`ciudadano_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ciudadano`
--
ALTER TABLE `ciudadano`
  MODIFY `ID_CIUDADANO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `turno`
--
ALTER TABLE `turno`
  MODIFY `IDTURNO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `FK_TURNO_ciudadano_id` FOREIGN KEY (`ciudadano_id`) REFERENCES `ciudadano` (`ID_CIUDADANO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
