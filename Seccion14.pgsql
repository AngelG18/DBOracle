INSERT INTO clients (client_number, first_name, last_name, phone, email)
VALUES (7234, 'Lonny', 'Vigil', '4072220091', 'lbv@lbv.net');

INSERT INTO clients (client_number, first_name, last_name, phone, email)
VALUES (5922, 'Hiram', 'Peters', '3715832249', 'hpeters@yahoo.com');

INSERT INTO clients (client_number, first_name, last_name, phone, email)
VALUES (5857, 'Serena', 'Jones', '7035335900', 'serena.jones@jones.com');

INSERT INTO clients (client_number, first_name, last_name, phone, email)
VALUES (6133, 'Lauren', 'Vigil', '4072220090', 'lbv@lbv.net');

/**/

ALTER TABLE employees
ADD CONSTRAINT emp_dept_fk FOREIGN KEY (department_id)
REFERENCES departments (department_id) ON DELETE CASCADE;

ALTER TABLE employees
ALTER COLUMN email SET NOT NULL;

ALTER TABLE copy_departments
DROP CONSTRAINT c_dept_dept_id_pk CASCADE;

ALTER TABLE copy_departments
DROP CONSTRAINT c_dept_dept_id_pk;

ALTER TABLE copy_departments
ADD CONSTRAINT c_dept_dept_id_pk PRIMARY KEY (department_id);


SELECT tc.constraint_name, tc.table_name, tc.constraint_type, kcu.column_name FROM information_schema.table_constraints tc
JOIN information_schema.key_column_usage kcu
  ON tc.constraint_name = kcu.constraint_name
WHERE tc.table_name = 'copy_employees'
  AND tc.table_schema = 'public';

ALTER TABLE employees
ADD CONSTRAINT emp_id_pk PRIMARY KEY (employee_id);

ALTER TABLE employees
ADD CONSTRAINT emp_dept_fk FOREIGN KEY (department_id)
REFERENCES departments (department_id) ON DELETE CASCADE;

ALTER TABLE employees
ALTER COLUMN email SET NOT NULL;

ALTER TABLE copy_departments
DROP CONSTRAINT IF EXISTS c_dept_dept_id_pk CASCADE;

ALTER TABLE copy_departments
ADD CONSTRAINT c_dept_dept_id_pk PRIMARY KEY (department_id);