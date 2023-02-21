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

-- Auth-Incrementing Integers

-- smallserial      1 to 32767
-- serial           1 to 2147483647
-- bigserial        1 to 9223372036854775807

-- ---------------------
-- Decimal Numbers
-- ---------------------
