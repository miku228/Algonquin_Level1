/*
  Student Name: Miku Abe
  Student Number: 041047851
  Course Section: 302
*/

# Question 1:
#
# Create the following report in a single query:
# Select your first name and student number, the country code, district,
# and average population of districts
# that have an average population greater than or equal to the average population of all cities.
# Display only the bottom 15 countries
SELECT 'Miku 041047851' name_number, CountryCode, District, ROUND(AVG(Population)) avg_population
FROM world.city
GROUP BY District
HAVING avg_population >= (
        SELECT ROUND(AVG(Population))
        FROM world.city
)
ORDER BY avg_population
LIMIT 15;


# Question 2:
#
# Write a query to show the departure airport, arrival airport, the flight number,
# the days it operates, the flight duration,
# the name of the departure airport as well as the departure country.
# Only include airports that have flights departing on Wednesdays and Fridays of the week
# and that lasted less than the average duration of all flights.
# Sort the result by flight duration in descending order and display only the first 10 records.

# cannot find the data about departing day of week Wednesday and Friday
DESCRIBE Flights.flights;
SELECT ff.departure, ff.arrival, ff.flightnum, ff.day_op, ff.duration,
       CONCAT(fa.name, ' - ', fc.name) departurer_airport_country
FROM Flights.flights ff
JOIN Flights.airports fa on ff.departure = fa.code
JOIN Flights.countries fc on fa.country = fc.code
WHERE ff.duration <
      (
          SELECT AVG(ff1.duration) FROM Flights.flights ff1
          )
AND (ff.day_op LIKE '%3%'
OR ff.day_op LIKE '%5%')
ORDER BY ff.duration DESC
LIMIT 10;


# Question 3:
#
# a) Prepare a report which will show the top aircraft for each airline based on the number of flights serviced.
# Only display aircraft used for at least 15 and no more than 25 flights
# Sort the results by number of flights serviced in descending order
SELECT fal.code airline, fa.name aircraft_name, COUNT(*) used_num
FROM Flights.flights ff
JOIN Flights.aircrafts fa on ff.aircraft = fa.code
JOIN Flights.airlines fal on ff.airline = fal.code
GROUP BY fal.code, fa.code
HAVING used_num >= 15
AND used_num <= 25
ORDER BY used_num DESC;

# b) How many records does the result set contain?
#  ----> 116 rows

# Question 4:
#
# Create a report of airlines and the number of flights serviced per airline
# (Do not forget to include the airline name).
# Only include airlines based in Asia and that serviced flights at least 100 times.
# Display the airlines that services the most flights at the top.

SELECT fa.name airline_name, COUNT(*) num_flights
FROM Flights.flights ff
JOIN Flights.airlines fa on ff.airline = fa.code
JOIN Flights.countries fc on fa.country = fc.code
# WHERE fc.continent IN ('Asia')
# AND ff.aircraft IN (
#     SELECT ff1.aircraft
#     FROM Flights.flights ff1
#     GROUP BY ff1.aircraft
#     HAVING COUNT(*) >= 100
#     )
WHERE fc.continent = 'Asia'
GROUP BY fa.code
HAVING num_flights > 100
ORDER BY num_flights DESC;
# GROUP BY fa.code
# ORDER BY num_flights DESC;


# missing that serviced flights at least 100 times
# SELECT fa.name airline_name, COUNT(*) flights_num
# FROM Flights.flights ff
# JOIN Flights.airlines fa on ff.airline = fa.code
# JOIN Flights.countries fc on fa.country = fc.code
# WHERE fc.continent IN ('Asia')
# GROUP BY ff.airline
# ORDER BY flights_num DESC;


# Question 5:
#
# Create a view that contains the airline name and the average flight duration for the airline, sorted in ascending order.
# IMPORTANT: Please name your view in the following format q5_view_YOUR_NAME (where YOUR_NAME should be
# replaced with your name)
CREATE VIEW q5_view_Miku_Abe
AS
    SELECT fa.name airline_name, AVG(ff.duration) avg_duration
    FROM Flights.airlines fa
    JOIN Flights.flights ff on fa.code = ff.airline
    GROUP BY fa.code
    ORDER BY avg_duration;

# Question 6:
#
# Create a report that displays departure airport (code and name),
# arrival airport (code and name), their days of operation,
# departure time, flight number, duration, and aircraft (code and corresponding name).
# Use LEFT JOINs to make this happen.
SELECT CONCAT(ff.departure, ' - ',  fa1.name) departure,
       CONCAT(ff.arrival, ' - ', fa2.name) arrival,
       ff.day_op, ff.dep_time, ff.flightnum,ff.duration,
       CONCAT(ff.aircraft, ' - ', fac.name) aircraft
FROM Flights.flights ff
LEFT JOIN Flights.airports fa1 on ff.departure = fa1.code
LEFT JOIN Flights.airports fa2 on ff.arrival = fa2.code
LEFT JOIN Flights.aircrafts fac on ff.aircraft = fac.code;


# Question 7:
#
# Create a report which selects all the columns in the "flights" table and the corresponding aircraft name for each
# flight as shown. Use a subquery and do not use JOINs.
SELECT ff.*,
       (SELECT fa.name FROM Flights.aircrafts fa WHERE ff.aircraft = fa.code) aircraft_name
FROM Flights.flights ff;

# Thank you prof. this class is one of my favorites, because you teach us really kindly.
# It helps me understand it and encourages me to know more about database.
# I hope i can see you on campus.Thanks.
