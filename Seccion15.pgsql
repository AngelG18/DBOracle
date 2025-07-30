CREATE VIEW view_employees
AS SELECT employee_id,first_name, last_name, email
FROM employees
WHERE employee_id BETWEEN 100 and 124;

SELECT *
FROM view_employees;

CREATE OR REPLACE VIEW view_euro_countries
AS SELECT country_id, region_id, country_name, capitol
FROM wf_countries
WHERE location LIKE '%Europe';

SELECT * FROM view_euro_countries
ORDER BY country_name;

CREATE OR REPLACE VIEW view_euro_countries
AS SELECT country_id AS "ID", country_name AS "Country",
capitol AS "Capitol City"
FROM wf_countries
WHERE location LIKE '%Europe';

CREATE OR REPLACE VIEW view_euro_countries AS
SELECT 
  c.country_id AS "ID",
  c.country_name AS "Country",
  c.capitol AS "Capitol City",
  r.region_name AS "Region"
FROM wf_countries c
JOIN wf_world_regions r USING (region_id)
WHERE c.location ILIKE '%Europe';

SELECT *
FROM view_euro_countries;

CREATE OR REPLACE VIEW view_high_pop
("Region ID", "Highest population") AS
SELECT region_id, MAX(population)
FROM wf_countries
GROUP BY region_id;

SELECT * FROM view_high_pop;

CREATE VIEW view_dept50
AS SELECT department_id,
employee_id,first_name, last_name, salary
FROM copy_employees
WHERE department_id = 50;

SELECT * FROM
view_dept50;

UPDATE view_dept50
SET department_id = 90
WHERE employee_id = 124;

SELECT e.last_name, e.salary, e.department_id, d.maxsal
FROM employees e,
(SELECT department_id, max(salary) maxsal
FROM employees
GROUP BY department_id) d
WHERE e.department_id = d.department_id
AND e.salary = d.maxsal;

SELECT 
  ROW_NUMBER() OVER (ORDER BY hire_date) AS "Longest employed",
  last_name,
  hire_date
FROM employees
ORDER BY hire_date
LIMIT 5;
