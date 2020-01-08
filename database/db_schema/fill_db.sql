INSERT INTO address (territory, country, city, postal_code, address_line_1, address_line_2)
SELECT DISTINCT territory, country, city, postalcode, addressline1, addressline2
FROM sales_data_sample;

INSERT INTO product_category (name)
SELECT DISTINCT productline
FROM sales_data_sample;

INSERT INTO customer (name, address_id)
SELECT DISTINCT customername, a.id
FROM sales_data_sample sds
         JOIN address a on sds.addressline1 = a.address_line_1;

INSERT INTO customer_representative (phone, first_name, last_name, customer_id)
SELECT DISTINCT phone, contactfirstname, contactlastname, c.id
FROM sales_data_sample
    JOIN customer c ON customername = name;

INSERT INTO orders (order_number, order_date, status, customer_id)
SELECT DISTINCT CAST(ordernumber AS integer), CAST(orderdate AS timestamp without time zone), status, c.id
FROM sales_data_sample sds
        JOIN customer c ON c.name = customername;


