-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-08-2024 a las 07:08:25
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rest-api2`
--
CREATE DATABASE IF NOT EXISTS `rest-api2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `rest-api2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros2`
--

CREATE TABLE `libros2` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `autor` varchar(30) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `año_publicacion` date NOT NULL,
  `ISBN` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libros2`
--

INSERT INTO `libros2` (`id`, `nombre`, `autor`, `categoria`, `año_publicacion`, `ISBN`) VALUES
(9, 'Cien años de soledad', 'Gabriel García Márquez', 'Ficción', '1967-06-05', '978-3-16-1484'),
(10, '1984 Actual', 'George Orwell Actual', 'Ficción Actual', '1949-06-08', '978-0-452-333'),
(11, 'El Principito', 'Antoine de Saint-Exupéry', 'Ficción', '1943-04-06', '999-3-16-1484'),
(12, 'El arte de la guerra', 'Sun Tzu', 'No Ficción', '0500-01-01', '978-0-7432-73'),
(13, 'Diseño Agregado', 'Nuria Agregada', 'Ing, Informatica Agregada', '2010-10-02', '9789502305999'),
(37, 'Marketing Extraordinario', 'Damian Di Pace', 'Economia', '2016-06-05', '978-9-50-2325'),
(43, 'El estudio de los signos', 'Maria Alejandra Vitale', 'Semiotica', '2010-04-01', '9789502312347'),
(47, 'Tiroteo por Telefono', 'Autor Equis', 'Ficción', '2024-09-05', '6573068740321'),
(48, 'Polvareda bajo el mar', 'Autor Equis', 'Ficción', '2024-05-05', '3975309598762'),
(78, '65 Libro', 'Autor Equis', 'Ficción', '2024-01-01', '458-3-16-6598'),
(79, 'El arte de la guerra 61', 'Sun Tzu', ' Ficción', '0500-01-01', '528-9-2701-22'),
(80, 'El arte de la guerra 458', 'Sun Tzu', 'No Ficción', '0500-01-01', '548-10-5-4879'),
(86, '656 Libro', 'Autor Equis', 'Ficción', '2024-01-05', '7895023059856');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libros2`
--
ALTER TABLE `libros2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ISBN` (`ISBN`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `libros2`
--
ALTER TABLE `libros2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
