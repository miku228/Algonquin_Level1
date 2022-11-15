/*
  Student Name: Miku Abe
  Student Number: 041047851
  Course Section: 302
*/

/* 1. (sakila) - Display the first and last name (in a single column) of all actors whose first name is 5 letters long
   and their last name does not contain the letter "E"    */
SELECT CONCAT(first_name, ' ', last_name) full_name
FROM sakila.actor
WHERE LENGTH(first_name) = 5
AND last_name NOT LIKE '%E%';


/* 2. (world) Using CASE or IF, write a query that calculates the number of official languages and unofficial languages
   in Canada, Brazil, USA and France. Official languages should be displayed as "Official Languages" and unofficial
   languages should be listed as "Others". */
SELECT CountryCode,
       CASE
           WHEN IsOfficial = 'T' THEN 'Official Language'
           ELSE 'Others' END continent,
       COUNT(*) number
FROM world.countrylanguage
WHERE CountryCode IN ('CAN', 'BRA', 'USA', 'FRA')
GROUP BY CountryCode,  IsOfficial;



/* 3. (world) Calculate the number of people that speak English in 'Brasilia', 'Ottawa', 'Paris' and 'Washington'.
   Use ROUND to display the results as integers. Display the same calculation using FLOOR to compare the results.
   For the purposes of this query, use the percentage of people that speak english on their respective countries
   (in countrylanguage). */
SELECT ROUND(cy.Population * cl.Percentage) round_numberofpeople, FLOOR(cy.Population * cl.Percentage) floor_numberofpeople
FROM world.city cy
LEFT JOIN world.countrylanguage cl on cy.CountryCode = cl.CountryCode
WHERE cy.Name IN ('Brasilia', 'Ottawa', 'Paris', 'Washington')
AND cl.Language = 'English';


/* 4. (sales) Using CONCAT and GROUP_CONCAT, list customers' full names and all categories of products where purchased
   in purchases with ID less than or equal to 10.
   (As displayed in the image on Assignment "Lab 13", question 4 on Brightspace) */

SELECT CONCAT(c2.first_name,' ', c2.last_name) customer_fullname,
       GROUP_CONCAT(y.category_name) categories
FROM sales.purchase p
LEFT JOIN
    (
        SELECT pi.purchase_id purchase_id, x.category_name category_name
        FROM sales.purchase_item pi
        LEFT JOIN (
            SELECT p.id product_id, p.name product_name, c.name category_name
            FROM sales.product p
            LEFT JOIN sales.category c on c.id = p.category_id
            ) x on x.product_id = pi.product_id
        WHERE pi.purchase_id <= 10
    ) y on p.id = y.purchase_id
LEFT JOIN sales.customer c2 on c2.id = p.customer_id
GROUP BY c2.id
HAVING categories IS NOT NULL
ORDER BY customer_fullname;

/* 5. (sakila) - Using a CTE, write a query that lists all actors (first and last name) and the number of PG-13 movies
(rating = 'PG-13' and R rated movies (rating = 'R') they worked on. Sort the results by actor name.
(As displayed in the image on Assignment "Lab 13", question 5 on Brightspace) */
SELECT a.actor_id,
       CONCAT(a.first_name, ' ', a.last_name) actor_fullname,
       f.rating
FROM sakila.film f
JOIN film_actor fa on f.film_id = fa.film_id
JOIN actor a on a.actor_id = fa.actor_id
GROUP BY actor_fullname, f.rating;

WITH rating_per_actor AS (
    SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) actor_fullname,
           COUNT(f.rating) number, f.rating
    FROM sakila.film f
    JOIN film_actor fa on f.film_id = fa.film_id
    JOIN actor a on a.actor_id = fa.actor_id
    GROUP BY actor_fullname, f.rating
)
SELECT CONCAT(a.first_name, ' ', a.last_name) actor_fullname,
       r1.number as PG_13_movies,
       r2.number as R_movies
FROM actor a
JOIN rating_per_actor r1 ON r1.actor_id = a.actor_id
JOIN rating_per_actor r2 ON r2.actor_id = a.actor_id
WHERE r1.rating = 'PG-13'
AND r2.rating = 'R'
ORDER BY actor_fullname;



/* 6. (sales) Using a CTE, write a query that displays the id, first name, last name and number of purchases per year in different columns
(As displayed in the image on Assignment "Lab 13", question 6 on Brightspace). Limit the results to display the top 8 customers
that bought the most products prioritizing more recent years (2020 then 2019 then 2018) */
SELECT c.customer_id, YEAR(pu.purchase_date), COUNT(*)
FROM sales.purchase pu
JOIN customer c on c.customer_id = pu.customer_id
GROUP BY c.customer_id,YEAR(pu.purchase_date);

WITH purchase_per_customer AS (
    SELECT c.customer_id, YEAR(pu.purchase_date) year, COUNT(*) number
    FROM sales.purchase pu
    JOIN customer c on c.customer_id = pu.customer_id
    GROUP BY c.customer_id, YEAR(pu.purchase_date)
    )
SELECT c1.id id ,c1.first_name firstname, c1.last_name lastname,
       p1.number as purchases_2018,
       p2.number as purchases_2019,
       p3.number as purchases_2020
FROM sales.customer c1
JOIN purchase_per_customer p1 on p1.customer_id = c1.id
JOIN purchase_per_customer p2 on p2.customer_id = c1.id
JOIN purchase_per_customer p3 on p3.customer_id = c1.id
WHERE p1.year = '2018'
AND p2.year = '2019'
AND p3.year = '2020'
ORDER BY purchases_2020 DESC, purchases_2019 DESC, purchases_2018 DESC;


