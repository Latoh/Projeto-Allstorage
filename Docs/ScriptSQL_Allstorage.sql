-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema allstorage
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `allstorage` ;

-- -----------------------------------------------------
-- Schema allstorage
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `allstorage` DEFAULT CHARACTER SET utf8 ;
USE `allstorage` ;

-- -----------------------------------------------------
-- Table `allstorage`.`categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allstorage`.`categoria` ;

CREATE TABLE IF NOT EXISTS `allstorage`.`categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador da categoria',
  `nome_categoria` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Nome da categoria',
  `fl_estoque` TINYINT(1) NULL COMMENT 'True: Tem controle de estoque\nFalse: Não tem controle de estoque',
  `classe` VARCHAR(1) NULL COMMENT 'Indica a classe da categoria\nP: Produto. Palpável\nS: Serviço. Trabalho. Não terá controle de estoque. Neste caso fl_estoque sempre será Falso.\nAtributos de produto com classe S não terão valor no cadastro (produto_atributo). Serão solicitados no item da venda.',
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cada linha contém a definição de uma categoria de produto.';


-- -----------------------------------------------------
-- Table `allstorage`.`tipo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allstorage`.`tipo` ;

CREATE TABLE IF NOT EXISTS `allstorage`.`tipo` (
  `id_tipo` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do tipo de produto',
  `nome_tipo` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Nome do tipo do produto',
  `id_categoria` INT NULL DEFAULT NULL COMMENT 'Categoria a que o tipo pertence',
  PRIMARY KEY (`id_tipo`),
  INDEX `id_categoria` (`id_categoria` ASC),
  CONSTRAINT `tipo_ibfk_1`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `allstorage_dev`.`categoria` (`id_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cada linha contém a definição de um tipo de produto. Cada tipo pertence a uma categoria. A categoria pode possuir vários tipos.';


-- -----------------------------------------------------
-- Table `allstorage`.`atributo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allstorage`.`atributo` ;

