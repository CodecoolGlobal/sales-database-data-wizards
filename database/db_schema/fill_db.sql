INSERT INTO address (territory, country, city, postal_code, address_line_1, address_line_2)
SELECT territory, country, city, postalcode, addressline1, addressline2
FROM sales_data_sample;

INSERT INTO customer_representative (first_name, last_name, phone)
SELECT contactfirstname, contactlastname, phone
FROM sales_data_sample;

INSERT INTO product_category (name)
SELECT DISTINCT productline FROM sales_data_sample;

INSERT INTO customer (name, customer_representative_id, address_id)
SELECT DISTINCT customername, cr.id, a.id
FROM sales_data_sample
INNER JOIN address a on sales_data_sample.city = a.city
INNER JOIN customer_representative cr on sales_data_sample.phone = cr.phone;

