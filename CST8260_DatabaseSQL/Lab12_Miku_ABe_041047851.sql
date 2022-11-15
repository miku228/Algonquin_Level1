/*
  Student Name: Miku Abe
  Student Number: 041047851
  Course Section: 302
*/

/* ==== Task A - creating views ==== */
/* 1. Create a view named "view_active_staff" that displays the first name, last name and address of all active staff */
CREATE VIEW view_active_staff
AS SELECT sf.first_name sf_fname, sf.last_name sf_lname, sf.address sf_address
   FROM staff sf
   WHERE sf.is_active = 1;


/* 2. Create a view named "view_incomplete_transactions" that lists rejected and pending orders.
   The view should display all purchase IDs, their status, the first and last names of the Customer and the
   Staff member involved in each transaction. Sort results so rejected orders are listed first. */
SELECT DISTINCT status FROM purchase;
CREATE VIEW view_incomplete_transactions
AS
    SELECT pur.id pur_ID, pur.status pur_status,
           c.first_name c_fname, c.last_name c_lname,
           sf.first_name sf_fname, sf.last_name sf_lname
    FROM purchase pur
    LEFT JOIN customer c on pur.customer_id = c.id
    LEFT JOIN staff sf on pur.staff_id = sf.id
    WHERE pur.status NOT IN ('Completed', 'Processing')
    ORDER BY pur.status DESC;


/* 3. Create a view that lists the name and price of the 5 most expensive products in the Office Products category.
Sort results by price in descending order. Name the view "view_expensive_products" */
CREATE VIEW view_expensive_products
AS
    SELECT pd.name pd_name
    FROM product pd
    ORDER BY pd.price DESC
    LIMIT 5;
# DROP VIEW view_expensive_products;


/* 4. Create a view that calculates the number of products sold, as well as the total income per category, sorted from
highest to lowest total income, and then category name. Consider only Completed transactions. For total income,
don't forget that products can be offered discounts on certain occasions. Name the view "view_products_sold" */

CREATE VIEW view_products_sold
AS
    SELECT pd.category_id, SUM(pi.quantity) qty,
       SUM(pi.quantity) * SUM(pi.price) - SUM(pi.discount) total_income
    FROM purchase_item pi
    LEFT JOIN product pd on pd.id = pi.product_id
    LEFT JOIN purchase p on pi.purchase_id = p.id
    WHERE p.status = 'Completed'
    GROUP BY pd.category_id
    ORDER BY total_income DESC, pd.category_id;

/* 5. Create a view that lists the 5 top selling products (product name, category name, number of sales) of 2019.
Consider only completed transactions. Name the view "view_popular_products" */

CREATE VIEW view_popular_products
AS
    SELECT x.product_name product_name, x.category_name category_name, SUM(pi.quantity) numberOfSales
    FROM  purchase_item pi
    LEFT JOIN purchase pu on pu.id = pi.purchase_id
    LEFT JOIN (
        SELECT pd.id product_id, pd.name product_name, pd.category_id category_id, c.name category_name
        FROM product pd
        LEFT JOIN category c on pd.category_id = c.id
        ) x on x.product_id = pi.product_id
    WHERE YEAR(pu.purchase_date) = '2019'
    GROUP BY pi.product_id
    LIMIT 5;

# SELECT * FROM view_popular_products
# DROP VIEW view_popular_products


/* ==== Task B - using subqueries ==== */

/* 1. Display the date, quantity, and status of the purchase that contains the most items sold in a single purchase.
Consider all status. Your query should have a subquery and display the first and last name of the customer and
staff involved in this purchase. */
SELECT pu.purchase_date purchase_date, SUM(pi.quantity) quantity, pu.status status,
       x.cu_fullname c_fullname, x.sf_fullname s_fullname
FROM purchase pu
LEFT JOIN purchase_item pi on pu.id = pi.purchase_id
LEFT JOIN (
    SELECT CONCAT(cu.first_name, ' ', cu.last_name) cu_fullname, CONCAT(sf.first_name, ' ', sf.last_name) sf_fullname,
           pu.id pu_id
    FROM purchase pu
    LEFT JOIN customer cu on cu.id = pu.customer_id
    LEFT JOIN staff sf on sf.id = pu.staff_id
    ) x on x.pu_id = pu.id
GROUP BY pu.id
ORDER BY quantity DESC
LIMIT 1;

/* 2. Calculate the number of purchases per customer. Using the results from from this calculation, write another
query that calculates the average of purchases per customer. */

# 2-1. Calculate the number of purchases per customer
SELECT customer_id, COUNT(*) number_of_purchase
FROM purchase
GROUP BY customer_id;

# 2-2. Calculate the average of purchases per customer
SELECT SUM(x.number_of_purchase) / COUNT(*) avg_of_purchase
FROM (
    SELECT customer_id, COUNT(*) number_of_purchase
    FROM purchase
    GROUP BY customer_id
         ) x;

/* 3. Reuse your query from the previous question to list all the customer ID of customers that purchased more
products than the average. Save the query in a view named "view_vip_customers" */
CREATE VIEW view_vip_customers
AS
    SELECT customer_id, COUNT(*) number_of_purchase
    FROM purchase
    GROUP BY customer_id
    HAVING number_of_purchase > (
        SELECT SUM(x.number_of_purchase) / COUNT(*) avg_of_purchase
        FROM (
            SELECT customer_id, COUNT(*) number_of_purchase
            FROM purchase
            GROUP BY customer_id
                 ) x
        );

/* 4. Using "view_vip_customers", write a query that lists all information on the store's VIP customers.
Your query should also display the number of orders each customer has made listing the customers that
purchased more products at the top. */
SELECT vvc.*, c.*
FROM view_vip_customers vvc
LEFT JOIN customer c on c.id = vvc.customer_id
ORDER BY vvc.number_of_purchase DESC;




/* 5. Write a query that displays the id, first name, last name and number of purchases per year in different columns
(As displayed in the image on Assignment "Lab 12" on Brightspace). Limit the results to display the top 8 customers
that bought the most products prioritizing more recent years (2020 then 2019 then 2018) */

SELECT cu.id, cu.first_name, cu.last_name,
     pu3.purchase_2018 purchase_2018, pu2.purchase_2019 purchase_2019, pu1.purchase_2020 purchase_2020
FROM customer cu
LEFT JOIN (
    SELECT  customer_id, COUNT(*) purchase_2020
    FROM purchase
    WHERE YEAR(purchase_date) = '2020'
    GROUP BY customer_id, YEAR(purchase_date)
    ) pu1 on cu.id = pu1.customer_id
LEFT JOIN (
    SELECT  customer_id, COUNT(*) purchase_2019
    FROM purchase
    WHERE YEAR(purchase_date) = '2019'
    GROUP BY customer_id, YEAR(purchase_date)
    ) pu2 on cu.id = pu2.customer_id
LEFT JOIN (
    SELECT  customer_id, COUNT(*) purchase_2018
    FROM purchase
    WHERE YEAR(purchase_date) = '2018'
    GROUP BY customer_id, YEAR(purchase_date)
    ) pu3 on cu.id = pu3.customer_id
ORDER BY purchase_2020 DESC, purchase_2019 DESC, purchase_2018 DESC
LIMIT 8;

