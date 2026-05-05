create database usuarios_db;
use usuarios_db;

CREATE TABLE IF NOT EXISTS usuario (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(10) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `username` VARCHAR(50) NULL,
  `password_hash` VARCHAR(255) NULL,
  `rol` ENUM('administrador', 'arrendatario', 'arrendador') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  UNIQUE INDEX `username` (`username` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


DELIMITER $$
CREATE TRIGGER validar_rol_admin
BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN
    IF NEW.rol <> 'administrador' AND 
       (NEW.username IS NOT NULL OR NEW.password_hash IS NOT NULL) THEN
       
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Solo los administradores pueden tener username y password';
        
    END IF;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER validar_datos_admin
BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN

   
    IF NEW.rol = 'administrador' AND 
       (NEW.username IS NULL OR NEW.password_hash IS NULL) THEN
       
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El administrador debe tener username y password';
        
    END IF;

END$$
DELIMITER ;



DELIMITER $$
CREATE TRIGGER validar_rol_admin_updt
BEFORE UPDATE ON usuario
FOR EACH ROW
BEGIN
    IF NEW.rol <> 'administrador' AND 
       (NEW.username IS NOT NULL OR NEW.password_hash IS NOT NULL) THEN
       
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Solo los administradores pueden tener username y password';
        
    END IF;
END$$
DELIMITER ;


DELIMITER $$
CREATE TRIGGER validar_datos_admin_updt
BEFORE UPDATE ON usuario
FOR EACH ROW
BEGIN

   
    IF NEW.rol = 'administrador' AND 
       (NEW.username IS NULL OR NEW.password_hash IS NULL) THEN
       
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El administrador debe tener username y password';
        
    END IF;

END$$
DELIMITER ;

USE usuarios_db;

-- Añadir columnas a la tabla usuario
ALTER TABLE usuario
  ADD COLUMN conjunto_id     INT          NULL    COMMENT 'NULL = superadmin, valor = admin pertenece a este conjunto',
  ADD COLUMN password_changed TINYINT(1)  NOT NULL DEFAULT 1 COMMENT '0 = debe cambiar contraseña en el primer login';