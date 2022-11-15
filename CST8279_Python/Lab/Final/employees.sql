CREATE TABLE employees(
  `id` INT NOT NULL,
  `Fname` VARCHAR(100) NOT NULL,
  `Lname` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `gross_income` INT NOT NULL,
  `fed_tax` INT,
  `on_tax` INT,
  `cpp` INT,
  `ei` INT,
  `net_income` INT);