# Queries

* Find all rows that have an ingredient `name` of `Brussels sprouts`.

```
SELECT name, quantity, unit FROM ingredients
WHERE name ILIKE '%brussels sprouts';
```

Before:

![alt](https://www.dropbox.com/s/lhh2f0lfdz7ry8z/Screenshot%202015-03-05%2007.57.35.png?raw=1)

After:

![alt](https://www.dropbox.com/s/yvfchchc5ilcaxc/Screenshot%202015-03-05%2008.50.15.png?raw=1)

* Calculate the total count of rows of ingredients with a `name` of `Brussels sprouts`.


```
SELECT COUNT (*) FROM ingredients
WHERE name ILIKE '%brussels sprouts';
```

Before:

![alt](https://www.dropbox.com/s/vseog6akdpa79ic/Screenshot%202015-03-05%2008.01.40.png?raw=1)

After:

![alt](https://www.dropbox.com/s/s4hqvohvryrytwv/Screenshot%202015-03-05%2008.37.12.png?raw=1)

* Find all `Brussels sprouts` ingredients having a unit type of `gallon(s)`.

```
SELECT name, unit FROM ingredients
WHERE unit ILIKE '%gallon%'
AND name ILIKE '%brussels sprouts';
```

Before:

![alt](https://www.dropbox.com/s/tbhpx2m78y3mipf/Screenshot%202015-03-05%2008.04.13.png?raw=1)

After:

![alt](https://www.dropbox.com/s/vqtfm8ut84ha1it/Screenshot%202015-03-05%2008.37.55.png?raw=1)

* Find all rows that have a unit type of `gallon(s)`, a name of `Brussels sprouts` or has the letter `j` in it.

```
SELECT name FROM ingredients
WHERE unit ILIKE '%gallon%'
AND name ILIKE '%j%Brussels sprouts%';
```

Before:

![alt](https://www.dropbox.com/s/xz6rngrna7q5btp/Screenshot%202015-03-05%2008.04.32.png?raw=1)

After:

![alt](https://www.dropbox.com/s/duwzjrssnv4h97d/Screenshot%202015-03-05%2008.38.32.png?raw=1)

Finally

* Implement a database index to speed up your above SQL queries.

```
CREATE INDEX name
ON ingredients (name);
```

```
CREATE INDEX name_unit
ON ingredients (name, unit);
```
