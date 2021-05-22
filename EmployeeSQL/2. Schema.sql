-- Drop existing tables
DROP TABLE IF EXISTS department CASCADE;
DROP TABLE IF EXISTS title CASCADE;
DROP TABLE IF EXISTS employee CASCADE;
DROP TABLE IF EXISTS dept_employee CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS salary CASCADE;


-- TABLE SCHEMATA:
-- Create new tables
CREATE TABLE department (
	dept_id VARCHAR(5) NOT NULL,
	PRIMARY KEY (dept_id),
	dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE title (
	title_id VARCHAR(5) NOT NULL,
	PRIMARY KEY (title_id),
	title_name VARCHAR(50) NOT NULL
);

CREATE TABLE employee (
	emp_no INT NOT NULL,
	PRIMARY KEY (emp_no),
	title_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (title_id) REFERENCES title(title_id),
	birth_date VARCHAR(10) NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex VARCHAR(5) NOT NULL,
	hire_date VARCHAR(10) NOT NULL
);

CREATE TABLE dept_employee (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	dept_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (dept_id) REFERENCES department(dept_id),
	PRIMARY KEY (emp_no, dept_id)
);

CREATE TABLE dept_manager (
	dept_id VARCHAR(5) NOT NULL,
	FOREIGN KEY (dept_id) REFERENCES department(dept_id),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	PRIMARY KEY (dept_id, emp_no)
);

CREATE TABLE salary (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	salary INT NOT NULL,
	PRIMARY KEY (emp_no, salary)
);


-- Display tables
SELECT * FROM department;
SELECT * FROM title;
SELECT * FROM employee;
SELECT * FROM dept_employee;
SELECT * FROM dept_manager;
SELECT * FROM salary;