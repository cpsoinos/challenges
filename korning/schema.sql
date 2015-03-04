-- DEFINE YOUR DATABASE SCHEMA HERE
DROP TABLE IF EXISTS invoice_frequencies CASCADE;
DROP TABLE IF EXISTS sales_dates CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS invoices CASCADE;


CREATE TABLE invoice_frequencies (
  id serial PRIMARY KEY,
  invoice_frequency varchar(225) NOT NULL UNIQUE
);

CREATE TABLE sales_dates (
  id serial PRIMARY KEY,
  sale_date date NOT NULL UNIQUE
);

CREATE TABLE products (
  id serial PRIMARY KEY,
  name varchar(225) NOT NULL UNIQUE
);

CREATE TABLE customers (
  id serial PRIMARY KEY,
  name varchar(225) NOT NULL UNIQUE,
  account_no varchar(225)
);

CREATE TABLE employees (
  id serial PRIMARY KEY,
  name varchar(225) NOT NULL UNIQUE,
  email varchar(225) NOT NULL UNIQUE
);

CREATE TABLE invoices (
  id serial PRIMARY KEY,
  invoice_no integer NOT NULL,
  sale_amount money NOT NULL,
  units_sold integer NOT NULL,
  customer_id integer REFERENCES customers(id),
  invoice_frequency_id integer REFERENCES invoice_frequencies(id),
  sale_date_id integer REFERENCES sales_dates(id),
  employee_id integer REFERENCES employees(id),
  product_id integer REFERENCES products(id)
);

ALTER DATABASE korning SET datestyle TO "ISO, MDY";
