# Student Name: Miku Abe
# Student Number: 041047851
# Course Section: 302
USE world;
DESCRIBE world.city;
# 1. Create a report that displays the Code of a country along with the
# number of cities of that country. (GROUP BY, COUNT)
SELECT CountryCode, COUNT(*) AS cities
FROM city
GROUP BY CountryCode;

# 2. Restrict the previous query to the countries with more than 200 cities. (GROUP BY, HAVING)
SELECT CountryCode, COUNT(*) AS cities
FROM city
GROUP BY CountryCode
HAVING COUNT(*) > 200;

# 3. Run the next query and explain what happens:
  SELECT countrycode,COUNT(*)
  FROM city
  GROUP BY countrycode
  WHERE COUNT(*) > 200;

# it gives me syntax error because WHERE clause cannot use after GROUP BY clause, it should use HAVING clause


# 4. Create a report that displays the Code of a country along with the number of cities of
# that country and the total population of these cities. (GROUP BY, COUNT,SUM)
SELECT CountryCode, COUNT(*) AS cities, SUM(Population)
FROM city
GROUP BY CountryCode;

# 5. Create a report that displays the district, the code of a country along with the
# number of cities of that district. (GROUP BY on two fields, COUNT)
SELECT District, CountryCode, COUNT(*) AS cities
FROM city
GROUP BY District, CountryCode;

# 6. Create a report that displays the the code of a country along with the
# number of cities of that country, the total population of these cities
# and the average population (GROUP BY, COUNT, SUM, AVG)
SELECT CountryCode, COUNT(*) AS cities, SUM(Population), AVG(Population)
FROM city
GROUP BY CountryCode;


# 7. Create a report that displays the district, the code of a country along with the
# number of cities of that district, the total population of these cities and the average population.
# Select only the district starting with 'a' (GROUP BY on two fields, COUNT, SUM, AVG, HAVING)
SELECT CountryCode, District, COUNT(*) AS cities, SUM(Population), AVG(Population)
FROM city
GROUP BY CountryCode, District
HAVING District LIKE 'a%';


# 8. Restrict the previous query to the districts with more than 10 cities. (HAVING, AND)
SELECT District, CountryCode, COUNT(*) AS cities, SUM(Population), AVG(Population)
FROM city
GROUP BY District, CountryCode
HAVING District LIKE 'a%'
AND cities > 10;

# 9. Create a report that displays the number of cities in the table,
# the total population, the average population, the minimal population value
#  and the maximal population value. (COUNT, SUM, AVG, MIN, MAX)
SELECT COUNT(*) AS cities, SUM(Population) AS TotalPopulation,
       AVG(Population) AS AveragePopulation, MIN(Population) AS MinimalPopulation,
       MAX(Population) AS MaximalPopulation
FROM city;