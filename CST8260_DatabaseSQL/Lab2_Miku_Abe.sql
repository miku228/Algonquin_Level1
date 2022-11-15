# Student Name: Miku Abe
# Student Number: 041047851
# Course Section: 302

# 1 - List all databases:
SHOW DATATABLES;

# 2 - Connect to a specific database (world):
USE world;

# 3 - List all tables inside the database:
SHOW TABLES;

# 4 - Check the structure of the city table:
DESCRIBE city;

# 5 - Create a new database named lab2:
CREATE DATABASE lab2;

# 6 - Connect to lab2:
USE lab2;

# 7 - create a table named students containing the following columns:
# first_name (30 characters)
# last_name (50 characters)
# student_number (number)
# section (number)
CREATE TABLE students (
    first_name char(30),
    last_name char(50),
    student_number int,
    section int
);

# 8 - insert a record with your own information (first_name, last_name, student_number and section):
INSERT INTO students (first_name, last_name, student_number, section)
VALUES('Miku','Abe',041047851,302);

# 9 - Display everything in students (all columns and rows):
SELECT * FROM students;

# 10 - Delete the table students, deleting all its data:
DROP TABLE students;

# 11 - Delete database lab2 deleting all tables and data:
DROP DATABASE lab2;
