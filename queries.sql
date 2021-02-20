-- 1. 
SELECT e.emp_no AS "Employee Number", 
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	e.sex AS "Sex", 
	s.salary AS "Salary"
FROM "Employees" e
INNER JOIN "Salaries" s
ON s.emp_no = e.emp_no;

--2. 
SELECT e.first_name AS "First Name", 
	e.last_name AS "Last Name", 
	e.hire_date AS "Hire Date"
FROM "Employees" e
WHERE e.hire_date >='1986-01-01'
AND e.hire_date < '1987-01-01';
--e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--3. 
SELECT dm.dept_no AS "Department Number", 
	d.dept_name AS "Department Name", 
	dm.emp_no AS "Employee Number", 
	e.last_name AS "Last Name", 
	e.first_name AS "Full Name"
FROM "Department_Managers" dm 
INNER JOIN "Departments" d
ON d.dept_no = dm.dept_no
INNER JOIN "Employees" e
ON e.emp_no = dm.emp_no;

--4. 
SELECT e.emp_no AS "Employee Number", 
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	d.dept_name AS "Department Name"
FROM "Employees" e
INNER JOIN "Employee_Departments" ed
ON ed.emp_no = e.emp_no
INNER JOIN "Departments" d
ON d.dept_no = ed.dept_no;

--5. 
SELECT e.first_name AS "First Name", 
	e.last_name AS "Last Name", 
	e.sex AS "Sex"
FROM "Employees" e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

--6. 
SELECT e.emp_no AS "Employee Number", 
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	d.dept_name AS "Department Name"
FROM "Employees" e
INNER JOIN "Employee_Departments" ed
ON ed.emp_no = e.emp_no
INNER JOIN "Departments" d
ON d.dept_no = ed.dept_no
WHERE d.dept_name = 'Sales';

--7. 
SELECT e.emp_no AS "Employee Number", 
	e.last_name AS "Last Name", 
	e.first_name AS "First Name", 
	d.dept_name AS "Department Name"
FROM "Employees" e
INNER JOIN "Employee_Departments" ed
ON ed.emp_no = e.emp_no
INNER JOIN "Departments" d
ON d.dept_no = ed.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name ='Development';

--8.
SELECT e.last_name AS "Last Name", COUNT(e.last_name) AS "Last Name Count"
FROM "Employees" e
GROUP BY "Last Name"
ORDER BY "Last Name Count" DESC; 
