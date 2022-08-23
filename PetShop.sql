
CREATE SCHEMA IF NOT EXISTS `PetShop` DEFAULT CHARACTER SET utf8 ;
USE `PetShop` ;

-- -----------------------------------------------------
-- Table `PetShop`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PetShop`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `bairro` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numeroCasa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEndereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PetShop`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PetShop`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `numeroCasa` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` DECIMAL(2) NOT NULL,
  `fkEndereco` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
    FOREIGN KEY (`fkEndereco`)
    REFERENCES `PetShop`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `PetShop`.`Raca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PetShop`.`Raca` (
  `idRaca` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `porte` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRaca`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PetShop`.`Pet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PetShop`.`Pet` (
  `idPet` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idade` DECIMAL(2) NOT NULL,
  `porte` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(45) NULL,
  `fkCliente` INT NOT NULL,
  `fkRaca` INT NOT NULL,
  PRIMARY KEY (`idPet`),
    FOREIGN KEY (`fkCliente`)
    REFERENCES `PetShop`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`fkRaca`)
    REFERENCES `PetShop`.`Raca` (`idRaca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `PetShop`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PetShop`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `fkCliente` INT NOT NULL,
  `nomeCliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTelefone`),
    FOREIGN KEY (`fkCliente`)
    REFERENCES `PetShop`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `PetShop`.`Agenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PetShop`.`Agenda` (
  `idAgenda` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `fkTelefone` INT NOT NULL,
  PRIMARY KEY (`idAgenda`),
    FOREIGN KEY (`fkTelefone`)
    REFERENCES `PetShop`.`Telefone` (`idTelefone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `PetShop`.`Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PetShop`.`Servico` (
  `idServico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  `fkPet` INT NULL,
  `fkAgenda` INT NOT NULL,
  PRIMARY KEY (`idServico`),
    FOREIGN KEY (`fkPet`)
    REFERENCES `PetShop`.`Pet` (`idPet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`fkAgenda`)
    REFERENCES `PetShop`.`Agenda` (`idAgenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `PetShop`.`ServicoFeito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PetShop`.`ServicoFeito` (
  `idServicoFeito` INT NOT NULL AUTO_INCREMENT,
  `fkServico` INT NOT NULL,
  PRIMARY KEY (`idServicoFeito`),
    FOREIGN KEY (`fkServico`)
    REFERENCES `PetShop`.`Servico` (`idServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



