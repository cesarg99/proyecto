
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema serviciosocial_1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema serviciosocial_1
-- -----------------------------------------------------
CREATE DATABASE `serviciosocial_1`;
USE `serviciosocial_1` ;

-- -----------------------------------------------------
-- Table `serviciosocial_1`.`docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serviciosocial_1`.`docente` (
  `idtutor` INT NOT NULL,
  `nombres` VARCHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `apellidos` VARCHAR(60) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `facultad` VARCHAR(120) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `telefono` INT NOT NULL,
  `direccion` VARCHAR(120) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `usuario` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `pass` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  PRIMARY KEY (`idtutor`));

INSERT INTO `docente` (`idtutor`, `nombres`, `apellidos`, `facultad`, `telefono`, `direccion`, `usuario`, `pass`) VALUES
(1001, 'Juan Francisco', 'Gutierrez Velasco', 'Facultad de Ciencias Agronomicas', 74856859, 'Ave. Norte', 'FG0911', '$2a$10$lWf2aDjLx6UITtboWdrZ9eq/ZsEAzeW2W714XtYI.ur8PDdMS9L7G'),
(1002, 'Natalia Andrea', 'Ovalle Solano', 'Facultad de Ciencias Economicas', 79682536, 'Av. Nueva Concepcion', 'AO2050', '$2a$10$7w.6ipv4hrbD9p76GYPXGeNn6BlJXJPwJ6NOtLShh7tca.KFFCuAC'),
(1003, 'Oscar Fabian', 'Fuentes Perdomo', 'Facultad de Odontologia', 73659874, 'Av. 16 de Julio', 'PF3012', '$2a$10$4MRSk1UCzffnE2jot18.Vub7Y2K7l46TVfqX0y5wZefIlS9eJ7ewW'),
(1004, 'Rafael Alejandro', 'Alvarez Castillo', 'Facultad de Ingenieria y Arquitectura', 71245685, 'Plaza Constitucion No 1', 'AC7011', '$2a$10$IUZK2Zk4wfkCeg5ubQVd4u7cofo3blsbLIBBKWS0A4b1iRsnB1NqG'),
(1005, 'Jorge Esteban', 'Sanchez Parada', 'Facultad de Ciencias y Humanidades', 76356895, 'Av. Juarez', 'EP6041', '$2a$10$I9ux52bCoH4QvYvHctxlauHFW3FGhmxMWA6DEAp/OpkDp4w6bEX0q');


-- -----------------------------------------------------
-- Table `serviciosocial_1`.`estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serviciosocial_1`.`estudiante` (
  `carnet` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `pass` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `nombres` VARCHAR(25) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `apellidos` VARCHAR(25) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `telefono` VARCHAR(9) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `carrera` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `facultad` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `area` VARCHAR(90) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `codigocarrera` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `email` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `estado` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `idtutor` INT NOT NULL,
  PRIMARY KEY (`carnet`),
  INDEX `idtutor` (`idtutor` ASC) VISIBLE,
  CONSTRAINT `estudiante_ibfk_1`
    FOREIGN KEY (`idtutor`)
    REFERENCES `serviciosocial_1`.`docente` (`idtutor`));


-- -----------------------------------------------------
-- Table `serviciosocial_1`.`controlhoras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serviciosocial_1`.`controlhoras` (
  `numhoras` INT NOT NULL,
  `fechainicio` DATE NOT NULL,
  `fechafinal` DATE NOT NULL,
  `institucion` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `carnet` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  INDEX `idestudiante` (`carnet` ASC) VISIBLE,
  INDEX `idestudiante_1` (`carnet` ASC) VISIBLE,
  CONSTRAINT `controlhoras_ibfk_1`
    FOREIGN KEY (`carnet`)
    REFERENCES `serviciosocial_1`.`estudiante` (`carnet`));
