SELECT last_name
FROM employees
WHERE LOWER(last_name) = 'abel';

SELECT last_name
FROM employees
WHERE UPPER(last_name) = 'ABEL';

SELECT last_name
FROM employees
WHERE INITCAP(last_name) = 'Abel';

SELECT CONCAT(first_name, last_name)
FROM employees;

SELECT SUBSTR(last_name,1,3)
FROM employees;

SELECT LENGTH(last_name)
FROM employees;

--SELECT last_name, INSTR(last_name, 'a')
--FROM employees; POSITION ES EL EQUIVALENTE A INSTR
SELECT last_name, POSITION('a' IN last_name)
FROM employees;

SELECT LPAD(last_name, 10,'*')
FROM employees;

SELECT RPAD(last_name, 10,'*')
FROM employees;

SELECT REPLACE(last_name,'a','*')
FROM employees;

SELECT LOWER(last_name)||
LOWER(SUBSTR(first_name,1,1))
AS "User Name"
FROM employees;

SELECT LOWER (last_name)||LOWER(SUBSTR(first_name,1,1))
FROM f_staffs;

SELECT first_name, last_name, salary, department_id
FROM employees
WHERE department_id= 10;

SELECT country_name, MOD(airports,2)
AS "Mod Demo"
FROM wf_countries;

SELECT employee_id, (end_date -
start_date)/365
AS "Tenure in last job"
FROM job_history;

/*SELECT last_name, hire_date + 60
FROM employees;

SELECT last_name, (SYSDATE -
hire_date)/7
FROM employees;

SELECT last_name, hire_date
FROM employees
WHERE MONTHS_BETWEEN
(SYSDATE, hire_date)>240;

SELECT hire_date,
ROUND (hire_date, 'Month')
FROM employees
WHERE department_id=50;

SELECT hire_date,
ROUND (hire_date, 'Year')
FROM employees
WHERE department_id=50;

SELECT employee_id, hire_date,
ROUND(MONTHS_BETWEEN(SYSDATE, hire_date)) AS TENURE,
ADD_MONTHS (hire_date, 6) AS REVIEW,
NEXT_DAY(hire_date, 'FRIDAY'), LAST_DAY(hire_date)
FROM employees
WHERE MONTHS_BETWEEN (SYSDATE, hire_date) > 36;*/

