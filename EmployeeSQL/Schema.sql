-- Drop existing tables
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS dept_employee;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salary;


-- Create new tables
CREATE TABLE department (
	dept_id CHAR(5) NOT NULL, -- CHAR(4)
	PRIMARY KEY (dept_id),
	dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE title (
	title_id CHAR(5) NOT NULL,
	PRIMARY KEY (title_id),
	title_name VARCHAR(50) NOT NULL
);

CREATE TABLE employee (
	emp_no INT NOT NULL,
	PRIMARY KEY (emp_no),
	title_id CHAR(5) NOT NULL,
	FOREIGN KEY (title_id) REFERENCES title(title_id),
	birth_date VARCHAR(10) NOT NULL, --DATE
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	sex CHAR(1) NOT NULL, --Test
	hire_date VARCHAR(10) NOT NULL --DATE
);

CREATE TABLE dept_employee (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	dept_id CHAR(5) NOT NULL,
	FOREIGN KEY (dept_id) REFERENCES department(dept_id),
	PRIMARY KEY (emp_no, dept_id)
);

CREATE TABLE dept_manager (
	dept_id CHAR(5) NOT NULL,
	FOREIGN KEY (dept_id) REFERENCES department(dept_id),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	PRIMARY KEY (dept_id, emp_no)
);

CREATE TABLE salary (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	salary money NOT NULL,
	PRIMARY KEY (emp_no, salary)
);

