/*
Student Name: Miku Abe
Student Number: 041047851
Course Section: 302
*/

USE world;
# ---------------------------------------------
# Task A - Creating and populating the tables
# ---------------------------------------------
# 1. Create the database megacorp
CREATE DATABASE megacorp;
DESCRIBE department;
SHOW TABLES;
USE megacorp;

# ----- Create the table employee  -------
# make employee table
DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
    Emplld INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    EmplFname CHAR(25),
    EmplLname CHAR(25),
    EmplOffice CHAR(5) NOT NULL,
    EmplPhone CHAR(25),
    EmplDept INT
);

DESCRIBE  employee;

# ----- Create the table department  -------
# make department table
DROP TABLE IF EXISTS department;
CREATE TABLE department (
    DeptId INT NOT NULL PRIMARY KEY,
    DeptName CHAR(25) NOT NULL,
    DeptOffice CHAR(5) NOT NULL,
    DeptPhone CHAR(25),
    DeptSupervisor INT,
    FOREIGN KEY(DeptSupervisor)
                 REFERENCES employee(Emplld)
) CHARSET = utf8;

DESCRIBE department;

# ----- Create the table employee  -------
# modify EmplDept column in employee table as a foreign key
# references DeptId in department table
ALTER TABLE employee
ADD FOREIGN KEY (EmplDept)
REFERENCES department(DeptId);

SELECT * FROM employee;

# ----- Create the table employee  -------
# insert 10 records to employee table without foreign colum
INSERT INTO employee(EmplFname, EmplLname, EmplOffice, EmplPhone)
VALUES ('Jack', 'Simpson', 'B728', '(614)727-4411'),
       ('Jim', 'McDonald', 'B728', '(614)727-4412'),
       ('William', 'Frane', 'B791', '(614)727-4455'),
       ('Linda', 'Zeller', 'B735', '(614)727-4423'),
       ('Stefanie', 'Lambeth', 'B755', '(977)522-3345'),
       ('Janene', 'Wolfinger', 'B791', '(910) 433-6056'),
       ('Tom', 'Broaden', 'B735', '(940) 833-6425'),
       ('Sheilah', 'Amezcua', 'A728', '(989) 718-6125'),
       ('Luna', 'Hammock', 'B755', '(706) 770-1134'),
       ('Thea', 'Armer', 'B755', '(346) 835-9817');

# ----- Create the table department  -------
# insert 5 records to the department table
INSERT INTO department(DeptId, DeptName, DeptOffice, DeptPhone, DeptSupervisor)
VALUES (1, 'Accounting', 'B790', '(614)727-4401', (SELECT Emplld FROM employee WHERE EmplFname = 'Jim' AND EmplLname = 'McDonald')),
       (2, 'Research', 'B720', '(614)727-4402', (SELECT Emplld FROM employee WHERE EmplFname = 'William' AND EmplLname = 'Frane')),
       (3, 'IT', 'B730', '(614)727-4403', (SELECT Emplld FROM employee WHERE EmplFname = 'Linda' AND EmplLname = 'Zeller')),
       (4, 'Sales', 'B750', '(977)522-3301', (SELECT Emplld FROM employee WHERE EmplFname = 'Stefanie' AND EmplLname = 'Frane')),
       (5, 'Operations', 'A720', '(989)718-6101', (SELECT Emplld FROM employee WHERE EmplFname = 'Sheilah' AND EmplLname = 'Amezcua'));
SELECT * FROM department;

# ----- Create the table employee  -------
# modify EmplDept of 10 datas in employee table
# employee Sheilah's EmplDept is going to be null
UPDATE employee SET EmplDept = 1 WHERE EmplFname IN ('William', 'Janene');
UPDATE employee SET EmplDept = 2 WHERE EmplFname IN ('Jack', 'Jim');
UPDATE employee SET EmplDept = 3 WHERE EmplFname IN ('Linda', 'Tom');
UPDATE employee SET EmplDept = 4 WHERE EmplFname IN ('Stefanie', 'Luna', 'Thea');

