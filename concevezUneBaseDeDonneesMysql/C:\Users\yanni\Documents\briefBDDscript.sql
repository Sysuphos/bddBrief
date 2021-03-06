-- MySQL Script generated by MySQL Workbench
-- dim. 01 nov. 2020 18:09:19 CET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Professeur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Professeur` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Professeur` (
  `idProfesseur` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `competence` VARCHAR(45) NULL,
  PRIMARY KEY (`idProfesseur`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Adresse`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Adresse` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Adresse` (
  `idAdresse` INT NOT NULL AUTO_INCREMENT,
  `rue` VARCHAR(45) NULL,
  `numero` INT NULL,
  `ville` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAdresse`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Etudiant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Etudiant` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Etudiant` (
  `idEtudiant` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `diplome` VARCHAR(45) NULL,
  `Adresse_idAdresse` INT NOT NULL,
  PRIMARY KEY (`idEtudiant`),
  UNIQUE INDEX `idEtudiant_UNIQUE` (`idEtudiant` ASC) VISIBLE,
  INDEX `fk_Etudiant_Adresse1_idx` (`Adresse_idAdresse` ASC) VISIBLE,
  CONSTRAINT `fk_Etudiant_Adresse1`
    FOREIGN KEY (`Adresse_idAdresse`)
    REFERENCES `mydb`.`Adresse` (`idAdresse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Salle`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Salle` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Salle` (
  `idSalle` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idSalle`),
  UNIQUE INDEX `nom_UNIQUE` (`nom` ASC) VISIBLE,
  UNIQUE INDEX `idNom_UNIQUE` (`idSalle` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cours`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Cours` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Cours` (
  `idCours` INT NOT NULL AUTO_INCREMENT,
  `heurDebut` DATETIME NULL,
  `heureFin` DATETIME NULL,
  `Salle_idNom` INT NOT NULL,
  `Professeur_idProfesseur` INT NOT NULL,
  PRIMARY KEY (`idCours`),
  INDEX `fk_Cours_Salle1_idx` (`Salle_idNom` ASC),
  INDEX `fk_Cours_Professeur1_idx` (`Professeur_idProfesseur` ASC),
  CONSTRAINT `fk_Cours_Salle1`
    FOREIGN KEY (`Salle_idNom`)
    REFERENCES `mydb`.`Salle` (`idSalle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cours_Professeur1`
    FOREIGN KEY (`Professeur_idProfesseur`)
    REFERENCES `mydb`.`Professeur` (`idProfesseur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Participant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Participant` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Participant` (
  `idParticipant` INT NOT NULL AUTO_INCREMENT,
  `place` VARCHAR(45) NOT NULL,
  `Cours_idCours` INT NOT NULL,
  `Etudiant_idEtudiant` INT NOT NULL,
  PRIMARY KEY (`idParticipant`),
  INDEX `fk_Participant_Cours_idx` (`Cours_idCours` ASC) VISIBLE,
  INDEX `fk_Participant_Etudiant1_idx` (`Etudiant_idEtudiant` ASC) VISIBLE,
  CONSTRAINT `fk_Participant_Cours`
    FOREIGN KEY (`Cours_idCours`)
    REFERENCES `mydb`.`Cours` (`idCours`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Participant_Etudiant1`
    FOREIGN KEY (`Etudiant_idEtudiant`)
    REFERENCES `mydb`.`Etudiant` (`idEtudiant`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
