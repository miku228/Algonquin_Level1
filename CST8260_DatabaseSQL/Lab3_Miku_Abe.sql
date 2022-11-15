# Student Name: Miku Abe
# Student Number: 041047851
# Course Section: 302

# Task A - Querying the city table:
# 1. Display everything that is know about the city with the ID of 31.
SELECT *
FROM city
WHERE ID = 31;

# 2. List the names of all cities in Holland (code of NLD).
SELECT Name
FROM city
WHERE CountryCode = 'NLD';

# 3. List the name and the code off all the cities with a population larger than 20000.
# Sort the output by Population in descending order.
SELECT Name
FROM city
WHERE Population > 20000
ORDER BY Population DESC;

# Task B - Querying the country table:
# 1. List the names, the region, the year of Independence and the population of the countries
# that became independent in 1975 as well as the countries that became independent
# before 1991 (not included) and whose population is less than 22000000.

# this query also gives same answer since 1975 < 1991
# SELECT Name, Region, IndepYear, Population
# FROM country
# WHERE IndepYear < 1991 AND Population < 22000000;

SELECT Name, Region, IndepYear, Population
FROM country
WHERE ( IndepYear = 1975 OR IndepYear < 1991 ) AND Population < 22000000;

# 2. List the names and the IndepYear of all the countries that became independent
# between 1960 and 1980 (both not included). Sort the output by independence year.
SELECT Name, IndepYear
FROM country
WHERE IndepYear > 1960 AND IndepYear < 1980
ORDER BY IndepYear;

# 3. List the names and the continent of all the countries that became independent
# between 1960 and 1980 (both not included). Sort the output by independence year.
SELECT Name, Continent
FROM country
WHERE IndepYear > 1960 AND IndepYear < 1980
ORDER BY IndepYear;

# 4. Using OR, list the names and the continent of all the countries in Europe
# and North America. Sort the output by continent then by name.
SELECT Name, Continent
FROM country
WHERE Continent = 'Europe' OR Continent = 'North America'
ORDER BY Continent, Name;

# 5. Using NOT IN, list the names and the continent of all the countries not in
# Europe nor North America. Sort the output by continent then by name.
SELECT Name, Continent
FROM country
WHERE Continent NOT IN ('Europe', 'North America')
ORDER BY Continent, Name;

# 6. List the names and the continent of all the countries whose continent's name
# contains the string America. Sort the output by continent then by name.
SELECT Name, Continent
FROM country
WHERE Continent LIKE '%America%'
ORDER BY Continent, Name;

# 7. Using LIKE, list the names and the continent of all the countries whose name
# contains exactly 5 characters. Sort the output by continent then by name. (hint: _)
SELECT Name, Continent
FROM country
WHERE Name LIKE '_____'
ORDER BY Continent, Name;


# 8. Using LIKE, list the names and the continent of all the countries whose name
# contains exactly 5 characters and whose third character in the name is a y.
# Sort the output by continent then by name. (hint: _)
SELECT Name, Continent
FROM country
WHERE Name LIKE '__y__'
ORDER BY Continent, Name;

# 9. List the names, the continent and the IndepYear of all the countries whose
# IndepYear field is not defined. Sort the output by continent then by name.
SELECT Name, Continent, IndepYear
FROM country
WHERE IndepYear IS NULL
ORDER BY Continent, Name;

# 10. List the names, the continent and the IndepYear of all the countries whose
# IndepYear field is defined. Sort the output by continent then by name.
SELECT Name, Continent, IndepYear
FROM country
WHERE IndepYear IS NOT NULL
ORDER BY Continent, Name;

# 11. Using LIMIT, extract the first 5 records of the previous query (question 10).
SELECT Name, Continent, IndepYear
FROM country
WHERE IndepYear IS NOT NULL
ORDER BY Continent, Name
LIMIT 5;
