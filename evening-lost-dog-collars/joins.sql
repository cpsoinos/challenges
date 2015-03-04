# YOUR SQL CODE GOES HERE


-- ```SQL
-- SELECT dog_owners.name, lost_dog_collars.dog_name
--   FROM dog_owners
--   JOIN lost_dog_collars
--   ON (dog_owners.dog_name = lost_dog_collars.dog_name);
-- ```
--
-- Here is what he got:
--
-- ![alt](http://i.imgur.com/v1xUxzn.png)
--
-- What does this query tell us?

# This gives us a list of owners and their dog's name for collars in the lost-and-found.





-- 1. For which collars can we identify an owner?

SELECT * from lost_dog_collars
INNER JOIN dog_owners
ON lost_dog_collars.dog_name = dog_owners.dog_name;

-- 2. For which collars is there no known owner?

SELECT lost_dog_collars.dog_name FROM lost_dog_collars
LEFT OUTER JOIN dog_owners
ON lost_dog_collars.dog_name = dog_owners.dog_name
WHERE dog_owners.id IS null;

-- 3. We need to see all collars, with an owner, if one matches.

SELECT lost_dog_collars.dog_name, dog_owners.name
FROM lost_dog_collars
INNER JOIN dog_owners
ON lost_dog_collars.dog_name =  dog_owners.dog_name;


-- 4. We need to see all owners, with collars in the Lost and Found, if one matches.

SELECT dog_owners.name FROM dog_owners
INNER JOIN lost_dog_collars
ON dog_owners.dog_name = lost_dog_collars.dog_name;
