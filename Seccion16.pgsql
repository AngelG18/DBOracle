CREATE SEQUENCE runner_id_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 50000
CACHE 1;

SELECT 
  schemaname AS sequence_schema,
  sequencename AS sequence_name,
  start_value AS min_value,
  max_value,
  increment_by,
  cache_size,
  cycle
FROM pg_sequences
WHERE schemaname = 'public';


SELECT last_value
FROM runner_id_seq;

INSERT INTO departments
(department_id, department_name, location_id)
VALUES (departments_seq.NEXTVAL, 'Support', 2500);

CREATE TABLE runners (
  runner_id INTEGER PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30)
);

INSERT INTO runners (runner_id, first_name, last_name)
VALUES (nextval('runner_id_seq'), 'Joanne', 'Everely');

INSERT INTO runners (runner_id, first_name, last_name)
VALUES (nextval('runner_id_seq'), 'Adam', 'Curtis');

SELECT runner_id, first_name, last_name
FROM runners;


SELECT 
  schemaname AS sequence_schema,
  sequencename AS sequence_name,
  start_value AS min_value,
  max_value,
  increment_by,
  last_value + increment_by AS "Next number"
FROM pg_sequences
WHERE sequencename = 'runner_id_seq'
  AND schemaname = 'public';

ALTER SEQUENCE runner_id_seq
INCREMENT BY 1
MAXVALUE 999999
CACHE 1
NO CYCLE;

/*DROP SEQUENCE runner_id_seq;*/

CREATE INDEX wf_cont_reg_id_idx
ON wf_countries(region_id);

CREATE INDEX emps_name_idx
ON employees(first_name, last_name);

SELECT DISTINCT ic.index_name, ic.column_name,
ic.column_position, id.uniqueness
FROM user_indexes id, user_ind_columns ic
WHERE id.table_name = ic.table_name
AND ic.table_name = 'EMPLOYEES';

SELECT i.relname AS index_name,a.attname AS column_name, 
array_position(ix.indkey, a.attnum) + 1 AS column_position,
ix.indisunique AS uniqueness
FROM pg_index ix
JOIN pg_class i ON i.oid = ix.indexrelid
JOIN pg_class t ON t.oid = ix.indrelid
JOIN pg_attribute a ON a.attrelid = t.oid AND a.attnum = ANY(ix.indkey)
WHERE t.relname = 'employees' AND t.relkind = 'r'
ORDER BY index_name, column_position;

CREATE INDEX upper_last_name_idx
ON employees (UPPER(last_name));

SELECT *
FROM employees
WHERE UPPER(last_name) = 'KING';

SELECT *
FROM employees
WHERE UPPER(last_name) LIKE 'KIN%';

SELECT *
FROM employees
WHERE UPPER (last_name) IS NOT NULL
ORDER BY UPPER (last_name);

CREATE INDEX emp_hire_year_idx 
ON employees  (EXTRACT(YEAR FROM hire_date));

SELECT first_name, last_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'yyyy') = '1987'