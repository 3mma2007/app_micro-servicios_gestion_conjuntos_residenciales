create database propiedades_db;
use propiedades_db;

-- -----------------------------------------------------
-- Table `mydb`.`conjunto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS conjunto (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre_conjunto` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS torre (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `num_pisos` INT NOT NULL,
  `conjunto_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_torre_conjunto1_idx` (`conjunto_id` ASC) VISIBLE,
  CONSTRAINT `fk_torre_conjunto1`
    FOREIGN KEY (`conjunto_id`)
    REFERENCES conjunto (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `residencias_propiedades`.`apartamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS apartamento (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(20) NOT NULL,
  `piso` INT NOT NULL,
  `torre_id` INT NOT NULL,
  `estado` ENUM('disponible', 'ocupado') NULL DEFAULT 'disponible',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uq_apto_torre` (`numero` ASC, `torre_id` ASC) VISIBLE,
  INDEX `fk_apto_torre` (`torre_id` ASC) VISIBLE,
  CONSTRAINT `fk_apto_torre`
    FOREIGN KEY (`torre_id`)
    REFERENCES torre (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `residencias_propiedades`.`parqueadero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS parqueadero (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(20) NOT NULL,
  `tipo` ENUM('privado', 'publico') NOT NULL,
  `apartamento_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `numero` (`numero` ASC) VISIBLE,
  INDEX `fk_parq_apto` (`apartamento_id` ASC) VISIBLE,
  CONSTRAINT `fk_parq_apto`
    FOREIGN KEY (`apartamento_id`)
    REFERENCES apartamento (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

show tables;
select * from conjunto;
select * from torre;

-- ------------------------------------------------------------------- TRIGGERS


-- 2) si el tipo de parqueadero es 'publico', no permitir id_apto (FK) diferente de NULL
DELIMITER $$
CREATE TRIGGER trg_parq_publico_no_id_apto
BEFORE INSERT ON parqueadero
FOR EACH ROW
BEGIN
    IF NEW.tipo = 'publico' AND NEW.apartamento_id IS NOT NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Parqueadero público no puede tener apartamento asociado';
    END IF;
END$$
delimiter ;


DELIMITER $$
CREATE TRIGGER trg_parq_publico_no_id_apto_up
BEFORE UPDATE ON parqueadero
FOR EACH ROW
BEGIN
    IF NEW.tipo = 'publico' AND NEW.apartamento_id IS NOT NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Parqueadero público no puede tener apartamento asociado';
    END IF;
END$$
delimiter ; 

-- 3) número de pisos en torre y apartamento no negativos
delimiter $$
CREATE TRIGGER trg_torre_apto_pisos_no_negativo
BEFORE INSERT ON torre
FOR EACH ROW
BEGIN
    IF NEW.num_pisos < 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Número de pisos de torre no puede ser negativo';
    END IF;
END$$
delimiter ;

delimiter $$
CREATE TRIGGER trg_torre_pisos_no_neg_up
BEFORE UPDATE ON torre
FOR EACH ROW
BEGIN
    IF NEW.num_pisos < 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Número de pisos de torre no puede ser negativo';
    END IF;
END$$
delimiter ;


DELIMITER $$
CREATE TRIGGER trg_apto_piso_rango
BEFORE INSERT ON apartamento
FOR EACH ROW
BEGIN
    DECLARE v_pisos_torre INT;

    SELECT num_pisos
    INTO v_pisos_torre
    FROM torre
    WHERE id = NEW.torre_id;

    IF v_pisos_torre IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La torre no existe';
    END IF;

    IF NEW.piso < 1 OR NEW.piso > v_pisos_torre THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El piso del apartamento debe estar dentro del rango de pisos de la torre';
    END IF;

END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER trg_apto_piso_rango_up
BEFORE UPDATE ON apartamento
FOR EACH ROW
BEGIN
    DECLARE v_pisos_torre INT;

    SELECT num_pisos
    INTO v_pisos_torre
    FROM torre
    WHERE id = NEW.torre_id;

    IF v_pisos_torre IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La torre no existe';
    END IF;

    IF NEW.piso < 1 OR NEW.piso > v_pisos_torre THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El piso del apartamento debe estar dentro del rango de pisos de la torre';
    END IF;

END$$
DELIMITER ;
