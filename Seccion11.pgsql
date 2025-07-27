SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public' AND table_name LIKE 'jo%';

SELECT LEFT(first_name, 1) || ' ' || last_name AS Employee_Name
FROM employees;

SELECT first_name || ' ' || last_name AS Employee_Name, 
email 
FROM employees
WHERE email ILIKE '%IN%';

SELECT MIN(last_name) AS First_Last_Name,
MAX(last_name) AS Last_Last_Name
FROM employees;

SELECT TO_CHAR(salary / 4, '$9999.99') AS weekly_salary
FROM employees
WHERE salary / 4 BETWEEN 700 AND 3000;

SELECT e.first_name || ' ' || e.last_name AS employee_name,
j.job_title AS job
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
ORDER BY j.job_title;
 
SELECT LEFT(e.first_name, 1)|| ' ' || e.last_name AS employee_name,
j.job_title AS job,
j.min_salary || ' - ' || j.max_salary AS salary_range,
e.salary AS employee_salary
FROM employees e
JOIN jobs j ON e.job_id = j.job_id;

SELECT LEFT(e.first_name, 1) || ' ' || e.last_name AS employee_name,
d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

SELECT LEFT(e.first_name, 1) || ' ' || e.last_name AS employee_name,
d.department_name
FROM employees e
JOIN departments d USING (department_id);

SELECT 
  CASE 
    WHEN manager_id IS NULL THEN 'Nobody'
    ELSE 'Somebody'
  END AS "Works for",
  last_name AS "Last Name"
FROM employees
ORDER BY "Works for", "Last Name";

SELECT 
  LEFT(first_name, 1) || ' ' || last_name AS "Employee Name",
  salary AS "Salary",
  CASE 
    WHEN commission_pct IS NULL THEN 'No'
    ELSE 'Yes'
  END AS "Commission"
FROM employees;

SELECT 
  e.last_name,
  d.department_name,
  l.city,
  l.state_province
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
JOIN locations l ON d.location_id = l.location_id;

SELECT 
  first_name,
  last_name,
  CASE
    WHEN commission_pct IS NOT NULL THEN commission_pct::TEXT
    WHEN manager_id IS NOT NULL THEN manager_id::TEXT
    ELSE '-1'
  END AS "Resultado"
FROM employees;

SELECT 
  e.last_name,
  e.salary,
  j.grade_level
FROM employees e
JOIN job_grades j 
  ON e.salary BETWEEN j.lowest_sal AND j.highest_sal
WHERE e.department_id > 50;

SELECT 
  e.last_name,
  d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id;

WITH RECURSIVE org_chart AS (
  SELECT 
    employee_id,
    last_name,
    manager_id,
    1 AS level
  FROM employees
  WHERE employee_id = 100

  UNION ALL

  SELECT 
    e.employee_id,
    e.last_name,
    e.manager_id,
    oc.level + 1
  FROM employees e
  JOIN org_chart oc ON e.manager_id = oc.employee_id
)
SELECT 
  e.last_name AS employee,
  m.last_name AS manager,
  oc.level
FROM org_chart oc
LEFT JOIN employees e ON oc.employee_id = e.employee_id
LEFT JOIN employees m ON oc.manager_id = m.employee_id;

SELECT 
  MIN(hire_date) AS "Lowest",
  MAX(hire_date) AS "Highest",
  COUNT(*) AS "No of Employees"
FROM employees;

SELECT 
  d.department_name,
  SUM(e.salary) AS Salaries
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING SUM(e.salary) BETWEEN 15000 AND 31000
ORDER BY Salaries;

SELECT 
  d.department_name,
  d.manager_id,
  m.last_name AS manager_name,
  ROUND(AVG(e.salary), 2) AS avg_dept_salary
FROM departments d
LEFT JOIN employees m ON d.manager_id = m.employee_id
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name, d.manager_id, m.last_name;

SELECT 
  ROUND(MAX(avg_salary)) AS highest_avg_salary_for_depts
FROM (
  SELECT AVG(salary) AS avg_salary
  FROM employees
  GROUP BY department_id
) AS dept_avgs;

SELECT 
  d.department_name,
  SUM(e.salary) AS monthly_cost
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

SELECT 
  d.department_name,
  e.job_id AS job_title, 
  SUM(e.salary) AS monthly_cost
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY GROUPING SETS (
  (d.department_name, e.job_id),
  (d.department_name),
  ()
)
ORDER BY d.department_name, e.job_id;

SELECT 
  d.department_name,
  e.job_id AS job_title,
  SUM(e.salary) AS monthly_cost,
  GROUPING(d.department_name) AS dept_ID_used,
  GROUPING(e.job_id) AS job_ID_used
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY CUBE(d.department_name, e.job_id)
ORDER BY d.department_name, e.job_id;

SELECT 
  d.department_name,
  e.job_id AS job_title,
  l.city,
  SUM(e.salary) AS sum_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
GROUP BY GROUPING SETS (
  (d.department_name, e.job_id),
  (l.city)
)
ORDER BY d.department_name, l.city, e.job_id;

SELECT 
  LEFT(first_name, 1) || ' ' || last_name AS Employee_Name,
  department_id AS Department_Id,
  '-' AS Department_Name,
  '-' AS City
FROM employees
UNION ALL
SELECT 
  '-' AS Employee_Name,
  department_id,
  department_name,
  '-' AS City
FROM departments
UNION ALL
SELECT 
  '-' AS Employee_Name,
  NULL AS Department_Id,
  '-' AS Department_Name,
  city
FROM locations;


SELECT 
  LEFT(e.first_name, 1) || ' ' || e.last_name AS Employee,
  e.salary,
  d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > (
  SELECT AVG(salary)
  FROM employees
  WHERE department_id = e.department_id
);
