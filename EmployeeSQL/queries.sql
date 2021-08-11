--1: List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary
FROM employees AS e
JOIN salaries as s
ON e.emp_no = s.emp_no;

--2: List first name, last name, and hire date for employees who were hired in 1986.

SELECT * FROM employees 
WHERE hire_date >= '1986-01-01' 
AND hire_date < '1987-01-01';

--3: List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT d.dept_no,d.dept_name,dm.emp_no,e.last_name,e.first_name
FROM departments as d
JOIN dept_manager as dm
ON d.dept_no = dm.dept_no
JOIN employees as e
ON dm.emp_no = e.emp_no;

--4: List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM employee as e
JOIN dept_name as d
ON e.dept_no = d.dept_no;
-- NEED TO USE SUBQUERIES HERE

