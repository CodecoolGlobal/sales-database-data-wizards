INSERT INTO address (territory, country, city, postal_code, address_line_1, address_line_2)
SELECT DISTINCT territory, country, city, postalcode, addressline1, addressline2
FROM sales_data_sample;

INSERT INTO customer_representative (phone, first_name, last_name)
SELECT DISTINCT phone, contactfirstname, contactlastname
FROM sales_data_sample;

INSERT INTO product_category (name)
SELECT DISTINCT productline
FROM sales_data_sample;

INSERT INTO customer (name, customer_representative_id, address_id)
SELECT DISTINCT customername, cr.id, a.id
FROM sales_data_sample sds
         JOIN address a on sds.addressline1 = a.address_line_1
         JOIN customer_representative cr on sds.phone = cr.phone;