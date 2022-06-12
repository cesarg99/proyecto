-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema serviciosocial_1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema serviciosocial_1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `serviciosocial_1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `serviciosocial_1` ;

-- -----------------------------------------------------
-- Table `serviciosocial_1`.`docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serviciosocial_1`.`docente` (
  `idtutor` INT NOT NULL,
  `nombres` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `apellidos` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `facultad` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `telefono` INT NOT NULL,
  `direccion` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `usuario` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `pass` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  PRIMARY KEY (`idtutor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `serviciosocial_1`.`estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serviciosocial_1`.`estudiante` (
  `carnet` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `pass` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `nombres` VARCHAR(25) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `apellidos` VARCHAR(25) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `telefono` VARCHAR(9) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `carrera` VARCHAR(70) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `facultad` VARCHAR(70) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `area` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `codigocarrera` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `email` VARCHAR(25) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `estado` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  `idtutor` INT NOT NULL,
  PRIMARY KEY (`carnet`),
  INDEX `idtutor` (`idtutor` ASC) VISIBLE,
  CONSTRAINT `estudiante_ibfk_1`
    FOREIGN KEY (`idtutor`)
    REFERENCES `serviciosocial_1`.`docente` (`idtutor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


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
  INDEX `idestudiante_2` (`carnet` ASC) VISIBLE,
  CONSTRAINT `controlhoras_ibfk_1`
    FOREIGN KEY (`carnet`)
    REFERENCES `serviciosocial_1`.`estudiante` (`carnet`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
