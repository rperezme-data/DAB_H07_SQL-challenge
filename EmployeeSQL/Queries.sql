SELECT * FROM department;
SELECT * FROM title;
SELECT * FROM employee;
SELECT * FROM dept_employee;
SELECT * FROM dept_manager;
SELECT * FROM salary;


SHOW datestyle;
SET datestyle TO MDY;
SET datestyle TO DMY;
SET datestyle = 'ISO,MDY';


SELECT TO_DATE('7/25/1953','MM/DD/YYYY');

SELECT TO_DATE(e.birth_date,'MM/DD/YYYY')

SELECT EXTRACT(YEAR FROM TO_DATE(birth_date,'MM/DD/YYYY'))
FROM employee

SELECT first_name, last_name, TO_DATE(e.birth_date,'MM/DD/YYYY')
FROM employee AS e
WHERE EXTRACT(YEAR FROM TO_DATE(e.birth_date,'MM/DD/YYYY')) = 1957;



-- 1. Employees Details
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary	
FROM employee AS e
JOIN salary AS s
ON (e.emp_no = s.emp_no)
ORDER BY e.emp_no;


-- 2. Employees hired in 1986
SELECT
	e.first_name,
	e.last_name,
	e.hire_date
FROM employee AS e
WHERE EXTRACT(YEAR FROM TO_DATE(e.hire_date,'MM/DD/YYYY')) = 1986
ORDER BY e.hire_date;


-- 3. Managers per department 
SELECT
	dm.dept_id,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM dept_manager AS dm
LEFT JOIN department AS d
ON dm.dept_id = d.dept_id
LEFT JOIN employee AS e
ON dm.emp_no = e.emp_no
ORDER BY dm.dept_id;


-- 4. Department per employee
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM dept_employee AS de
LEFT JOIN employee AS e
ON de.emp_no = e.emp_no
LEFT JOIN department AS d
ON de.dept_id = d.dept_id
ORDER BY e.emp_no;


-- 5. Employees "Hercules B..."
SELECT
	e.first_name,
	e.last_name,
	e.sex
FROM employee AS e
WHERE
	e.first_name = 'Hercules' AND
	e.last_name LIKE 'B%'
ORDER BY e.first_name, e.last_name;






