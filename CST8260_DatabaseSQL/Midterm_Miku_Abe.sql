/*
Student Name: Miku Abe
Student Number: 041047851
Course Section: 302
*/

# USE world;
# DESCRIBE city;
/* == Using the world database == */
/* 1. Write a query that
- List all names of cities, districts and country codes
- Displays only cities in districts that contain a "-" in its name
- Display only cities with country codes ending in "a"
- Sort results by district and then by name */
SELECT Name, District, CountryCode
FROM city
WHERE District LIKE '%-%'
AND CountryCode LIKE '%a'
ORDER BY District, Name;


/* 2. Using the table countrylanguage, create a report that:
- Calculates the number of countries in which each language is considered an official language (IsOfficial = T)
- Sorts results by the number of countries in descending order
- Displays only the first 9 records */

# DESCRIBE countrylanguage;
SELECT Language, COUNT(*) num_countries
FROM countrylanguage
WHERE IsOfficial = 'T'
GROUP BY Language
ORDER BY num_countries DESC
LIMIT 9;



/* 3. Create the following query:
- Select all available data matching the constraints below
- Select data from all countries except those in Europe and Africa
- Sort the output by continent and then by name */
SELECT *
FROM country
WHERE Continent NOT IN ('Europe', 'Africa')
ORDER BY Continent, Name;


/* 4. Create the following query:
- Select all data for all countries whose independence year field (IndepYear) is not defined
- Only return countries whose names contain the letter 'a'
- Only return countries whose names have at least 5 characters
- Sort the result by the country name
- Return only 20 countries, omitting the first 10 countries in the list */
SELECT *
FROM country
WHERE IndepYear IS NULL
AND Name LIKE '%a%'
AND Name LIKE '_____'
ORDER BY Name
LIMIT 10, 20;


/* 5. Write a query that:
- Lists the name, the head of state, the life expectancy, independence year, the population and the gnp of countries
- Display countries that became independent between 1820 and 1850
- As well as countries whose life expectancy is more than 60 years and are located in Europe
- Sort the results by GNP in descending order and name in ascending order
- Display the first 15 records */
SELECT Name, HeadOfState, LifeExpectancy, IndepYear, Population, GNP
FROM country
WHERE IndepYear BETWEEN 1820 AND 1850
AND LifeExpectancy > 60
AND Continent = 'Europe'
ORDER BY GNP DESC, Name
LIMIT 15;

/* 6. Create the following report:
- Display the district, the country code and the following aggregations:
- the total population of the cities in each district
- the average population of the cities in each district
- the maximum population of the cities in each district
- the minimum population of the cities in each district
- the population difference between the most populated and least populated city in each district
- Select only the districts the contain the letter 'x' in their name
- Limit the result set to the top 10 most populated districts */
SELECT District, CountryCode, SUM(Population), AVG(Population), MAX(Population), MIN(Population), MAX(Population)- MIN(Population) pop_difference
FROM city
GROUP BY CountryCode, District
HAVING District LIKE '%x%'
ORDER BY MAX(Population) DESC
LIMIT 10;




/* 7. Please run the following query and note the errors it generates.
Fix the query and submit it once it runs with no errors.

SELECT CountryCode
COUNT* AS Total Population
FROM city WHERE Population. > 50000 AND Name LIKE '%c%'
ORDER BY Population DESCND LIMIT 5,10,1000; */

SELECT CountryCode, SUM(Population) AS total_population
FROM city
WHERE Population > 50000
AND Name LIKE '%c%'
GROUP BY CountryCode
ORDER BY total_population DESC
LIMIT 5,10;

/* 8. Create the following report:
- Displays the CountryCode of a country along with the number of cities in that country and the total population of its cities
- Returns the population of the city with the most inhabitants
- Returns the population of the city with the least inhabitants
- Returns only countries that have at least 50 cities
- Sort the result by the most populated cities in ascending order */
SELECT CountryCode, COUNT(*) num_cities, SUM(Population) total_population, MAX(Population), MIN(Population)
FROM city
GROUP BY CountryCode
HAVING num_cities >= 50
ORDER BY MAX(Population);


/* 9. Write a query that:
- Calculates the total GNP, average GNP, total population of all government forms
- Calculates the GNP per capita (total GNP divided by total population)
- Filters out countries with no GNP and whose population is less than 1000 people
- Only displays the results of government forms that contain the word monarchy or the word republic */
SELECT GovernmentForm, SUM(GNP), AVG(GNP), SUM(Population), SUM(GNP)/SUM(Population) GNP_per_capita
FROM country
WHERE GNP <> 0
AND GNP IS NOT NULL
AND Population >= 1000
GROUP BY GovernmentForm
HAVING (GovernmentForm LIKE '%monarchy%'
OR GovernmentForm LIKE '%republic%');


/* 10. Create the following report:
- Select the continent name, the total population, and the average life expectancy
- Return only countries that are in Europe, North America and Africa
- Return only countries that have a life expectancy of more than 60 years
- Exclude countries that have no data for life expectancy
- Return only continents that have an average life expectancy of at least 50 years
- Return only continents that have a maximum life expectancy in one of their countries of at least 70 years */

/* -------------------------------
   WHERE LifeExpectancy > 60 exclude null records
------------------------------- */
SELECT Continent, SUM(Population) total_population, AVG(LifeExpectancy) avg_lifeExpectancy
FROM country
WHERE Continent IN ('Europe', 'North America', 'Africa')
AND LifeExpectancy > 60
GROUP BY Continent
HAVING AVG(LifeExpectancy) >= 50
AND MAX(LifeExpectancy) >= 70;


