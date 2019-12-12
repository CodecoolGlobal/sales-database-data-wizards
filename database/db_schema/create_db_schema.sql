DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS product_category;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS customer_representative;


CREATE TABLE orders
(
    order_number INT PRIMARY KEY,
    order_date   date NOT NULL,
    status       text NOT NULL,
    deal_size    text,
    customer_id  INT  NOT NULL
);


CREATE TABLE product
(
    product_code        INT PRIMARY KEY,
    price               DECIMAL NOT NULL,
    product_category_id INT     NOT NULL,
    msrp                INT     NOT NULL
);


CREATE TABLE customer
(
    id                         SERIAL PRIMARY KEY,
    name                       text,
    customer_representative_id INT,
    address_id                 INT NOT NULL
);

ALTER TABLE ONLY orders
    ADD CONSTRAINT order_customer_id_fk
        FOREIGN KEY (customer_id) REFERENCES customer (id);


CREATE TABLE product_category
(
    id   SERIAL PRIMARY KEY,
    name text
);

ALTER TABLE ONLY product
    ADD CONSTRAINT product_product_category_id__fk
        FOREIGN KEY (product_category_id) REFERENCES product_category (id);

CREATE TABLE address
(
    id             SERIAL PRIMARY KEY,
    territory      text,
    country        text,
    city           text,
    state          text,
    postal_code    text,
    address_line_1 text,
    address_line_2 text
);


CREATE TABLE customer_representative
(
    id         SERIAL PRIMARY KEY,
    first_name text,
    last_name  text,
    phone      text NOT NULL

);

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_customer_representative_id__fk
        FOREIGN KEY (customer_representative_id) REFERENCES customer_representative (id),
    ADD CONSTRAINT customer_address_id__fk
        FOREIGN KEY (address_id) REFERENCES address (id);

CREATE TABLE order_details
(
    order_line_number INT NOT NULL,
    order_number      INT NOT NULL,
    product_code      INT NOT NULL,
    price_each        INT NOT NULL,
    quantity          INT NOT NULL,
    category_id       INT
);

ALTER TABLE ONLY order_details
    ADD CONSTRAINT order_line__order_number__fk
        FOREIGN KEY (order_number) REFERENCES orders (order_number),
    ADD CONSTRAINT order__product_code__fk
        FOREIGN KEY (product_code) REFERENCES product (product_code);
