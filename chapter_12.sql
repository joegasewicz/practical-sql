-- Chapter 12
-- Advanced Query Techniques

-- Using Subqueries
SELECT geo_name,
       state_us_abbreviation,
       p0010001
FROM us_counties_2010
WHERE p0010001 >= (
    SELECT percentile_cont(.9) WITHIN GROUP (ORDER BY p0010001)
    FROM us_counties_2010
)
ORDER BY p0010001 DESC;
