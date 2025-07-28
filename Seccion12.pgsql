/*CREATE TABLE copy_employees
AS (SELECT * FROM employees);

CREATE TABLE copy_departments
AS (SELECT * FROM departments);*/

INSERT INTO copy_departments
VALUES
(210,'Estate Management', 102, 1700);   

INSERT INTO copy_employees
(employee_id, first_name, last_name, email, phone_numeric,
hire_date, job_id, salary)
VALUES
(302,'Grigorz','Polanski', 'gpolanski', '', '15-Jun-2017',
'IT_PROG',4200);

INSERT INTO copy_employees
(employee_id, first_name, last_name, email, phone_numeric,
hire_date,
job_id, salary)
VALUES
(304,'Test',USER, 't_user', 4159982010,'15-Jun-2017',
'ST_CLERK',2500);

SELECT first_name, TO_CHAR(hire_date,'Month, fmdd, yyyy')
FROM employees
WHERE employee_id = 101;

INSERT INTO copy_employees
(employee_id, first_name, last_name, email, phone_numeric,
hire_date,job_id, salary)
VALUES
(301,'Katie','Hernandez', 'khernandez','8586667641',
TO_DATE('July 8, 2017', 'Month fmdd, yyyy'),
'MK_REP',4200); 

INSERT INTO copy_employees
(employee_id, first_name, last_name, email, phone_numeric,
hire_date, job_id, salary)
VALUES
(303,'Angelina','Wright', 'awright','4159982010',
TO_DATE('July 10, 2017 17:20', 'Month fmdd, yyyy HH24:MI'),
'MK_REP', 3600);

SELECT first_name, last_name,
TO_CHAR(hire_date, 'dd-Mon-YYYY HH24:MI') As "Date and Time"
FROM copy_employees
WHERE employee_id = 303;

/*INSERT INTO sales_reps(id, name, salary, commission_pct)
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id LIKE '%REP%';*/

UPDATE copy_employees
SET phone_numeric = '123456'
WHERE employee_id = 303;

UPDATE copy_employees
SET phone_numeric = '654321', last_name = 'Jones'
WHERE employee_id >= 303;

UPDATE copy_employees
SET salary = (SELECT salary
FROM copy_employees
WHERE employee_id = 100)
WHERE employee_id = 101;

UPDATE copy_employees
SET salary = (SELECT salary
FROM copy_employees
WHERE employee_id = 205),
job_id = (SELECT job_id
FROM copy_employees
WHERE employee_id = 205)
WHERE employee_id = 206;

UPDATE copy_employees
SET salary = (SELECT salary
FROM employees
WHERE employee_id = 205)
WHERE employee_id = 202;

ALTER TABLE copy_employees
ADD (department_name varchar2(30) NOT NULL);

UPDATE copy_employees e
SET e.department_name = (SELECT d.department_name
FROM departments d
WHERE e.department_id =
d.department_id);

DELETE from copy_employees
WHERE employee_id = 303;

DELETE FROM copy_employees
WHERE department_id =
(SELECT department_id
FROM departments
WHERE department_name = 'Shipping');

DELETE FROM copy_employees e
WHERE e.manager_id IN
(SELECT d.manager_id
FROM employees d
HAVING count (d.department_id) < 2
GROUP BY d.manager_id);

SELECT e.employee_id, e.salary, d.department_name
FROM employees e JOIN departments d USING (department_id)
WHERE job_id = 'ST_CLERK' AND location_id = 1500
FOR UPDATE
ORDER BY e.employee_id;
