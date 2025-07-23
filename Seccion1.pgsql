SELECT *
FROM employees;

SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'SA_REP';

SELECT department_name
FROM departments;

SELECT last_name
FROM employees;

SELECT salary
FROM employees
WHERE last_name LIKE
'Smith';

SELECT *
FROM countries;

SELECT country_id, country_name, region_id
FROM countries;

SELECT location_id, city, state_province
FROM locations;

SELECT last_name, salary,
salary + 300
FROM employees;

SELECT last_name, salary,
12*salary +100
FROM employees;

SELECT last_name, salary,
12*(salary +100)
FROM employees;

SELECT last_name, job_id, salary, commission_pct,
salary*commission_pct
FROM employees;

SELECT last_name AS name,
commission_pct AS comm
FROM employees;

SELECT last_name "Name",
salary*12 "Annual Salary"
FROM employees;