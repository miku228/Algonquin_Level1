# Student Name: Miku Abe
# Student Number: 041047851
# Course Section: 302

USE world;
SHOW TABLES;
# DESCRIBE country;

#Task A - World Database
# 1. (country) Create a report that display continents, their total population,
# average population, total surface area and population density (number of people
# divided by land area). Give population density an alias (e.g. population_density)
# and sort the results by population density in descending order.
SELECT Continent, SUM(Population), AVG(Population), SUM(SurfaceArea),  SUM(Population)/SUM(SurfaceArea) AS population_density
FROM country
GROUP BY Continent
ORDER BY population_density DESC;

# DESCRIBE countrylanguage;
# SELECT *
# FROM countrylanguage;
# 2. (countrylanguage) List the codes and number of official languages of countries with
# more than 2 official languages. Sort them by number of languages (from highest to lowest)
# and then by CountryCode.
SELECT CountryCode, COUNT(*) num_officialLanguage
FROM countrylanguage
WHERE IsOfficial = 1
GROUP BY CountryCode
HAVING num_officialLanguage >= 2
ORDER BY num_officialLanguage DESC, CountryCode;

# 3. (country) Display the average life expectancy, the average GNP and the max population
# of each continent. Do not consider countries whose independence year is not given.
# Sort the results by average life expectancy in reverse order.
SELECT Continent, AVG(LifeExpectancy), AVG(GNP), MAX(Population)
FROM country
WHERE IndepYear IS NOT NULL
GROUP BY Continent
ORDER BY AVG(LifeExpectancy) DESC;

# 4. (city) Write a report that lists all country codes, number of cities, total population
# and average population of cities whose district names are 4 characters long and their
# last letter is 'a'. Aggregate the results per country, displaying the results with more
# cities at the top, followed by the country code.
SELECT CountryCode, COUNT(*) AS num_cities, SUM(Population), AVG(Population)
FROM city
WHERE District LIKE '___a'
GROUP BY CountryCode
ORDER BY num_cities DESC, CountryCode;

SELECT CountryCode, Name, District
FROM city
WHERE District LIKE '___a'
AND CountryCode = 'EGY';


# 5. (city) List the top 10 countries with the largest number of cities.
# Display only countries where the number of cities is even.
SELECT CountryCode, COUNT(*) num_cities
FROM city
GROUP BY CountryCode
ORDER BY num_cities DESC
LIMIT 10;

# USE employees;
# SHOW TABLES;
# SELECT *
# FROM titles;
# Task B - Employees Database
# 1. (titles) Display how many employees have the word 'Engineer' on their titles,
# that started on this position after Jan 1st, 1999 and that are still active (to_date is '9999-01-01')
SELECT COUNT(*) num_employees
FROM titles
WHERE title LIKE '%Engineer%'
AND from_date >= '1999-01-01'
AND to_date = '9999-01-01';


# 2. (salaries) Write a query that displays the number of salaries paid,
# the lowest salary, the highest salary and the average of all salaries paid to all employees
SELECT COUNT(*), MIN(salary), MAX(salary), AVG(salary)
FROM salaries;

# 3. (salaries) Create a report that displays the lowest salary and the highest salary paid
# to employees with employee numbers from 10001 to 10005. Display the highest salaries at the top
SELECT emp_no, MIN(salary), MAX(salary)
FROM salaries
WHERE emp_no BETWEEN 10001 AND 10005
GROUP BY emp_no
ORDER BY MAX(salary) DESC;


# 4. (salaries) Display the number of entries per employee, plus the cumulative salary total
# and the average salary per employee. Filter the result so that only employees whose average
# salary is between 64500 and 64750. Order the records from highest to lowest
# cumulative total.
SELECT emp_no, SUM(salary), AVG(salary)
FROM salaries
GROUP BY emp_no
HAVING AVG(salary) BETWEEN 64500 AND 64750
ORDER BY SUM(salary) DESC;


# 5. (dept_emp) Write a query that displays the dates when 10 or more employees were hired
# by department. Filter the results so that only active employees are considered.
# Sort the results by number of employees and department number.
SELECT dept_no, from_date, COUNT(*) num_hiredEmployees
FROM dept_emp
WHERE to_date = '9999-01-01'
GROUP BY dept_no, from_date
HAVING num_hiredEmployees >= 10
ORDER BY num_hiredEmployees, dept_no;