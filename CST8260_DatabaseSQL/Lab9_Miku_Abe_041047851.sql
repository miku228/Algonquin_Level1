/*
Student Name: Miku Abe
Student Number: 041047851
Course Section: 302
*/
USE world;
/* Tasks */
/* A - Querying tables city and country:*/
/* 1 - Using INNER JOIN ..ON, write a query that displays the name of cities, the cities'
       population and cities' continent. Sort the result by continent, then by city population,
	   then by city name.
       Note that the field called 'name' is present in the two tables, use a table alias
       to resolve the conflict. */
SELECT c.Name, c.Population, cy.Continent
FROM city c
INNER JOIN country cy ON c.CountryCode = cy.Code
ORDER BY cy.Continent, c.Population, c.Name;


/* 2 - Rewrite the previous query using WHERE/FROM. */
SELECT c.Name, c.Population, cy.Continent
FROM city c, country cy
WHERE c.CountryCode = cy.Code
ORDER BY cy.Continent, c.Population, c.Name;

/* 3 - Rewrite the query in question 1 to countries that became independent in 1960. */
SELECT c.Name, c.Population, cy.Continent
FROM city c
INNER JOIN country cy ON c.CountryCode = cy.Code
WHERE cy.IndepYear = '1960'
ORDER BY cy.Continent, c.Population, c.Name;


/* 4 - Rewrite the previous query using WHERE/FROM. */
SELECT c.Name, c.Population, cy.Continent
FROM city c, country cy
WHERE c.CountryCode = cy.Code
AND cy.IndepYear = '1960'
ORDER BY cy.Continent, c.Population, c.Name;



/* 5 - Using INNER JOIN ..ON, write a query that displays, for the city of Ottawa,
       the name of the city and the head of state of its country. */
SELECT c.Name, cy.HeadOfState
FROM city c
INNER JOIN country cy on c.CountryCode = cy.Code
WHERE c.Name = 'Ottawa';


/* 6 - Using INNER JOIN ..ON, write a query that displays the name of the city, the city
       population, the continent, and the country population of the city of Toronto. */
SELECT c.Name, c.Population, cy.Continent, cy.Population
FROM city c
INNER JOIN country cy on c.CountryCode = cy.Code
WHERE c.Name = 'Toronto';

/* B - Querying tables city and countryLanguage:*/
/* 1 - Using INNER JOIN ..ON, write a query that answers the following question.
       What languages along with their percentage are spoken in the city of Ottawa? */
SELECT c2.Language, c2.Percentage
FROM city c
INNER JOIN countrylanguage c2 on c.CountryCode = c2.CountryCode
WHERE c.Name = 'Ottawa';


/* 2 - Using WHERE/FROM, write a query that answers the following question.
       What official languages along with their percentage are spoken in the city of Ottawa? */
SELECT c2.Language, c2.Percentage
FROM city c, countrylanguage c2
WHERE c.CountryCode = c2.CountryCode
AND c.Name = 'Ottawa'
AND c2.IsOfficial = 'T';


DESCRIBE countrylanguage;
/* 3 - Using INNER JOIN ..ON, write a query that reports the percentage of people speaking
       an official language in the city of Ottawa as well as the percentage of people
	   speaking Polish in the city of Ottawa */
SELECT cl.language, cl.Percentage
FROM city c
INNER JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode
WHERE c.Name = 'Ottawa'
    AND (cl.IsOfficial = 'T'
    OR cl.Language = 'Italian');




/* 4 - Using INNER JOIN ..ON and SUM, write a query that reports the total percentage
       of people speaking an official language as well as speaking Italian in the city
	   of Ottawa */
SELECT IF(cl.IsOfficial = 'T', 'official', cl.Language) language, SUM(cl.Percentage)
FROM city c
         INNER JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode
WHERE c.Name = 'Ottawa'
  AND (cl.IsOfficial = 'T'
    OR cl.Language = 'Polish')
GROUP BY cl.IsOfficial;


/* C - Querying tables city, country and countryLanguage:*/
/* 1 - Using INNER JOIN ..ON the three tables, write a query that displays the name of the city,
      the city continent, the city head of state, the year of independence and the total number
	  of people who speak Italian in the city of Toronto. */
SELECT c.Name, cy.Continent, cy.HeadOfState, cy.IndepYear, FLOOR(c.Population * cl.Percentage) Italian_Speaker
FROM city c
INNER JOIN country cy ON c.CountryCode = cy.Code
INNER JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode
WHERE c.Name = 'Toronto'
AND cl.Language = 'Italian';

/* 2 - Rewrite the previous query using WHERE/FROM.*/
SELECT c.Name, cy.Continent, cy.HeadOfState, cy.IndepYear, FLOOR(c.Population * cl.Percentage) Italian_Speaker
FROM city c, country cy, countrylanguage cl
WHERE c.CountryCode = cy.Code
AND c.CountryCode = cl.CountryCode
AND c.Name = 'Toronto'
AND cl.Language = 'Italian';


/* 3 - Using LEFT JOIN ..ON the three tables, write a query that displays the city continent, the
      country the city is in, the city name and the language spoken in that city */
    SELECT cy.Continent, cy.Name, c.Name, cl.Language
    FROM city c
    LEFT JOIN country cy ON c.CountryCode = cy.Code
    LEFT JOIN countrylanguage cl ON c.CountryCode = cl.CountryCode;
