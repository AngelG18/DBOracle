SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id;

SELECT MAX(salary)
FROM employees
GROUP BY department_id;

SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id;

SELECT COUNT(country_name), region_id
FROM wf_countries
GROUP BY region_id
ORDER BY region_id;

SELECT department_id, MAX(salary)
FROM employees
WHERE last_name != 'King'
GROUP BY department_id;

SELECT region_id, ROUND(AVG(population)) AS population
FROM wf_countries
GROUP BY region_id
ORDER BY region_id;

SELECT country_id, COUNT(language_id) AS "Number of
languages"
FROM wf_spoken_languages
GROUP BY country_id;

SELECT department_id, job_id,
count(*)
FROM employees
WHERE department_id > 40
GROUP BY department_id, job_id;

SELECT department_id,MAX(salary)
FROM employees
GROUP BY department_id
HAVING COUNT(*)>1
ORDER BY department_id;

SELECT region_id,
ROUND(AVG(population))
FROM wf_countries
GROUP BY region_id
HAVING MIN(population)>300000
ORDER BY region_id;

SELECT department_id, job_id, SUM(salary)
FROM employees
WHERE department_id < 50
GROUP BY ROLLUP (department_id, job_id);

SELECT department_id, job_id, SUM(salary)
FROM employees
WHERE department_id < 50
GROUP BY (department_id, job_id);

SELECT department_id, job_id, SUM(salary)
FROM employees
WHERE department_id < 50
GROUP BY CUBE (department_id, job_id);

SELECT department_id, job_id, manager_id, SUM(salary)
FROM employees
WHERE department_id < 50
GROUP BY GROUPING SETS
((job_id, manager_id),(department_id, job_id),
(department_id, manager_id));

SELECT department_id, job_id, SUM(salary),
GROUPING(department_id) AS "Dept sub total",
GROUPING(job_id) AS "Job sub total"
FROM employees
WHERE department_id < 50
GROUP BY CUBE (department_id, job_id);

SELECT hire_date, employee_id, job_id
FROM employees
UNION
SELECT NULL::DATE,employee_id,
job_id
FROM job_history;

SELECT hire_date, employee_id, job_id
FROM employees
UNION
SELECT NULL::DATE,employee_id, job_id
FROM job_history
ORDER BY employee_id;

SELECT hire_date, employee_id, NULL::DATE start_date,
NULL::DATE end_date, job_id, department_id
FROM employees
UNION
SELECT NULL::DATE, employee_id, start_date, end_date,
job_id, department_id
FROM job_history
ORDER BY employee_id;