-- Chapter 3
-- Understanding Data Types

-- Data Dictionary - a document that lists each column's type
-- ---------------------
-- Characters
-- ---------------------

-- char(n) (limited with padding)
-- varchar(n) (limited with no padding)
-- text (unlimited)

DROP TABLE char_data_types;

CREATE TABLE char_data_types (
  varchar_column varchar(10),
  char_column char(10),
  text_column text
);

INSERT INTO char_data_types
VALUES ('abc', 'abc', 'abc'),
       ('dfghi', 'dfghi', 'dfghi');

-- can't make as running in docker container
COPY char_data_types TO '/usr/typetest.csv'
WITH (FORMAT CSV, HEADER, DELIMITER '|');


SELECT * FROM char_data_types;

-- ---------------------
-- Numbers
-- ---------------------
-- Integers

-- smallint     -32768 to 32767
-- integer      −2147483648 to +2147483647
-- bigint       −9223372036854775808 to +9223372036854775807


-- Auth-Incrementing Integer (serial types)
-- -------------------------

-- smallserial      1 to 32767
-- serial           1 to 2147483647
-- bigserial        1 to 9223372036854775807

-- ---------------------
-- Decimal Numbers - fixed point / floating point
-- ---------------------

-- Fixed Point Numbers (arbitrary precision type) - numeric / decimal types
-- -------------------

-- numeric(precision, scale)
    -- precision: maximum number of digits to the left & right of the decimal point
    -- scale: number of digits on the right of the decimal point


-- Floating Point Number (real & double precision)
-- ---------------------
-- real
    -- up to 6 decimal digits

-- double precision
    -- up to 15 decimal digits

CREATE TABLE number_data_types (
  numeric_column numeric(20,5),
  real_column real,
  double_column double precision
);

INSERT INTO number_data_types
VALUES (.7, .7, .7),
       (2.13579, 2.13579, 2.13579),
       (2.1357987654, 2.1357987654, 2.1357987654);

SELECT * FROM number_data_types;

SELECT numeric_column * 10000000 AS "Fixed",
       real_column * 10000000 AS "Float"
FROM number_data_types
WHERE numeric_column = .7;
-- Result - Fixed is more exact
-- -----------------------------------
-- | Fixed         | Float            |
-- -----------------------------------
-- | 7000000.00000 | 6999999.88079071 |
-- -----------------------------------

-- 1. Use integers where possible.
-- 2. Decimal where calculation need to be exact use numeric or decimal.
-- 3. Choose a big enough number type. when using numeric set a large enough
--    precision. Use bigint unless sure the number is fixed.

-- ---------------------
-- Dates & Times
-- ---------------------

-- Types:
    -- timestamp    8 bytes     Date & Time         4713 BC to 294276 AD
    -- date         4 bytes     Date (no time)      4713 BC to 5874897 AD
    -- time         8 bytes     Time (no date)      00:00:00 to 24:00:00
    -- interval     16 bytes    Time interval       +/- 178,000,000 years

    -- timestamp:
        -- Records date & time
        -- "with time zone" - ensures time zone included (otherwise you cannot compare times around the globe)
        -- can be specified using "timestamptz"
    -- date
        -- Records just the date
    -- time
        -- Records just the time. Requires "with time zone"
    -- interval
        -- Holds a value expressing a unit of time.

CREATE TABLE date_time_types (
    timestamp_column timestamp with time zone,
    interval_column interval
);

INSERT INTO date_time_types
VALUES ('2018-12-31 01:00 EST', '2 days'),
       ('2018-12-31 01:00 -8', '1 month'),
       ('2018-12-31 01:00 Australia/Melbourne', '1 century'),
       (now(), '1 week');

SELECT * FROM date_time_types;

-- EST - Eastern Standard Time
-- -8 - number of hours difference from Coordinated Universal Time (UTC)
    -- UTC  - overall world time standard + UTC +/- 00:00
    -- using -8 = time zone 8 hours behind UTC (pacific time for example)

