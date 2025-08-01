SELECT MAX(salary)
FROM employees;

SELECT MIN(life_expect_at_birth)
AS "Lowest Life Exp"
FROM wf_countries;

SELECT MIN(country_name)
FROM wf_countries;

SELECT MIN(hire_date)
FROM employees;

SELECT MAX(life_expect_at_birth)
AS "Highest Life Exp"
FROM wf_countries;

SELECT MAX(country_name)
FROM wf_countries;

SELECT MAX(hire_date)
FROM employees;

SELECT SUM(area)
FROM wf_countries
WHERE region_id = 29;

SELECT SUM(salary)
FROM employees
WHERE department_id = 90;

SELECT SUM(area)
FROM wf_countries;

SELECT AVG(commission_pct)
FROM employees;

SELECT MAX(salary), MIN(salary), MIN(employee_id)
FROM employees
WHERE department_id = 60;

SELECT COUNT(job_id)
FROM employees;

SELECT commission_pct
FROM employees;

SELECT COUNT(commission_pct)
FROM employees;

SELECT COUNT(*)
FROM employees
WHERE hire_date < '01-Jan-1996';

SELECT job_id
FROM employees;

SELECT DISTINCT job_id
FROM employees;

SELECT DISTINCT job_id,
department_id
FROM employees;

SELECT SUM(salary)
FROM employees
WHERE department_id = 90;

SELECT SUM(DISTINCT salary)
FROM employees
WHERE department_id = 90;

SELECT COUNT (DISTINCT
job_id)
FROM employees;

SELECT COUNT (DISTINCT salary)
FROM employees;