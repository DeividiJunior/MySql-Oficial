
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;
-- -----------------------------------------------------
-- Table `mydb`.`TipoCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoCliente` (
  `idTipoCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoCliente`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `fone` DECIMAL(9) NOT NULL,
  `Cliente` VARCHAR(45) NOT NULL,
  `fkTipoCliente` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
    FOREIGN KEY (`fkTipoCliente`)
    REFERENCES `mydb`.`TipoCliente` (`idTipoCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produtos` (
  `idProdutos` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`idProdutos`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Aluno` (
  `idAluno` INT NOT NULL AUTO_INCREMENT,
  `periodo` VARCHAR(45) NOT NULL,
  `curso` VARCHAR(45) NOT NULL,
  `professor` VARCHAR(45) NOT NULL,
  `fkCliente` INT NOT NULL,
  PRIMARY KEY (`idAluno`),
    FOREIGN KEY (`fkCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `data` VARCHAR(45) NOT NULL,
  `valor` VARCHAR(45) NOT NULL,
  `pago` VARCHAR(45) NOT NULL,
  `fkCLiente` INT NOT NULL,
  PRIMARY KEY (`idVenda`),
    FOREIGN KEY (`fkCLiente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`ItensVendidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ItensVendidos` (
  `idItensVendidos` INT NOT NULL AUTO_INCREMENT,
  `quantidade` VARCHAR(45) NOT NULL,
  `valorVenda` VARCHAR(45) NOT NULL,
  `fkProduto` INT NOT NULL,
  `fkVenda` INT NOT NULL,
  PRIMARY KEY (`idItensVendidos`),
    FOREIGN KEY (`fkProduto`)
    REFERENCES `mydb`.`Produtos` (`idProdutos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`fkVenda`)
    REFERENCES `mydb`.`Venda` (`idVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
