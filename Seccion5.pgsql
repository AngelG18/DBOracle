SELECT TO_CHAR(hire_date, 'Month dd, YYYY')
FROM employees;

SELECT TO_CHAR(hire_date, 'fmMonth dd, YYYY')
FROM employees;

SELECT TO_CHAR(hire_date, 'fmMonth ddth, YYYY')
FROM employees;

SELECT TO_CHAR(hire_date, 'fmDay ddth Mon, YYYY')
FROM employees;

SELECT TO_CHAR(hire_date, 'fmDay ddthsp Mon, YYYY')
FROM employees;

SELECT TO_CHAR(hire_date, 'fmDay, ddthsp "of" Month, Year')
FROM employees;

SELECT TO_CHAR(salary,
'$99,999') AS "Salary"
FROM employees;

SELECT last_name, TO_NUMBER(bonus,
'9999')
AS "Bonus"
FROM employees
WHERE department_id = 80;

SELECT last_name, TO_CHAR(hire_date, 'DD-Mon-YY')
FROM employees
WHERE hire_date < TO_DATE('01-Jan-90','DD-Mon-YY'); 

/*SELECT TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), 'FRIDAY'),
'fmDay, Month ddth, YYYY') AS "Next Evaluation"
FROM employees
WHERE employee_id = 100;

SELECT country_name, NVL(internet_extension, 'None')
AS "Internet extn"
FROM wf_countries
WHERE location = 'Southern Africa'
ORDER BY internet_extension DESC;

SELECT last_name, salary,
NVL2(commission_pct, salary + (salary * commission_pct),
salary)
AS income
FROM employees
WHERE department_id IN(80,90);*/

SELECT first_name, LENGTH(first_name) AS "Length FN", last_name,
LENGTH(last_name) AS "Length LN", NULLIF(LENGTH(first_name),
LENGTH(last_name)) AS "Compare Them"
FROM employees;

SELECT last_name,
COALESCE(commission_pct, salary, 10)
AS "Comm"
FROM employees
ORDER BY commission_pct;

SELECT last_name,
CASE department_id
WHEN 90 THEN 'Management'
WHEN 80 THEN 'Sales'
WHEN 60 THEN 'It'
ELSE 'Other dept.'
END AS "Department"
FROM employees;

/*SELECT last_name,
DECODE(department_id,
90, 'Management',
80, 'Sales',
60, 'It',
'Other dept.')
AS "Department"
FROM employees;*/