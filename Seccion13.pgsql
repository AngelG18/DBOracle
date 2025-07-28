/*SELECT *
FROM time_ex1;*/

INSERT INTO copy_employees
VALUES (1, 'Natacha', 'Hansen', 'NHANSEN', '4412312341234',
'07-SEP-1998', 'AD_VP', 12000, null, 100, 90, NULL);

UPDATE copy_employees
SET salary = 1
WHERE employee_id = 1;

DELETE from copy_employees
WHERE employee_id = 1;

SELECT employee_id, salary
FROM copy_employees
WHERE employee_id = 1;

ALTER TABLE copy_employees
SET UNUSED (email);

ALTER TABLE copy_employees
DROP UNUSED COLUMNS;

DROP TABLE copy_employees;

FLASHBACK TABLE copy_employees TO BEFORE DROP;

DROP TABLE copy_employees PURGE;