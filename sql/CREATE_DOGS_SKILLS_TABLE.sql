CREATE TABLE IF NOT EXISTS `dogs_skills` (
  `key` VARCHAR(12) NOT NULL UNIQUE,
  `type` VARCHAR(24) NOT NULL,
  PRIMARY KEY (`key`)
);

INSERT INTO `dogs_skills` (`key`, `type`) VALUES ('cocaine', 'drug');
INSERT INTO `dogs_skills` (`key`, `type`) VALUES ('weed', 'drug');
INSERT INTO `dogs_skills` (`key`, `type`) VALUES ('opium', 'drug');
INSERT INTO `dogs_skills` (`key`, `type`) VALUES ('pills', 'drugs');
INSERT INTO `dogs_skills` (`key`, `type`) VALUES ('meth', 'drugs');
INSERT INTO `dogs_skills` (`key`, `type`) VALUES ('gunpowder', 'weapon');
INSERT INTO `dogs_skills` (`key`, `type`) VALUES ('attack', 'combat');
INSERT INTO `dogs_skills` (`key`, `type`) VALUES ('intimidation', 'combat');