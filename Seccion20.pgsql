CREATE TABLE emp
AS select * FROM employees;

CREATE TABLE dept
AS select * FROM departments;

SELECT 
  tc.constraint_name,
  tc.constraint_type,
  kcu.column_name,
  kcu.ordinal_position AS position
FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu 
  ON tc.constraint_name = kcu.constraint_name
WHERE tc.table_name = 'job_history';

SELECT 
  column_name
FROM information_schema.columns
WHERE table_name = 'job_history'
  AND is_nullable = 'NO';

ALTER TABLE emp
ADD CONSTRAINT emp_pk PRIMARY KEY (employee_id);

ALTER TABLE dept
ADD CONSTRAINT dept_pk PRIMARY KEY (department_id);

ALTER TABLE emp
ADD CONSTRAINT emp_dept_fk
FOREIGN KEY (department_id)
REFERENCES dept (department_id)
ON DELETE CASCADE;

SELECT COUNT(*) FROM emp;

DELETE FROM dept WHERE department_id = 10;

SELECT COUNT(*) FROM emp;

SELECT *
FROM (
  SELECT 
    last_name,
    salary,
    department_id,
    ROUND(AVG(salary) OVER (PARTITION BY department_id), 2) AS salavg
  FROM employees
) sub
WHERE salary > salavg;

CREATE OR REPLACE VIEW v2 AS
SELECT 
  d.department_name,
  MIN(e.salary) AS "Lowest Salary",
  MAX(e.salary) AS "Highest Salary",
  ROUND(AVG(e.salary), 2) AS "Average Salary"
FROM emp e
JOIN dept d ON e.department_id = d.department_id
GROUP BY d.department_name;

CREATE OR REPLACE VIEW dept_managers_view AS
SELECT 
  d.department_name AS dept_name,
  LEFT(m.first_name, 1) || '.' || m.last_name AS mgr_name
FROM departments d
JOIN employees m ON d.manager_id = m.employee_id;

DROP VIEW IF EXISTS v3;

CREATE SEQUENCE ct_seq;
SELECT nextval('ct_seq');
SELECT currval('ct_seq'); 

INSERT INTO emp (
  employee_id, first_name, last_name, email, phone_numeric,
  hire_date, job_id, salary, commission_pct, manager_id, department_id
)
VALUES (
  nextval('ct_seq'), 'Kaare', 'Hansen', 'KHANSEN', '4496583212',
  CURRENT_DATE, 'Manager', 6500, NULL, 100, 10
);

CREATE INDEX emp_indx 
ON emp (employee_id DESC, UPPER(SUBSTRING(first_name FROM 1 FOR 1) || ' ' || last_name));

SELECT table_name
FROM information_schema.tables
WHERE table_name ILIKE '%priv%';

GRANT SELECT ON emp TO PUBLIC;

SELECT *
FROM information_schema.role_table_grants
WHERE table_name = 'emp'
  AND grantee = 'PUBLIC';

SELECT e.employee_id, d.department_name
FROM employees e
CROSS JOIN departments d;

SELECT e.employee_id, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

SELECT 
  e.last_name,
  d.department_name,
  e.salary,
  c.country_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
JOIN countries c ON l.country_id = c.country_id;

SELECT 
  e.last_name,
  d.department_name,
  e.salary,
  c.country_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
LEFT JOIN locations l ON d.location_id = l.location_id
LEFT JOIN countries c ON l.country_id = c.country_id;