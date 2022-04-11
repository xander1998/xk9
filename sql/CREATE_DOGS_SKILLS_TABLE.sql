CREATE TABLE IF NOT EXISTS `dogs_skills` (
  `key` VARCHAR(30) NOT NULL UNIQUE,
  PRIMARY KEY (`key`)
);

INSERT INTO `dogs_skills` (`key`) VALUES
  ('paraphernalia'),
  ('attack'),
  ('tracking');