/*
  Student Name: Miku Abe
  Student Number: 041047851
  Course Section: 302
*/
USE world;
/* 1. Using a UNION query, create a report that lists the name and the district of the cities
   in Canada (code CAN) and the Netherlands (code NLD). Note that this query can be written
   without using a UNION. The purpose of this question is to use UNION. (city table) */
SELECT Name, District, CountryCode
FROM city
WHERE CountryCode = 'CAN'
UNION
SELECT Name, District, CountryCode
FROM city
WHERE CountryCode = 'NLD';


/* 2. Using an INNER JOIN..ON, create a report that list the name of cities, the country and
   the indepyear of all countries whose indepYear field is not null. (city and countrytables). */
SELECT ci.Name city, c.Name country, c.IndepYear
FROM city ci
INNER JOIN country c on ci.CountryCode = c.Code
WHERE c.IndepYear IS NOT NULL;


/* 3. Rewrite the previous query using WHERE/FROM. */
SELECT ci.Name city, c.Name country, c.IndepYear
FROM city ci, country c
WHERE ci.CountryCode = c.Code
AND c.IndepYear IS NOT NULL;

/* 4. Using a subquery, list the name of the city, the countrycode, the population and the
   average city population of all cities with a population less than the average population.
   (city table) */
SELECT c1.Name, c1.CountryCode, c1.Population,
       (SELECT AVG(c2.Population)
        FROM city c2)
FROM city c1
WHERE c1.Population < (
    SELECT AVG(c3.Population)
    FROM city c3
    );


/* 5. Using INNER JOIN ..ON, write a query that displays, for the city of Toronto, the name
   of the city and the head of state of its country. (city and country tables) */
SELECT c.Name, c2.HeadOfState
FROM city c
INNER JOIN country c2 on c.CountryCode = c2.Code
WHERE c.Name = 'Toronto';

/* 6. Using INNER JOIN ..ON the three tables, write a query that displays the name of the
   city, the city continent, the city head of state, the year of independence and the
   percentage of people who speaks English in the city of Toronto.
   (city, countrylanguage and country tables) */
SELECT ct.Name, cy.Continent,
       cy.HeadOfState, cy.IndepYear,
       cl.Percentage
FROM city ct
INNER JOIN country cy on ct.CountryCode = cy.Code
INNER JOIN countrylanguage cl ON ct.CountryCode = cl.CountryCode
WHERE ct.Name = 'Toronto'
AND cl.Language = 'English';


/* 7. Rewrite the previous query using WHERE/FROM. */
SELECT ct.Name, cy.Continent, cy.HeadOfState,
       cy.IndepYear, cl.Percentage
FROM city ct, country cy, countrylanguage cl
WHERE ct.CountryCode = cy.Code
AND ct.CountryCode = cl.CountryCode
AND ct.Name = 'Toronto'
AND cl.Language = 'English';

/* 8. Using a subquery, list the name of the city, the countrycode and the population of
   the city with the largest population. (city table) */
SELECT ci.Name, ci.CountryCode, ci.Population
FROM city ci
WHERE ci.Population = (
    SELECT MAX(ci2.Population)
    FROM city ci2
    );

/* 9. Using a subquery, list the name of the city, the countrycode and the population of all
   the cities whose population is larger than the average population. (city table) */
SELECT ci.Name, ci.CountryCode, ci.Population
FROM city ci
WHERE ci.Population > (
    SELECT AVG(ci2.Population)
    FROM city ci2
    );
-- ORDER BY ci.Population;

/* 10. What is wrong with the following subquery?
   SELECT name, countrycode, population, avg(population)
   FROM city
   WHERE population > (SELECT avg(population) FROM city)
*/

# avg(population) using in the main query reduce all records to one.
# because of that, this query gives one record as a results
# even if it is expected more than one.

/* 11. Replace the first avg(population) with (SELECT AVG(population) from city)
   What happens? Why? */

# the result of (SELECT AVG(population) from city) coloum  will be avarage population of whole rows in city table.
# this subquery returns only one row because AVG() reduce the result to one row
# modifing subquery to (SELECT AVG(c2.population) from city c2 where city.Name=c2.name) will work

/* 12. Using a subquery, list the name of the country, the continent and the life
   expectancy of all countries whose life expectancy is less than the average life
   expectancy. (country table) */
SELECT cy.Name, cy.Continent, cy.LifeExpectancy
FROM country cy
WHERE cy.LifeExpectancy < (
    SELECT AVG(cy2.LifeExpectancy)
    FROM country cy2
    );
-- ORDER BY cy.LifeExpectancy DESC

