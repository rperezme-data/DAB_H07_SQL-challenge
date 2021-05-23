-- Display tables
SELECT * FROM department;
SELECT * FROM title;
SELECT * FROM employee;
SELECT * FROM dept_employee;
SELECT * FROM dept_manager;
SELECT * FROM salary;


-- QUERIES:
-- 1. Employees Details
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	CAST (s.salary AS MONEY)
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


-- 6. Employees in Sales department
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
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;


-- 7. Employees in Sales & Development department
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
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY e.emp_no;


-- 8. Frequency count of last names
SELECT e.last_name, COUNT(e.emp_no) AS "Frequency Count"
FROM employee AS e
GROUP BY e.last_name
ORDER BY "Frequency Count" DESC;


-- EPILOGUE
SELECT e.emp_no, e.first_name, e.last_name
FROM employee AS e
WHERE e.emp_no = 499942;


-- BONUS ANALYSIS
-- Create view
CREATE VIEW salary_summary AS
SELECT
	t.title_name,
	COUNT(e.emp_no) AS "emp_count",
	CAST(AVG(s.salary) AS MONEY) AS "salary_avg"
FROM employee AS e
LEFT JOIN title AS t ON e.title_id = t.title_id
LEFT JOIN salary AS s ON e.emp_no = s.emp_no
GROUP BY t.title_name
ORDER BY "emp_count";

-- Display view
SELECT * FROM salary_summary;

-- Drop view
-- DROP VIEW salary_summary;

