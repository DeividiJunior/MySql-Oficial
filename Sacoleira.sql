

CREATE SCHEMA IF NOT EXISTS `Sacoleira` DEFAULT CHARACTER SET utf8 ;
USE `Sacoleira` ;

-- -----------------------------------------------------
-- Table `Sacoleira`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sacoleira`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `logradouro` VARCHAR(45) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `uf` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(45) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  PRIMARY KEY (`idEndereco`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sacoleira`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sacoleira`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `fkEndereco` INT NOT NULL AUTO_INCREMENT,
  `numeroCasa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
    FOREIGN KEY (`fkEndereco`)
    REFERENCES `Sacoleira`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sacoleira`.`Telefone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sacoleira`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `ddd` DECIMAL(2) NOT NULL,
  `numeroTelefone` DECIMAL(9) NOT NULL,
  `fkCliente` INT NOT NULL,
  PRIMARY KEY (`idTelefone`),
    FOREIGN KEY (`fkCliente`)
    REFERENCES `Sacoleira`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Sacoleira`.`Empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sacoleira`.`Empresa` (
  `idEmpresa` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sacoleira`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sacoleira`.`Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `tamanho` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `valor` VARCHAR(45) NOT NULL,
  `fkEmpresa` INT NOT NULL,
  PRIMARY KEY (`idProduto`),
    FOREIGN KEY (`fkEmpresa`)
    REFERENCES `Sacoleira`.`Empresa` (`idEmpresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Sacoleira`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sacoleira`.`Venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `data` VARCHAR(45) NOT NULL,
  `dataPagamento` VARCHAR(45) NOT NULL,
  `valorTotal` VARCHAR(45) NOT NULL,
  `fkCliente` INT NOT NULL,
  PRIMARY KEY (`idVenda`),
    FOREIGN KEY (`fkCliente`)
    REFERENCES `Sacoleira`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Sacoleira`.`ItensVendidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sacoleira`.`ItensVendidos` (
  `idItensVendidos` INT NOT NULL AUTO_INCREMENT,
  `quantidade` VARCHAR(45) NOT NULL,
  `valor` VARCHAR(45) NOT NULL,
  `fkProduto` INT NOT NULL,
  `fkVenda` INT NOT NULL,
  `check` CHAR(3) NULL,
  PRIMARY KEY (`idItensVendidos`),
    FOREIGN KEY (`fkProduto`)
    REFERENCES `Sacoleira`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`fkVenda`)
    REFERENCES `Sacoleira`.`Venda` (`idVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sacoleira`.`Troca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sacoleira`.`Troca` (
  `idTroca` INT NOT NULL AUTO_INCREMENT,
  `fkVenda` INT NOT NULL,
  `fkItensVendidos` INT NOT NULL,
  `data` DATETIME NOT NULL,
  `check` CHAR(3) NOT NULL,
  PRIMARY KEY (`idTroca`),
    FOREIGN KEY (`fkVenda`)
    REFERENCES `Sacoleira`.`Venda` (`idVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    FOREIGN KEY (`fkItensVendidos`)
    REFERENCES `Sacoleira`.`ItensVendidos` (`idItensVendidos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