CREATE TABLE IF NOT EXISTS `allstorage`.`atributo` (
  `id_atributo` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do atribuito',
  `nome_atributo` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Nome do atributo',
  `id_tipo` INT(10) NULL DEFAULT NULL COMMENT 'Identificador do tipo de produto que o atributo está associado',
  `tipo_dado` CHAR(1) NULL COMMENT 'Tipo de dado que um atribuito irá armazenar. Dominio: D-Data;C-Caracteres;N-Numero',
  `tam_dado` DECIMAL(4,1) NULL COMMENT 'Tamanho do valor do atributo',
  `st_atributo` CHAR(1) NULL COMMENT 'Status do atributo:\nA-Ativo; I-Inativo',
  `fl_obrig` TINYINT(1) NULL COMMENT 'Flag que indica obrigatoriedade do valor do atributo para o produto no momento do seu cadastro/atualização\n0-Não; 1-Obrigatório',
  PRIMARY KEY (`id_atributo`),
  INDEX `id_tipo` (`id_tipo` ASC),
  CONSTRAINT `atributo_ibfk_1`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `allstorage`.`tipo` (`id_tipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cada linha contém a definição de um atributo para um tipo de produto. Um atributo é uma informação adicional de um tipo. Cada tipo poderá possuir atributos específicos. Cada poduto cadastrado pode ter seu próprio valor para o atributo.';


-- -----------------------------------------------------
-- Table `allstorage`.`pessoa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allstorage`.`pessoa` ;

CREATE TABLE IF NOT EXISTS `allstorage`.`pessoa` (
  `id_pessoa` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador da pessoa',
  `prim_nome` VARCHAR(60) NOT NULL COMMENT 'Se for PF: Primeiro nome da pessoa\nSe for PJ: Nome de fantasia',
  `sobrenome` VARCHAR(60) NULL DEFAULT NULL COMMENT 'Se for PF: Sobrenome da pessoa\nSe for PJ: Razão social',
  `cod_documento` VARCHAR(20) NULL DEFAULT NULL COMMENT 'Documento da pessoa.\nSe for PF: CPF\nSe for PJ: CNPJ',
  `st_pessoa` CHAR(1) NOT NULL DEFAULT 'A' COMMENT 'Status da Pessoa.\nA-Ativa\nI-Inativa. Não poderá se relacionar a novas vendas.',
  PRIMARY KEY (`id_pessoa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cada linha contém dados cadastrais de uma pessoa.';


-- -----------------------------------------------------
-- Table `allstorage`.`contato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allstorage`.`contato` ;

CREATE TABLE IF NOT EXISTS `allstorage`.`contato` (
  `id_contato` INT NOT NULL,
  `id_pessoa` INT NOT NULL,
  `tipo_contato` CHAR(1) NOT NULL COMMENT 'Tipo de contato:R-Residencial; C-Comercial; M-Movel; E-Recado',
  `ddd` VARCHAR(3) NULL DEFAULT NULL,
  `contato` VARCHAR(15) NULL DEFAULT NULL,
  INDEX `fk_contato_pessoa1_idx` (`id_pessoa` ASC),
  PRIMARY KEY (`id_contato`),
  CONSTRAINT `fk_contato_pessoa1`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `allstorage`.`pessoa` (`id_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `allstorage`.`endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allstorage`.`endereco` ;

CREATE TABLE IF NOT EXISTS `allstorage`.`endereco` (
  `id_endereco` INT NOT NULL,
  `id_pessoa` INT NOT NULL,
  `tipo_endereco` CHAR(1) NOT NULL COMMENT 'Tipo do endereço da pessoa:\nP-Principal; R-Residencial; C-Comercial; O-Outros; B-Cobrança; E-Email',
  `cep` VARCHAR(20) NULL DEFAULT NULL,
  `nome_rua` VARCHAR(90) NULL DEFAULT NULL COMMENT 'Caso tipo_endereço = \"E\", armazenar endereço de e-mail',
  `bairro` VARCHAR(60) NULL DEFAULT NULL,
  `cidade` VARCHAR(60) NULL DEFAULT NULL,
  `pais` VARCHAR(50) NULL DEFAULT NULL,
  `estado` VARCHAR(50) NULL DEFAULT NULL,
  `numero` INT(6) NULL DEFAULT NULL,
  `complemento` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_endereco`),
  INDEX `fk_endereco_pessoa1_idx` (`id_pessoa` ASC),
  CONSTRAINT `fk_endereco_pessoa1`
    FOREIGN KEY (`id_pessoa`)
    REFERENCES `allstorage`.`pessoa` (`id_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `allstorage`.`fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allstorage`.`fornecedor` ;

CREATE TABLE IF NOT EXISTS `allstorage`.`fornecedor` (
  `id_fornecedor` INT NOT NULL,
  PRIMARY KEY (`id_fornecedor`),
  INDEX `fk_fornecedor_pessoa1_idx` (`id_fornecedor` ASC),
  CONSTRAINT `fk_fornecedor_pessoa1`
    FOREIGN KEY (`id_fornecedor`)
    REFERENCES `allstorage`.`pessoa` (`id_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `allstorage`.`produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allstorage`.`produto` ;

CREATE TABLE IF NOT EXISTS `allstorage`.`produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador do produto',
  `nome_produto` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Nome / descrição do produto',
  `dt_cadastro` DATE NULL DEFAULT NULL COMMENT 'Data de cadastro do produto no banco de dados.',
  `preco_venda` DECIMAL(10,2) NULL DEFAULT NULL COMMENT 'Preço de venda atual do produto',
  `cod_prod` VARCHAR(20) NULL DEFAULT NULL COMMENT 'Código do produto definido pelo usuário',
  `imagem` VARCHAR(244) NULL DEFAULT NULL COMMENT 'Endereço do link da imagem do produto',
  `id_tipo` INT NULL DEFAULT NULL COMMENT 'Identificador do tipo a que o produto está associado',
  `st_produto` CHAR(1) NULL COMMENT 'Status do produto\nA-Ativo; I-Inativo (Não mais comercializado); S-Suspenso (Temporariamente não comercializado)',
  PRIMARY KEY (`id_produto`),
  INDEX `produto_ibfk_2_idx` (`id_tipo` ASC),
  CONSTRAINT `produto_ibfk_2`
    FOREIGN KEY (`id_tipo`)
    REFERENCES `allstorage`.`tipo` (`id_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Cada linha contém o cadastro de um produto.';


-- -----------------------------------------------------
-- Table `allstorage`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allstorage`.`usuario` ;

CREATE TABLE IF NOT EXISTS `allstorage`.`usuario` (
  `id_usuario` INT(10) NOT NULL AUTO_INCREMENT,
  `senha` CHAR(32) NULL DEFAULT NULL,
  `login` VARCHAR(60) NULL DEFAULT NULL,
  `status` INT(10) NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `allstorage`.`produto_atributo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allstorage`.`produto_atributo` ;

CREATE TABLE IF NOT EXISTS `allstorage`.`produto_atributo` (
  `id_produto` INT(10) NOT NULL,
  `id_atributo` INT(10) NOT NULL,
  `vlr_atributo` VARCHAR(300) NULL COMMENT 'Valor do atributo de um produto',
  PRIMARY KEY (`id_produto`, `id_atributo`),
  INDEX `fk_produto_atrubuto_atributo1_idx` (`id_atributo` ASC),
  CONSTRAINT `fk_produto_atrubuto_produto1`
    FOREIGN KEY (`id_produto`)
    REFERENCES `allstorage`.`produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_atrubuto_atributo1`
    FOREIGN KEY (`id_atributo`)
    REFERENCES `allstorage`.`atributo` (`id_atributo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Cada linha contém o valor de um atributo para um produto. Utilizado apenas quando a classe da categoria do tipo do produto for P (Produto). Se for S, não deve preencher esta tabela, pois os valores dos atributos  estarão na tabela venda_item_atributo';


-- -----------------------------------------------------
-- Table `allstorage`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allstorage`.`cliente` ;

CREATE TABLE IF NOT EXISTS `allstorage`.`cliente` (
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_cliente`),
  CONSTRAINT `fk_cliente_pessoa1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `allstorage`.`pessoa` (`id_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `allstorage`.`estoque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allstorage`.`estoque` ;

CREATE TABLE IF NOT EXISTS `allstorage`.`estoque` (
  `id_produto` INT NOT NULL COMMENT 'Identificador do produto que se deseja controlar o estoque',
  `dt_inicio` DATE NOT NULL COMMENT 'Data de inicio do período de controle do estoque',
  `dt_fim` DATE NULL COMMENT 'Data de término do período de controle do estoque',
  `qtd_anterior` DECIMAL(7,3) NULL DEFAULT 0 COMMENT 'Quantidade final do período anterior Caso seja o primeiro período de controle do produto a quantidade deve ser iniciado com 0',
  `qtd_entrada` DECIMAL(7,3) NULL DEFAULT 0 COMMENT 'Somatorio de todas as entradas em estoque do referido período de controle.',
  `qtd_saida` DECIMAL(7,3) NULL DEFAULT 0 COMMENT 'Somatorio de todas as saídas de estoque do referido período de controle.',
  `qtd_final` DECIMAL(7,3) NULL COMMENT 'Quantidade final do referido período. Caso o período não tenha sido finalizado, irá representar a quantidade atual em estoque',
  PRIMARY KEY (`id_produto`, `dt_inicio`),
  CONSTRAINT `fk_estoque_produto1`
    FOREIGN KEY (`id_produto`)
    REFERENCES `allstorage`.`produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Cada linha contém o controle do estoque de um produto para um determinado peróido. Somente um período deverá ser o atual. Neste caso, o campo dt_fim ficará sem valor. Ao concluir um período, o campo dt_fim deverá ser preenchido e um novo registro para o produto deverá ser criado (desde que o produto não esteja inativo)';


-- -----------------------------------------------------
-- Table `allstorage`.`venda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allstorage`.`venda` ;

CREATE TABLE IF NOT EXISTS `allstorage`.`venda` (
  `id_venda` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador da venda',
  `dt_venda` DATETIME NOT NULL COMMENT 'Data de início da venda',
  `id_cliente` INT NOT NULL COMMENT 'Identificador do cliente',
  `st_venda` CHAR(1) NULL COMMENT 'Status da venda\nA-Aberta; Recém criada e aberta para edição de itens.\nR-Reservada. Quantidade de cada item já foi verificada para atendimento do pedido. Para reservar um pedido, deverá ser calculada a disponibilidade: qtd_final - somatoria de vendas com status Reservada do produto)\nC-Cancelada. Venda não concluída sem possibilidade de edição.\nF-Finalizada. Quantidades em estoque foram baixadas para os itens da venda. Se status do pedido for de A para F, a validação de reserva deverá ser feita.\nE-Entregue. Já finalizada e todos os itens da venda foram entregues ao cliente',
  `dt_status` DATETIME NULL COMMENT 'Data da atualização do status da venda.',
  `vlr_total` DECIMAL(10,2) NULL COMMENT 'Valor total da venda.',
  `dt_prevista` DATE NULL COMMENT 'Data prevista para a conclusão da venda e entrega dos itens',
  INDEX `fk_venda_cliente1_idx` (`id_cliente` ASC),
  PRIMARY KEY (`id_venda`),
  CONSTRAINT `fk_venda_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `allstorage`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Cada linha contém uma venda. Cada venda poderá ter vários itens. Cada venda está relacionada com um cliente.\n';


-- -----------------------------------------------------
-- Table `allstorage`.`venda_item`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allstorage`.`venda_item` ;

CREATE TABLE IF NOT EXISTS `allstorage`.`venda_item` (
  `id_item` INT NOT NULL COMMENT 'Identificador do item da venda',
  `id_venda` INT NOT NULL COMMENT 'Identificador da venda relacionada ao item',
  `id_produto` INT NOT NULL COMMENT 'Identificador do produto',
  `qtd_venda` DECIMAL(7,3) NULL COMMENT 'Quantidade vendida do produto',
  `preco_unit` DECIMAL(8,4) NULL COMMENT 'Preço da unitario do item da venda. Este preço tem o valor default da tabela do produto, porém o usuário poderá altera-lo no momento da venda de forma particular no item',
  `st_item` CHAR(1) NULL COMMENT 'Status do item da venda.\nN-Normal. Seguirá o status da venda.\nC-Cancelado. Item cancelado. Nenhuma reserva de estoque será feita. Somente poderá cancelar um item caso a venda não tenha sido finalizada.\nE-Entregue. Já finalizada e o item foi entregue ao cliente\n',
  `obs_item` VARCHAR(200) NULL COMMENT 'Observações específicas para o item',
  `dt_status` DATETIME NULL COMMENT 'Data da atualização do status do item da venda',
  INDEX `fk_venda_item_produto1_idx` (`id_produto` ASC),
  PRIMARY KEY (`id_item`),
  CONSTRAINT `fk_venda_item_venda1`
    FOREIGN KEY (`id_venda`)
    REFERENCES `allstorage`.`venda` (`id_venda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_item_produto1`
    FOREIGN KEY (`id_produto`)
    REFERENCES `allstorage`.`produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Cada linha contém um item da venda relacionado a um produto..\n';


-- -----------------------------------------------------
-- Table `allstorage`.`produto_fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allstorage`.`produto_fornecedor` ;

CREATE TABLE IF NOT EXISTS `allstorage`.`produto_fornecedor` (
  `id_produto` INT NOT NULL,
  `id_fornecedor` INT NOT NULL,
  PRIMARY KEY (`id_produto`, `id_fornecedor`),
  INDEX `fk_fornecedor_has_produto_produto1_idx` (`id_produto` ASC),
  INDEX `fk_fornecedor_has_produto_fornecedor1_idx` (`id_fornecedor` ASC),
  CONSTRAINT `fk_fornecedor_has_produto_fornecedor1`
    FOREIGN KEY (`id_fornecedor`)
    REFERENCES `allstorage`.`fornecedor` (`id_fornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fornecedor_has_produto_produto1`
    FOREIGN KEY (`id_produto`)
    REFERENCES `allstorage`.`produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `allstorage`.`venda_item_atributo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `allstorage`.`venda_item_atributo` ;

CREATE TABLE IF NOT EXISTS `allstorage`.`venda_item_atributo` (
  `id_item` INT NOT NULL,
  `id_atributo` INT NOT NULL,
  `vlr_atributo` VARCHAR(300) NULL COMMENT 'Valor do atributo de um item de venda',
  PRIMARY KEY (`id_item`, `id_atributo`),
  INDEX `fk_venda_item_has_atributo_atributo1_idx` (`id_atributo` ASC),
  INDEX `fk_venda_item_has_atributo_venda_item1_idx` (`id_item` ASC),
  CONSTRAINT `fk_venda_item_has_atributo_venda_item1`
    FOREIGN KEY (`id_item`)
    REFERENCES `allstorage`.`venda_item` (`id_item`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_item_has_atributo_atributo1`
    FOREIGN KEY (`id_atributo`)
    REFERENCES `allstorage`.`atributo` (`id_atributo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Cada linha contém o valor de um atributo para um item de venda. Utilizado apenas quando a classe da categoria do tipo do produto for S(Serviço). Se for P, não deve preencher esta tabela, pois os valores dos atributos  estarão na tabela produto_atributo';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
