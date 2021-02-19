-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/WpWn5W
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Physical

CREATE TABLE "Titles" (
    "title_id" VARCHAR(30)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" VARCHAR(30)   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(30)   NOT NULL,
    "hire_date" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Employee_Departments" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Employee_Departments" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "Department_Managers" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" INT   NOT NULL,
    CONSTRAINT "pk_Department_Managers" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Employee_Departments" ADD CONSTRAINT "fk_Employee_Departments_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Employee_Departments" ADD CONSTRAINT "fk_Employee_Departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

SELECT * FROM "Employees";
-- 1. 
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" e
INNER JOIN "Salaries" s
ON s.emp_no = e.emp_no;

--2. 
SELECT e.first_name, e.last_name, e.hire_date 
FROM "Employees" e
WHERE hire_date >= '1-1-1986'
AND hire_Date < '1-1-1987';

--3. 
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM "Department_Managers" dm 
INNER JOIN "Departments" d
ON d.dept_no = dm.dept_no
INNER JOIN "Employees" e
ON e.emp_no = dm.emp_no;

--4. 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" e
INNER JOIN "Employee_Departments" ed
ON ed.emp_no = e.emp_no
INNER JOIN "Departments" d
ON d.dept_no = ed.dept_no;

--5. 
SELECT e.first_name, e.last_name, e.sex 
FROM "Employees" e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

--6. 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" e
INNER JOIN "Employee_Departments" ed
ON ed.emp_no = e.emp_no
INNER JOIN "Departments" d
ON d.dept_no = ed.dept_no
WHERE d.dept_name = 'Sales';

--7. 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" e
INNER JOIN "Employee_Departments" ed
ON ed.emp_no = e.emp_no
INNER JOIN "Departments" d
ON d.dept_no = ed.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name ='Development';

--8.

