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

-- 1. Employee Details
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



-- 5. Employees first name "Hercules" & last name begin with "B"
SELECT
	e.first_name,
	e.last_name,
	e.sex
FROM employee AS e
WHERE
	e.first_name = 'Hercules' AND
	e.last_name LIKE 'B%'
ORDER BY e.last_name;






