
--Data analysis

--Question 1
SELECT employees.emp_no, employees.last_name,employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON 
employees.emp_no=salaries.emp_no;

--Question 2
SELECT  first_name, last_name, hire_date,
EXTRACT(YEAR from hire_date) as "year",
EXTRACT(MONTH from hire_date) as "month",
EXTRACT(DAY from hire_date) as "day"
FROM employees

CREATE VIEW years AS
SELECT  first_name, last_name, hire_date,
EXTRACT(YEAR from hire_date) as "year",
EXTRACT(MONTH from hire_date) as "month",
EXTRACT(DAY from hire_date) as "day"
FROM employees

SELECT first_name, last_name, year
FROM years
WHERE year=1986


--Question 3
SELECT m.dept_no,d.dept_name,m.emp_no,e.last_name,e.first_name
FROM dept_manager as m
INNER JOIN departments AS d ON
m.dept_no=d.dept_no
INNER JOIN employees AS e ON
m.emp_no=e.emp_no;

--Question 4
SELECT de.dept_no,e.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp as de
INNER JOIN employees as e ON
de.emp_no=e.emp_no
INNER JOIN departments as d ON
de.dept_no=d.dept_no;

--Question 5
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name like 'B%';

--Question 6
SELECT emp_no,last_name, first_name
FROM employees
WHERE emp_no IN
(
SELECT emp_no
FROM dept_emp
WHERE dept_no IN
(
SELECT dept_no
FROM departments
WHERE dept_name= 'Sales'
)
);

--Question 7
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp as de
INNER JOIN employees as e ON
de.emp_no=e.emp_no
INNER JOIN departments as d ON
de.dept_no=d.dept_no
WHERE dept_name='Sales' OR dept_name='Development';

--Question 8
SELECT last_name, COUNT(emp_no)as "frequency counts"
FROM employees 
GROUP BY last_name
ORDER BY "frequency counts" DESC; 