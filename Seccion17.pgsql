CREATE USER scott 
WITH PASSWORD 'ur35scott';

ALTER USER scott 
WITH PASSWORD 'imscott35';

GRANT UPDATE (salary) 
ON employees TO scott;

CREATE ROLE manager;

GRANT USAGE, CREATE ON SCHEMA 
public TO manager;

GRANT manager TO scott;

GRANT SELECT
ON clients
TO PUBLIC;

GRANT UPDATE(first_name,
last_name)
ON clients
TO scott, manager;

/*SELECT *
FROM scott_king.clients;

CREATE VIEW clients AS
SELECT * FROM scott_king.clients;*/

SELECT *
FROM clients;

SELECT first_name, last_name
FROM employees
WHERE REGEXP_LIKE(first_name, '^Ste(v|ph)en$');

SELECT last_name, REGEXP_REPLACE(last_name, '^H(a|e|i|o|u)', '**')
AS "Name changed"
FROM employees

SELECT country_name, REGEXP_COUNT(country_name, '(ab)') AS
"Count of 'ab'"
FROM wf_countries
WHERE REGEXP_COUNT(country_name, '(ab)')>0;

/*ALTER TABLE employees
ADD CONSTRAINT email_addr_chk
CHECK(REGEXP_LIKE(email,'@'));*/