SELECT * FROM employee;

# ----- Create the table project  -------
DROP TABLE IF EXISTS project;
CREATE TABLE project (
    ProjectId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ProjectClient CHAR(15) NOT NULL,
    ProjectLead INT,
    ProjectContactPhone CHAR(25),
    FOREIGN KEY(ProjectLead)
                 REFERENCES employee(Emplld)
);

DESCRIBE project;
# add 5 records to project table
INSERT INTO project(ProjectClient, ProjectLead, ProjectContactPhone)
VALUES ('Company A', (SELECT Emplld FROM employee WHERE EmplFname = 'William'), '(614)782-9384'),
       ('Company B', (SELECT Emplld FROM employee WHERE EmplFname = 'Linda'), '(614)590-3284'),
       ('Company C', (SELECT Emplld FROM employee WHERE EmplFname = 'Luna'), '(614)523-3284'),
       ('Company D', (SELECT Emplld FROM employee WHERE EmplFname = 'Jim'), '(614)123-5238'),
       ('Company E', (SELECT Emplld FROM employee WHERE EmplFname = 'Sheilah'), '(614)928-4923');

SELECT * FROM project;

# ---------------------------------
# Task B - Querying the database
# ---------------------------------
#
# 1. Write a query that lists all information known about the employees and the name of their department. Do not display employees not yet assigned to a department.
SELECT e.EmplFname, e.EmplLname, e.EmplOffice, e.EmplPhone, d.DeptOffice
FROM employee e
INNER JOIN department d on e.EmplDept = d.DeptId;


# 2. Write a query that lists all the information known about all employees and the name of their department. Your query must also display new employees (not yet assigned to a department).
SELECT e.EmplFname, e.EmplLname, e.EmplOffice, d.DeptOffice, d.DeptName
FROM employee e
LEFT JOIN department d on e.EmplDept = d.DeptId;

# 3. Write a query that only displays new employees.
SELECT *
FROM employee
WHERE EmplDept IS NULL;

# 4. Write a query that lists all departments (all columns) and the first and last name of the department supervisor of each department.
SELECT d.DeptId, d.DeptName, d.DeptOffice, d.DeptPhone, e.EmplFname DeptSuperviserFname, e.EmplLname DeptSuperviserLname
FROM department d
INNER JOIN employee e on d.DeptSupervisor = e.Emplld;

# 5. Write a query that lists all employees and all the details about their projects. Employees that do not lead any projects should be listed.
SELECT e.EmplFname, e.EmplLname, p.ProjectId, p.ProjectClient, p.ProjectContactPhone
FROM employee e
LEFT JOIN project p on e.Emplld = p.ProjectLead;

# 6. Write a query that lists the first name, last name,
#    department number, department office,
#    department supervisor (first and last name),
#    project client, and project contact phone of all employees.

# to get DeptSupervisor name, left join new select statement which did in Q4
SELECT e.Emplld, e.EmplFname, e.EmplLname, e.EmplDept,
       d.DeptOffice, r1.EmplFname DeptSupervisorFname, r1.EmplLname DeptSupervisorLname,
       p.ProjectClient, p.ProjectContactPhone
FROM employee e
LEFT JOIN department d on e.EmplDept = d.DeptId
    LEFT JOIN
     (SELECT d2.DeptSupervisor, e2.EmplFname, e2.EmplLname
      FROM department d2
               INNER JOIN employee e2 on d2.DeptSupervisor = e2.Emplld
     ) r1
    on e.Emplld = r1.DeptSupervisor
LEFT JOIN project p on e.Emplld = p.ProjectLead
ORDER BY e.Emplld;

# 7. Write a query that displays the number of projects per department. Sort the results by number of projects in descending order.
SELECT e.EmplDept, p.ProjectId, COUNT(e.EmplDept) numberOfProjectPerDept
FROM employee e
INNER JOIN project p on p.ProjectLead = e.Emplld
GROUP BY e.EmplDept
ORDER BY e.EmplDept DESC;
