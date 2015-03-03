-- DEFINE YOUR DATABASE SCHEMA HERE
DROP TABLE IF EXISTS invoice_frequencies CASCADE;
DROP TABLE IF EXISTS sales_dates CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS invoices CASCADE;


CREATE TABLE invoice_frequencies (
  id serial PRIMARY KEY,
  invoice_frequency varchar(225)
);

CREATE TABLE sales_dates (
  id serial PRIMARY KEY,
  sales_date date
);

CREATE TABLE products (
  id serial PRIMARY KEY,
  product varchar(225)
);

CREATE TABLE customers (
  id serial PRIMARY KEY,
  account_no varchar(225),
  name varchar(225)
);

CREATE TABLE employees (
  id serial PRIMARY KEY,
  name varchar(225),
  email varchar(225)
);

CREATE TABLE invoices (
  id serial PRIMARY KEY,
  invoice_no integer,
  sale_amount money,
  units_sold integer,
  customer_id integer REFERENCES customers(id),
  invoice_frequency_id integer REFERENCES invoice_frequencies(id),
  sales_date_id integer REFERENCES sales_dates(id),
  employee_id integer REFERENCES employees(id),
  product_id integer REFERENCES products(id)
);

ALTER DATABASE korning SET datestyle TO "ISO, MDY";
