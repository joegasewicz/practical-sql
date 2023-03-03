-- Chapter 6
-- Joining Tables in a Relationa
-- l Database
CREATE TABLE roles (
   id BIGSERIAL,
   name VARCHAR(30),
   CONSTRAINT role_key PRIMARY KEY (id),
   CONSTRAINT rol_name_unq UNIQUE (name)
);

CREATE TABLE departments(
  id BIGSERIAL,
  dept VARCHAR(100),
  city VARCHAR(100),
  CONSTRAINT dept_key PRIMARY KEY (id),
  CONSTRAINT dept_city_unique UNIQUE (dept, city)
);

CREATE TABLE employees (
  id BIGSERIAL,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  salary INTEGER,
  dep_id integer REFERENCES departments (id),
  role_id smallint REFERENCES roles (id),
  CONSTRAINT emp_key PRIMARY KEY (id),
  CONSTRAINT emp_dept_unique UNIQUE (id, dep_id)
);

CREATE TABLE vacations (
   id BIGSERIAL,
   employee_id smallint REFERENCES employees (id),
   CONSTRAINT vac_key PRIMARY KEY (id),
   days smallint NOT NULL
);

INSERT INTO departments (dept, city)
VALUES
    ('Tax', 'Atlanta'),
    ('IT', 'Boston');

INSERT INTO departments (dept, city)
VALUES
    ('HR', 'California');


INSERT INTO employees (first_name, last_name, salary, dep_id, role_id)
VALUES
    ('Nancy', 'Jones', 62500, 1, 1),
    ('Lee', 'Smith', 59300, 1, 1),
    ('Soo', 'Nguyen', 83000, 2, 2),
    ('Janet', 'King', 95000, 2, 3);

INSERT INTO employees (first_name, last_name, salary)
VALUES ('Joe', 'Goose', 120000);

INSERT INTO roles (name)
VALUES ('Manager'),
       ('Duty Manager'),
       ('Developer'),
       ('Cleaner');

INSERT INTO vacations (days, employee_id)
VALUES (1, 1), (7, 2), (14, 3), (2, 4);

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM roles;
SELECT * FROM vacations;


DROP TABLE departments CASCADE;
DROP TABLE employees CASCADE;
DROP TABLE roles CASCADE;
DROP TABLE vacations CASCADE;

-- ===================================
-- Querying Multiple Tables Using JSON
-- ===================================

-- INNER JOIN (returns rows in both tables that match only)
SELECT *
FROM employees INNER JOIN departments
ON employees.dep_id = departments.id;

-- LEFT JOIN (show all rows but if a row doesn't have a join then will leave the table on the right empty)
SELECT *
FROM employees LEFT JOIN departments
ON employees.dep_id = departments.id;

-- RIGHT JOIN (show all rows but if a row doesn't have a join then will leave the table on the left empty)
SELECT *
FROM employees RIGHT JOIN departments
ON employees.dep_id = departments.id;

-- FULL OUTER JOIN (returns all rows as well as non matching rows with the side that doesn't match empty)
SELECT *
FROM employees FULL OUTER JOIN departments
ON employees.dep_id = departments.id;

-- CROSS JOIN (Returns every possible combination of rows from both tables)
SELECT *
FROM employees CROSS JOIN departments;

-- Using NULL to Find Rows with Missing Values (Can be used to test the integrity of the data)
SELECT *
FROM employees LEFT JOIN departments
ON employees.dep_id = departments.id
WHERE departments.id IS NULL;

-- ==================================
-- Three Types of Table Relationships
-- ==================================
-- One-to-One
-- One-to-Many
-- Many-to-Many

-- ====================================
-- Selecting Specific Columns in a Join
-- ====================================
SELECT id
FROM employees LEFT JOIN departments
ON employees.dep_id = departments.id; -- ERROR: column reference "id" is ambiguous

SELECT
    employees.id As employees_id,
    employees.first_name AS name,
    employees.last_name AS surname,
    departments.id AS dep_id,
    departments.dept AS department,
    departments.city AS cities
FROM employees LEFT JOIN departments
ON employees.dep_id = departments.id;

-- ==========================================
-- Simplifying JOIN Syntax with Table Aliases
-- ==========================================
SELECT
    em.id As employees_id,
    em.first_name AS name,
    em.last_name AS surname,
    de.id AS dep_id,
    de.dept AS department,
    de.city AS cities
FROM employees AS em LEFT JOIN departments AS de
                         ON em.dep_id = de.id;

-- =======================
-- Joining Multiple Tables
-- =======================
SELECT
    emp.id,
    emp.first_name AS name,
    r.name AS role_name,
    vac.days AS vac_days,
    dep.dept AS department
FROM employees AS emp
    LEFT JOIN departments AS dep
        ON emp.dep_id = dep.id
    LEFT JOIN roles AS r
        ON emp.role_id = r.id
    LEFT JOIN vacations AS vac
        ON emp.id = vac.employee_id;