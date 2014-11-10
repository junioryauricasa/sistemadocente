-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-11-2014 a las 21:02:36
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sistemadocente`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_insertar_alumno`(IN `Nombre` varchar(10), IN `ApellidoPaterno` varchar(10), IN `ApellidoMaterno` varchar(10),IN `Email` varchar(10), IN `op` integer)
if op=0 THEN
INSERT INTO alumno (Nombre,ApellidoPaterno,ApellidoMaterno,Email)
VALUES (Nombre,ApellidoPaterno,ApellidoMaterno,Email);
end if$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE IF NOT EXISTS `alumno` (
  `IdAlumno` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(145) NOT NULL,
  `ApellidoPaterno` varchar(145) NOT NULL,
  `ApellidoMaterno` varchar(145) NOT NULL,
  `Email` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`IdAlumno`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`IdAlumno`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `Email`) VALUES
(29, 'Sara', 'Huaman', 'Medina', 'sara@gmail.com'),
(30, 'marlon', 'peralta', 'panduro', 'marlo@gmail.com'),
(31, 'hernan', 'bacalla', 'placencia', 'hernan@gmail.com'),
(32, 'anthony', 'ramirez', 'quintana', 'anthony@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE IF NOT EXISTS `asistencia` (
  `alumno_IdAlumno` int(11) NOT NULL,
  `clase_IdClase` int(11) NOT NULL,
  `Asistio` bit(1) NOT NULL,
  `Observaciones` varchar(145) NOT NULL,
  PRIMARY KEY (`alumno_IdAlumno`,`clase_IdClase`),
  KEY `fk_alumno_has_clase_clase1_idx` (`clase_IdClase`),
  KEY `fk_alumno_has_clase_alumno1_idx` (`alumno_IdAlumno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`alumno_IdAlumno`, `clase_IdClase`, `Asistio`, `Observaciones`) VALUES
(29, 1, '1', '--'),
(30, 1, '1', '--'),
(31, 1, '1', '--'),
(32, 1, '1', '--');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centroeducativo`
--

CREATE TABLE IF NOT EXISTS `centroeducativo` (
  `IdCentroEducativo` int(11) NOT NULL AUTO_INCREMENT,
  `IdDocente` int(11) NOT NULL,
  `Descripcion` varchar(145) NOT NULL,
  `Ubicacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`IdCentroEducativo`),
  KEY `IdDocente_idx` (`IdDocente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `centroeducativo`
--

INSERT INTO `centroeducativo` (`IdCentroEducativo`, `IdDocente`, `Descripcion`, `Ubicacion`) VALUES
(1, 1, 'Ofelia Velasquez', '--'),
(2, 2, 'Simon Bolivar', '--'),
(3, 3, 'Jimenez Pimentel', '--'),
(4, 4, '0620 Aplicacion', '--');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE IF NOT EXISTS `clase` (
  `IdClase` int(11) NOT NULL AUTO_INCREMENT,
  `IdCurso` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`IdClase`),
  KEY `IdCurso_idx` (`IdCurso`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`IdClase`, `IdCurso`, `Fecha`) VALUES
(1, 1, '2014-11-20'),
(2, 2, '2014-11-19'),
(3, 3, '2014-11-18'),
(4, 4, '2014-11-17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criterio`
--

CREATE TABLE IF NOT EXISTS `criterio` (
  `IdCriterio` int(11) NOT NULL AUTO_INCREMENT,
  `IdTipoCriterio` int(11) NOT NULL,
  `Descripcion` varchar(145) NOT NULL,
  PRIMARY KEY (`IdCriterio`),
  KEY `IdTipoCriterio_idx` (`IdTipoCriterio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `criterio`
--

INSERT INTO `criterio` (`IdCriterio`, `IdTipoCriterio`, `Descripcion`) VALUES
(1, 1, 'Resolucion de ejercicios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE IF NOT EXISTS `curso` (
  `IdCurso` int(11) NOT NULL AUTO_INCREMENT,
  `IdCentroEducativo` int(11) NOT NULL,
  `Descripcion` varchar(145) NOT NULL,
  `Objetivo` varchar(145) NOT NULL,
  PRIMARY KEY (`IdCurso`),
  KEY `IdCentroEducativo_idx` (`IdCentroEducativo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`IdCurso`, `IdCentroEducativo`, `Descripcion`, `Objetivo`) VALUES
(1, 1, 'Matematica', '--'),
(2, 2, 'Comunicacion', '--'),
(3, 3, 'Actividad Artistica', '--'),
(4, 4, 'Ciencia tecnologia y Ambiente', '--');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE IF NOT EXISTS `docente` (
  `IdDocente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(145) NOT NULL,
  `ApellidoPaterno` varchar(145) NOT NULL,
  `ApellidoMaterno` varchar(145) NOT NULL,
  `Celular` varchar(10) DEFAULT NULL,
  `Email` varchar(155) DEFAULT NULL,
  `Edad` varchar(2) DEFAULT NULL,
  `Sexo` varchar(1) DEFAULT NULL,
  `Dni` varchar(8) DEFAULT NULL,
  `Contraseña` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`IdDocente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`IdDocente`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `Celular`, `Email`, `Edad`, `Sexo`, `Dni`, `Contraseña`) VALUES
(1, 'Anthony', 'Ramirez', 'Quintana', '999999999', 'anthony@gmail.com', '20', 'M', '11111111', '11111111'),
(2, 'Marlon', 'Peralta', 'Panduro', '999999999', 'marlon@gmail.com', '19', 'M', '22222222', '22222222'),
(3, 'Sara ', 'Huaman', 'Medina', '999999999', 'sara@gmail.com', '19', 'F', '76518229', '76518229'),
(4, 'Hernan', 'Bacalla', 'Plasencia', '999999999', 'hernan@gmail.com', '19', 'M', '33333333', '33333333');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE IF NOT EXISTS `especialidad` (
  `IdEspecialidad` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(145) NOT NULL,
  `IdDocente` int(11) NOT NULL,
  PRIMARY KEY (`IdEspecialidad`),
  KEY `fk_especialidad_docente1_idx` (`IdDocente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`IdEspecialidad`, `Descripcion`, `IdDocente`) VALUES
(1, 'Fisico Matematico', 1),
(2, 'Quimico', 2),
(3, 'Comunicacion', 3),
(4, 'Biologo', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE IF NOT EXISTS `evaluacion` (
  `IdPeriodo` int(11) NOT NULL,
  `IdCriterio` int(11) NOT NULL,
  `Nota` double(2,0) NOT NULL,
  PRIMARY KEY (`IdPeriodo`,`IdCriterio`),
  KEY `fk_periodo_has_criterio_criterio1_idx` (`IdCriterio`),
  KEY `fk_periodo_has_criterio_periodo1_idx` (`IdPeriodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evaluacion`
--

INSERT INTO `evaluacion` (`IdPeriodo`, `IdCriterio`, `Nota`) VALUES
(1, 1, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE IF NOT EXISTS `grado` (
  `IdGrado` int(11) NOT NULL,
  `Descripcion` varchar(1) NOT NULL,
  `IdCurso` int(11) NOT NULL,
  PRIMARY KEY (`IdGrado`,`IdCurso`),
  KEY `fk_grado_curso1_idx` (`IdCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`IdGrado`, `Descripcion`, `IdCurso`) VALUES
(1, '1', 1),
(2, '2', 1),
(3, '3', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE IF NOT EXISTS `periodo` (
  `IdCurso` int(11) NOT NULL,
  `IdTipoPeriodo` int(11) NOT NULL,
  `IdPeriodo` int(11) NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaTermino` date NOT NULL,
  PRIMARY KEY (`IdPeriodo`),
  KEY `fk_curso_has_tipoperiodo_tipoperiodo1_idx` (`IdTipoPeriodo`),
  KEY `fk_curso_has_tipoperiodo_curso1_idx` (`IdCurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `periodo`
--

INSERT INTO `periodo` (`IdCurso`, `IdTipoPeriodo`, `IdPeriodo`, `FechaInicio`, `FechaTermino`) VALUES
(1, 1, 1, '2014-11-01', '2015-01-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion`
--

CREATE TABLE IF NOT EXISTS `seccion` (
  `IdSeccion` int(11) NOT NULL AUTO_INCREMENT,
  `IdGrado` int(11) NOT NULL,
  `Descripcion` varchar(1) NOT NULL,
  PRIMARY KEY (`IdSeccion`),
  KEY `IdGrado_idx` (`IdGrado`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `seccion`
--

INSERT INTO `seccion` (`IdSeccion`, `IdGrado`, `Descripcion`) VALUES
(1, 1, 'A'),
(2, 1, 'C');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocriterio`
--

CREATE TABLE IF NOT EXISTS `tipocriterio` (
  `IdTipoCriterio` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`IdTipoCriterio`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `tipocriterio`
--

INSERT INTO `tipocriterio` (`IdTipoCriterio`, `Descripcion`) VALUES
(1, 'Razonamiento y Demostracion'),
(2, 'Comunicacion '),
(3, 'Resolucion de Problemas'),
(4, 'Actitud ante el area');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoperiodo`
--

CREATE TABLE IF NOT EXISTS `tipoperiodo` (
  `IdTipoPeriodo` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(145) NOT NULL,
  PRIMARY KEY (`IdTipoPeriodo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tipoperiodo`
--

INSERT INTO `tipoperiodo` (`IdTipoPeriodo`, `Descripcion`) VALUES
(1, 'Semestral'),
(2, 'Trimestral');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD CONSTRAINT `fk_alumno_has_clase_alumno1` FOREIGN KEY (`alumno_IdAlumno`) REFERENCES `alumno` (`IdAlumno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_alumno_has_clase_clase1` FOREIGN KEY (`clase_IdClase`) REFERENCES `clase` (`IdClase`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `centroeducativo`
--
ALTER TABLE `centroeducativo`
  ADD CONSTRAINT `IdDocente` FOREIGN KEY (`IdDocente`) REFERENCES `docente` (`IdDocente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `IdCurso` FOREIGN KEY (`IdCurso`) REFERENCES `curso` (`IdCurso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `criterio`
--
ALTER TABLE `criterio`
  ADD CONSTRAINT `IdTipoCriterio` FOREIGN KEY (`IdTipoCriterio`) REFERENCES `tipocriterio` (`IdTipoCriterio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `IdCentroEducativo` FOREIGN KEY (`IdCentroEducativo`) REFERENCES `centroeducativo` (`IdCentroEducativo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD CONSTRAINT `fk_especialidad_docente1` FOREIGN KEY (`IdDocente`) REFERENCES `docente` (`IdDocente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD CONSTRAINT `fk_periodo_has_criterio_criterio1` FOREIGN KEY (`IdCriterio`) REFERENCES `criterio` (`IdCriterio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_periodo_has_criterio_periodo1` FOREIGN KEY (`IdPeriodo`) REFERENCES `periodo` (`IdPeriodo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grado`
--
ALTER TABLE `grado`
  ADD CONSTRAINT `fk_grado_curso1` FOREIGN KEY (`IdCurso`) REFERENCES `curso` (`IdCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `periodo`
--
ALTER TABLE `periodo`
  ADD CONSTRAINT `fk_curso_has_tipoperiodo_curso1` FOREIGN KEY (`IdCurso`) REFERENCES `curso` (`IdCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_curso_has_tipoperiodo_tipoperiodo1` FOREIGN KEY (`IdTipoPeriodo`) REFERENCES `tipoperiodo` (`IdTipoPeriodo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `seccion`
--
ALTER TABLE `seccion`
  ADD CONSTRAINT `IdGrado` FOREIGN KEY (`IdGrado`) REFERENCES `grado` (`IdGrado`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
