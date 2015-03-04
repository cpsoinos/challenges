DROP TABLE recipes CASCADE;
CREATE TABLE recipes(
  id serial PRIMARY KEY,
  recipe_name varchar(225)
);

DROP TABLE comments CASCADE;
CREATE TABLE comments(
  id serial PRIMARY KEY,
  comment varchar(5000),
  recipe_id integer,
  FOREIGN KEY (recipe_id) REFERENCES recipes(id)
);
