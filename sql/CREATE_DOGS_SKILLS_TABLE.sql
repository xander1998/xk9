CREATE TABLE IF NOT EXISTS `dogs_skills` (
  `key` VARCHAR(12) NOT NULL UNIQUE,
  `type` VARCHAR(24) NOT NULL,
  PRIMARY KEY (`key`)
);

INSERT INTO `dogs_skills` (`key`, `type`) VALUES
  ('cocaine', 'drug'),
  ('weed', 'drug'),
  ('opium', 'drug'),
  ('pills', 'drugs'),
  ('meth', 'drugs'),
  ('attack', 'combat'),
  ('intimidation', 'combat')