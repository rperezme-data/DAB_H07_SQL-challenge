-- Drop existing tables
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS dept_employee;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salary;


-- Create new tables
CREATE TABLE department (
	dept_id CHAR(5) NOT NULL,
	dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE title (
	title_id CHAR(5) NOT NULL,
	title_name VARCHAR(50) NOT NULL
);

CREATE TABLE employee (
	emp_no INT NOT NULL,
	title_id CHAR(5) NOT NULL,
	birth_date DATE,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	sex CHAR(1),
	hire_date DATE
);

CREATE TABLE dept_employee (
	emp_no INT NOT NULL,
	dept_id CHAR(5) NOT NULL
);

CREATE TABLE dept_manager (
	dept_id CHAR(5) NOT NULL,
	emp_no INT NOT NULL
);

CREATE TABLE salary (
	emp_no INT NOT NULL,
	salary money
);


DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
	emp_no INT NOT NULL,
	title_id CHAR(5) NOT NULL,
	birth_date VARCHAR(10),
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	sex CHAR(1),
	hire_date VARCHAR(10)
);





