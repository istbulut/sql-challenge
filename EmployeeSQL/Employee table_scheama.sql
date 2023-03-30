CREATE TABLE departments (
dept_no varchar(4) NOT NULL,
dept_name varchar(30),
primary key (dept_no)	
);

SELECT *
FROM departments

CREATE TABLE titles (
title_id varchar(5) NOT NULL,
title varchar(30),
primary key (title_id)	
);

SELECT *
FROM titles

CREATE TABLE salaries (
emp_no int NOT NULL,
salary int,	
primary key (emp_no)	
);

SELECT *
FROM salaries

CREATE TABLE employees (
emp_no int NOT NULL,
emp_title_id varchar(5) NOT NULL,
birth_date date,
first_name varchar(30),
last_name varchar(30),
sex char(1),
hire_date date,
primary key (emp_no),
foreign key (emp_title_id) references titles(title_id)	
);

SELECT *
FROM employees

CREATE TABLE dept_manager(
dept_no varchar(4) NOT NULL,
emp_no int NOT NULL,
primary key (emp_no,dept_no),
foreign key (emp_no) references employees(emp_no),	
foreign key (dept_no) references departments(dept_no)	
);

SELECT *
FROM dept_manager

CREATE TABLE dept_emp (
emp_no int NOT NULL,
dept_no varchar(4) NOT NULL,
primary key (emp_no,dept_no),
foreign key (emp_no) references employees(emp_no),
foreign key (dept_no) references departments(dept_no)
);

SELECT *
FROM dept_emp

