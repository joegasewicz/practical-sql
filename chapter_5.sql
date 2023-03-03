-- Chapter 5
-- Basic Maths & Stats With SQL

-- Maths Operators
SELECT 2 + 2;
SELECT 9 - 1;
SELECT 3 * 4;

-- Division & Modulo
SELECT 11 / 6;
SELECT 11 % 6;
SELECT 11.0 / 6;
SELECT CAST (11 AS numeric(3,1)) / 6;

-- Exponents, Roots & Factorials
SELECT 3 ^ 4; -- 81
SELECT |/ 25; -- 5 - Square Root
SELECT sqrt(25); -- 5
SELECT ||/ 10; -- 2.154... - Cube Root
SELECT 4 !; -- Factorial

-- Doing maths across Census table columns
SELECT geo_name,
       state_us_abbreviation AS "st",
       p0010001 AS "Total Population",
       p0010003 AS "White Alone"
FROM us_counties_2010;