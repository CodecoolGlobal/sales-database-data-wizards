DROP VIEW IF EXISTS sales_report;
CREATE OR REPLACE VIEW sales_report AS
SELECT name,
       count(name)                    as nr_of_orders,
       EXTRACT(YEAR FROM order_date)  as year_of_order
FROM customer
         JOIN orders o on customer.id = o.customer_id
GROUP BY name, year_of_order

HAVING count(name) > 2
ORDER BY nr_of_orders DESC
LIMIT 10;

SELECT *
FROM sales_report;
