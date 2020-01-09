INSERT INTO address (territory, country, city, state, postal_code, address_line_1, address_line_2)
SELECT DISTINCT territory, country, city, state, postalcode, addressline1, addressline2
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

INSERT INTO product (product_code, product_category_id, msrp)
SELECT DISTINCT productcode, pc.id, msrp FROM sales_data_sample sds
    JOIN product_category pc ON pc.name = sds.productline;

INSERT INTO order_details (order_id, order_number, product_code, price_each, quantity, category_id, customer_representative_id)
SELECT CAST(concat(ordernumber, orderlinenumber) AS INTEGER) AS order_id, ordernumber, productcode, priceeach, quantityordered, pc.id, cr.id FROM sales_data_sample sds
    JOIN product_category pc ON pc.name = sds.productline
    JOIN product p ON p.product_code = sds.productcode
    JOIN customer_representative cr ON cr.phone = sds.phone;
