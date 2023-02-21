-- Chapter 2
-- Beginning Data exploration with select

SELECT * FROM teachers;

-- DISTINCT
SELECT DISTINCT school FROM teachers;
SELECT DISTINCT school, salary FROM teachers;

-- ORDERBY
SELECT first_name, last_name, salary
FROM teachers
ORDER BY salary; -- ASC

SELECT first_name, last_name, salary
FROM teachers
ORDER BY  salary DESC; -- descending

-- Collation Settings (lc_collate)
SHOW ALL;

SELECT last_name, school, hire_date
FROM teachers
ORDER BY school ASC, hire_date DESC;

-- WHERE =
SELECT last_name, school, hire_date
FROM teachers
WHERE school = 'Myers Middle School';

-- ===================================================
-- OPERATORS
-- ===================================================
-- WHERE <> OR != (not equal to)
SELECT last_name, school, salary
FROM teachers
WHERE school <> 'Myers Middle School'; -- WHERE school != 'Myers Middle School';

-- WHERE > (Greater than)
SELECT last_name, school, salary
FROM teachers
WHERE salary > 37000;

-- WHERE > (Less than)
SELECT last_name, school, salary
FROM teachers
WHERE salary < 37000;

-- WHERE > (Greater than or Equal To)
SELECT last_name, school, salary
FROM teachers
WHERE salary >= 38500;

-- WHERE > (Greater than or Less Than)
SELECT last_name, school, salary
FROM teachers
WHERE salary <= 37000;

-- WHERE BETWEEN (Within a range)
SELECT last_name, school, salary
FROM teachers
WHERE salary BETWEEN 43499 AND 65001;

-- WHERE IN (Match one of a set of values)
SELECT last_name, school, salary
FROM teachers
WHERE last_name IN ('Cole', 'Diaz');

-- WHERE LIKE (Match a pattern (case sensitive)
SELECT first_name
FROM teachers
WHERE first_name LIKE 'Sam%';

-- WHERE ILIKE (Match a pattern (case insensitive)
SELECT first_name
FROM teachers
WHERE first_name ILIKE 'sam%';

-- WHERE LIKE (Match a pattern (case sensitive)
SELECT first_name
FROM teachers
WHERE first_name NOT LIKE 'Sam%';

-- WHERE ILIKE (Match a pattern (case insensitive)
SELECT first_name
FROM teachers
WHERE first_name NOT ILIKE 'sam%';

-- //===================================================

-- Combining AND OR
SELECT * FROM teachers
WHERE school = 'Myers Middle School'
    AND salary < 40000;

SELECT * FROM teachers
WHERE last_name = 'Cole'
    OR last_name = 'Bush';

SELECT * FROM teachers
WHERE school = 'F.D. Roosevelt HS'
    AND (salary < 38000 OR salary > 40000);


-- ADDING ORDER BY
SELECT first_name, last_name, school, hire_date, salary
FROM teachers
WHERE school LIKE '%Roos%'
ORDER BY hire_date DESC;
