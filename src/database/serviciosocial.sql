-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-06-2022 a las 03:29:08
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE DATABASE serviciosocial;
--
-- Base de datos: `serviciosocial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `controlhoras`
--

CREATE TABLE `controlhoras` (
  `numhoras` int(5) NOT NULL,
  `fechainicio` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fechafinal` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `institucion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `carnet` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `controlhoras`
--

INSERT INTO `controlhoras` (`numhoras`, `fechainicio`, `fechafinal`, `institucion`, `carnet`) VALUES
(20, '2022-06-14', '2022-06-16', 'INS', 'CG19030'),
(20, '2022-06-13', '2022-06-15', 'INS', 'CG19030'),
(60, '2022-06-15', '2022-06-16', 'INS', 'CG19030');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `idtutor` int(5) NOT NULL,
  `nombres` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `facultad` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` int(10) NOT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(20) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`idtutor`, `nombres`, `apellidos`, `facultad`, `telefono`, `direccion`, `usuario`, `pass`) VALUES
(1001, 'Juan Francisco', 'Gutierrez Velasco', 'Facultad de Ciencias Agronomicas', 74856859, 'Ave. Norte', 'FG0911', '111'),
(1002, 'Natalia Andrea', 'Ovalle Solano', 'Facultad de Ciencias Economicas', 79682536, 'Av. Nueva Concepcion', 'AO2050', '222'),
(1003, 'Oscar Fabian', 'Fuentes Perdomo', 'Facultad de Odontologia', 73659874, 'Av. 16 de Julio', 'PF3012', '333'),
(1004, 'Rafael Alejandro', 'Alvarez Castillo', 'Facultad de Ingenieria y Arquitectura', 71245685, 'Plaza Constitucion No 1', 'AC7011', '444'),
(1005, 'Jorge Esteban', 'Sanchez Parada', 'Facultad de Ciencias y Humanidades', 76356895, 'Av. Juarez', 'EP6041', '555');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `carnet` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `pass` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `nombres` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(11) COLLATE utf8_spanish_ci NOT NULL,
  `carrera` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `facultad` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `area` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `codigocarrera` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `idtutor` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`carnet`, `pass`, `nombres`, `apellidos`, `telefono`, `carrera`, `facultad`, `area`, `codigocarrera`, `email`, `estado`, `idtutor`) VALUES
('CG19030', '', 'Julio', 'Cruz', '7292537', 'Ingeniería de S', 'Facultad de Ciencias Econ', 'S', 'E10101', 'jcesargarcia051', 'en revision', 1001),
('OF29120', '', 'Juan', 'Rivas', '75214141', 'Ingenieria Agro', 'Facultad de Ciencias Agro', 'dd', 'B10101', 'asjajs@gmail.co', 'en proceso', 1001);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `controlhoras`
--
ALTER TABLE `controlhoras`
  ADD KEY `idestudiante` (`carnet`),
  ADD KEY `idestudiante_2` (`carnet`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`idtutor`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`carnet`),
  ADD KEY `idtutor` (`idtutor`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `controlhoras`
--
ALTER TABLE `controlhoras`
  ADD CONSTRAINT `controlhoras_ibfk_1` FOREIGN KEY (`carnet`) REFERENCES `estudiante` (`carnet`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`idtutor`) REFERENCES `docente` (`idtutor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
