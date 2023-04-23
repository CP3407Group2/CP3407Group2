-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema 3407_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema 3407_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `3407_db` DEFAULT CHARACTER SET utf8 ;
USE `3407_db` ;

-- -----------------------------------------------------
-- Table `3407_db`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3407_db`.`customer` (
  `customer_ID` INT NOT NULL,
  `customer_name` VARCHAR(45) NULL,
  `customer_date of birth` VARCHAR(45) NULL,
  `customer_age` VARCHAR(45) NULL,
  `customer_gender` VARCHAR(45) NULL,
  `customer_create time` DATETIME NULL,
  `customer_update time` TIMESTAMP NULL,
  `customer_phone number` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3407_db`.`Shop owner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3407_db`.`Shop owner` (
  `Shop owner_ID` INT NOT NULL,
  `Shop owner_name` VARCHAR(45) NULL,
  `Shop owner_gender` VARCHAR(45) NULL,
  `Shop owner_age` VARCHAR(45) NULL,
  `Shop owner_create time` DATETIME NULL,
  `Shop owner_update time` TIMESTAMP NULL,
  `Shop owner_phone number` VARCHAR(45) NULL,
  PRIMARY KEY (`Shop owner_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3407_db`.`Shopping mall`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3407_db`.`Shopping mall` (
  `Shopping mall_ID` INT NOT NULL,
  `Shopping mall_name` VARCHAR(45) NULL,
  `Shopping mall_create time` DATETIME NULL,
  `Shopping mall_update time` TIMESTAMP NULL,
  `Shopping mall_location` VARCHAR(45) NULL,
  `Shopping mall_profile` TEXT NULL,
  PRIMARY KEY (`Shopping mall_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3407_db`.`Store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3407_db`.`Store` (
  `Store_ID` INT NOT NULL,
  `Store_name` VARCHAR(45) NULL,
  `Store_products` VARCHAR(45) NULL,
  `Store_location` VARCHAR(45) NULL,
  `Store_contact information` VARCHAR(45) NULL,
  `Store_business hours` VARCHAR(45) NULL,
  `Store_create time` DATETIME NULL,
  `Store_update time` TIMESTAMP NULL,
  `Shopping mall_ID` INT NOT NULL,
  `Store_business license` VARCHAR(45) NULL,
  `Store_profile` TEXT NULL,
  PRIMARY KEY (`Store_ID`, `Shopping mall_ID`),
  INDEX `fk_Store_Shopping mall1_idx` (`Shopping mall_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Store_Shopping mall1`
    FOREIGN KEY (`Shopping mall_ID`)
    REFERENCES `3407_db`.`Shopping mall` (`Shopping mall_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3407_db`.`Preferential activities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3407_db`.`Preferential activities` (
  `Preferential activities_ID` INT NOT NULL,
  `Preferential activities_create time` DATETIME NULL,
  `Preferential activities_update time` TIMESTAMP NULL,
  `Store_ID` INT NOT NULL,
  `Preferential activities_favorable price` VARCHAR(45) NULL,
  `Preferential activities_activity time` VARCHAR(45) NULL,
  `Preferential activities_activity details` TEXT NULL,
  PRIMARY KEY (`Preferential activities_ID`, `Store_ID`),
  INDEX `fk_Preferential activities_Store1_idx` (`Store_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Preferential activities_Store1`
    FOREIGN KEY (`Store_ID`)
    REFERENCES `3407_db`.`Store` (`Store_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3407_db`.`Shop owner_has_Store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3407_db`.`Shop owner_has_Store` (
  `Shop owner_ID` INT NOT NULL,
  `Store_ID` INT NOT NULL,
  PRIMARY KEY (`Shop owner_ID`, `Store_ID`),
  INDEX `fk_Shop owner_has_Store_Store1_idx` (`Store_ID` ASC) VISIBLE,
  INDEX `fk_Shop owner_has_Store_Shop owner_idx` (`Shop owner_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Shop owner_has_Store_Shop owner`
    FOREIGN KEY (`Shop owner_ID`)
    REFERENCES `3407_db`.`Shop owner` (`Shop owner_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shop owner_has_Store_Store1`
    FOREIGN KEY (`Store_ID`)
    REFERENCES `3407_db`.`Store` (`Store_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `3407_db`.`Shopping mall manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `3407_db`.`Shopping mall manager` (
  `Shopping mall manager_ID` INT NOT NULL,
  `Shopping mall manager_name` VARCHAR(45) NULL,
  `Shopping mall manager_gender` VARCHAR(45) NULL,
  `Shopping mall manager_age` VARCHAR(45) NULL,
  `Shopping mall manager_phone number` VARCHAR(45) NULL,
  `Shopping mall_ID` INT NOT NULL,
  PRIMARY KEY (`Shopping mall manager_ID`, `Shopping mall_ID`),
  INDEX `fk_Shopping mall manager_Shopping mall1_idx` (`Shopping mall_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Shopping mall manager_Shopping mall1`
    FOREIGN KEY (`Shopping mall_ID`)
    REFERENCES `3407_db`.`Shopping mall` (`Shopping mall_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
