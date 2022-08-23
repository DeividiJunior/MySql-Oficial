
CREATE SCHEMA IF NOT EXISTS `barbearia` DEFAULT CHARACTER SET utf8 ;
USE `barbearia` ;

-- -----------------------------------------------------
-- Table `barbearia`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barbearia`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barbearia`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barbearia`.`Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barbearia`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barbearia`.`Venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `valor` VARCHAR(45) NOT NULL,
  `fkCliente` INT NOT NULL,
  `fkFuncionario` INT NOT NULL,
  PRIMARY KEY (`idVenda`),
    FOREIGN KEY (`fkCliente`)
    REFERENCES `barbearia`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`fkFuncionario`)
    REFERENCES `barbearia`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barbearia`.`Servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barbearia`.`Servico` (
  `idServico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`idServico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `barbearia`.`ServicosFeitos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barbearia`.`ServicosFeitos` (
  `idServicosFeitos` INT NOT NULL AUTO_INCREMENT,
  `fkServico` INT NOT NULL,
  `fkVenda` INT NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`idServicosFeitos`),
    FOREIGN KEY (`fkServico`)
    REFERENCES `barbearia`.`Servico` (`idServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`fkVenda`)
    REFERENCES `barbearia`.`Venda` (`idVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `barbearia`.`Agenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `barbearia`.`Agenda` (
  `idAgenda` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `fkCliente` INT NOT NULL,
  `fkFuncionario` INT NOT NULL,
  `fkServico` INT NOT NULL,
  PRIMARY KEY (`idAgenda`),
    FOREIGN KEY (`fkCliente`)
    REFERENCES `barbearia`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`fkFuncionario`)
    REFERENCES `barbearia`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`fkServico`)
    REFERENCES `barbearia`.`Servico` (`idServico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


