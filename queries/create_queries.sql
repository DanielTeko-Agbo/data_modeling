
DROP TABLE IF EXISTS titles CASCADE;

CREATE TABLE titles (
    title_id VARCHAR(50) PRIMARY KEY, 
    title VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS employees CASCADE;

CREATE TABLE employees (
    emp_no SERIAL PRIMARY KEY, 
    emp_title_id VARCHAR(50) REFERENCES titles (title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    sex VARCHAR(10) NOT NULL,
    hire_date DATE NOT NULL
);


DROP TABLE IF EXISTS departments CASCADE;

CREATE TABLE departments (
    dept_no VARCHAR(50) PRIMARY KEY, 
    dept_name VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS dept_manager CASCADE;
 
CREATE TABLE dept_manager (
    emp_no INT REFERENCES employees (emp_no), 
    dept_no VARCHAR(50) REFERENCES departments,
    PRIMARY KEY (emp_no, dept_no)
);

DROP TABLE IF EXISTS dept_emp CASCADE;

CREATE TABLE dept_emp (
    emp_no INT REFERENCES employees (emp_no), 
    dept_no VARCHAR(50) REFERENCES departments,
    PRIMARY KEY (emp_no, dept_no)
);

DROP TABLE IF EXISTS salaries CASCADE;

CREATE TABLE salaries (
    emp_no INT REFERENCES employees (emp_no), 
    salary NUMERIC(9, 2) DEFAULT 0.00 NOT NULL
);
