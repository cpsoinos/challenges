-- Find all rows that have an ingredient name of Brussels sprouts.

SELECT name, quantity, unit FROM ingredients
WHERE name ILIKE '%brussels sprouts';

-- Calculate the total count of rows of ingredients with a name of Brussels sprouts.

SELECT COUNT (*) FROM ingredients
WHERE name ILIKE '%brussels sprouts';

-- Find all Brussels sprouts ingredients having a unit type of gallon(s).

SELECT name, unit FROM ingredients
WHERE unit ILIKE '%gallon%'
AND name ILIKE '%brussels sprouts';

-- Find all rows that have a unit type of gallon(s), a name of Brussels sprouts or has the letter j in it.

SELECT name FROM ingredients
WHERE unit ILIKE '%gallon%'
AND name ILIKE '%j%Brussels sprouts%';

-- Finally * Implement a database index to speed up your above SQL queries.

CREATE INDEX name
ON ingredients (name);

CREATE INDEX name_unit
ON ingredients (name, unit);
