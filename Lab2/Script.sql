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
-- Table `mydb`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `id_client` INT NOT NULL AUTO_INCREMENT,
  `full_name` NVARCHAR(45) NOT NULL,
  `passport` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE INDEX `id_UNIQUE` (`id_client` ASC) VISIBLE,
  UNIQUE INDEX `full_name_UNIQUE` (`full_name` ASC) VISIBLE,
  UNIQUE INDEX `passport_UNIQUE` (`passport` ASC) VISIBLE,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comfortable`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comfortable` (
  `id_comfortable` INT NOT NULL AUTO_INCREMENT,
  `type` NVARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`id_comfortable`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`room` (
  `id_room` INT NOT NULL AUTO_INCREMENT,
  `id_comfortable` INT NOT NULL,
  `floor` SMALLINT NOT NULL,
  PRIMARY KEY (`id_room`),
  INDEX `Comfortable_idx` (`id_comfortable` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id_room` ASC) VISIBLE,
  CONSTRAINT `RoomComfortable`
    FOREIGN KEY (`id_comfortable`)
    REFERENCES `mydb`.`comfortable` (`id_comfortable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`living`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`living` (
  `id_living` INT NOT NULL AUTO_INCREMENT,
  `id_room` INT NOT NULL,
  `factually_arrive` DATETIME NULL,
  `factually_leaving` DATETIME NULL,
  INDEX `Room_idx` (`id_room` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id_living` ASC) VISIBLE,
  PRIMARY KEY (`id_living`),
  CONSTRAINT `RoomLiving`
    FOREIGN KEY (`id_room`)
    REFERENCES `mydb`.`room` (`id_room`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reservation` (
  `id_reservation` INT NOT NULL AUTO_INCREMENT,
  `id_client` INT NOT NULL,
  `id_comfortable` INT NOT NULL,
  `id_living` INT NOT NULL,
  `date_arrival` DATETIME NOT NULL,
  `date_leaving` DATETIME NOT NULL,
  `nutrition` TINYINT NULL,
  PRIMARY KEY (`id_reservation`),
  INDEX `Comfortable_idx` (`id_comfortable` ASC) VISIBLE,
  INDEX `Client_idx` (`id_client` ASC) VISIBLE,
  UNIQUE INDEX `id_reservation_UNIQUE` (`id_reservation` ASC) VISIBLE,
  INDEX `fk_reservation_living1_idx` (`id_living` ASC) VISIBLE,
  CONSTRAINT `ClientReservation`
    FOREIGN KEY (`id_client`)
    REFERENCES `mydb`.`client` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ReservComfortable`
    FOREIGN KEY (`id_comfortable`)
    REFERENCES `mydb`.`comfortable` (`id_comfortable`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservation_living1`
    FOREIGN KEY (`id_living`)
    REFERENCES `mydb`.`living` (`id_living`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
