-- Just in case, lets drop all tables first

DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;

--Now create each table
CREATE TABLE "departments" (
    "dept_no" VARCHAR NOT NULL PRIMARY KEY,
    "dept_name" VARCHAR NOT NULL
);

CREATE TABLE "titles" (
    "title_id" VARCHAR NOT NULL PRIMARY KEY,
    "title" VARCHAR NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" INT NOT NULL PRIMARY KEY,
    "emp_title_id" VARCHAR NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR NOT NULL,
    "last_name" VARCHAR NOT NULL,
    "sex" VARCHAR NOT NULL,
    "hire_date" DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- This table is intended as a junction between the departments and the employees to achieve a Many to Many relationship
CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR NOT NULL,
	PRIMARY KEY (emp_no,dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR NOT NULL,
    "emp_no" INT NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE "salaries" (
    "emp_no" INT NOT NULL,
    "salary" INT NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);



--Import the data from the CSV's (I've cleaned up my file commands to avoid exposing too much but just to be clear, each copy command copies the appropriate csv)
COPY departments(dept_no,dept_name) FROM 'departments.csv' DELIMITER ',' CSV HEADER;
COPY titles(title_id,title) FROM 'titles.csv' DELIMITER ',' CSV HEADER;
COPY employees(emp_no,emp_title_id,birth_date,first_name,last_name,sex,hire_date) FROM 'employees.csv' DELIMITER ',' CSV HEADER;
COPY dept_emp(emp_no,dept_no) FROM 'dept_emp.csv' DELIMITER ',' CSV HEADER;
COPY dept_manager(dept_no,emp_no) FROM 'dept_manager.csv' DELIMITER ',' CSV HEADER;
COPY salaries(emp_no,salary) FROM 'salaries.csv' DELIMITER ',' CSV HEADER;

--Quick check to make sure all the tables look correct
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;