How would you return all the recipes in your database?

SELECT * FROM recipes;

How would you return all the comments in your database?

SELECT recipes.name, comments.user, comments.text FROM comments
JOIN recipes ON comments.recipe_id = recipes.id;

How would you return the most recent recipe posted in your database?

SELECT name FROM recipes
ORDER BY id DESC LIMIT 1;

How would you return all the comments of the most recent recipe in your database?

SELECT recipes.name, comments.user, comments.text FROM comments
FULL OUTER JOIN recipes ON comments.recipe_id = recipes.id
ORDER BY recipes.id DESC LIMIT 1;

How would you return the most recent comment of all your comments?

SELECT text FROM comments
ORDER BY id DESC LIMIT 1;

How would you return the recipe associated with the most recent comment in your database?

SELECT recipes.name FROM comments
JOIN recipes ON comments.recipe_id = recipes.id
ORDER BY comments.id DESC LIMIT 1;

How would you return all comments that include the string brussels in them?

SELECT text FROM comments
WHERE text ILIKE '%brussels%';
