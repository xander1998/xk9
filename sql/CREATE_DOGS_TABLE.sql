CREATE TABLE IF NOT EXISTS `dogs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `player` VARCHAR(36) NOT NULL,
  `name` VARCHAR(24) NOT NULL,
  `level` INT NOT NULL DEFAULT 0,
  `last_used` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);