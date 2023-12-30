-- Count of frequency of employee last names in descending order.
select last_name, count(last_name) from employees group by last_name order by count(last_name) desc;

-- Count of frequency of employee first names in descending order.
select first_name, count(first_name) from employees group by first_name order by count(first_name) desc;

-- The first name, last name and sex of employees with the last name 'Baba' and a first name starting with 'B'
select first_name, last_name, sex from employees where last_name='Baba' and left(first_name, 1)='B';

-- The employee number, last name, first name, sex, and salary of each employee.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary from employees e join salaries s using(emp_no);

-- The first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date from employees where extract('year' from hire_date::DATE)::INT='1986';

-- The department number, department name, the manager's employee number, last name, first name of each department manager.
select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name from employees e join dept_manager dm using(emp_no) join departments d using(dept_no) order by d.dept_no;

-- The employee number, last name, first name, and department name of each employee.
select e.emp_no, e.first_name, e.last_name, d.dept_name from employees e join dept_emp dm using(emp_no) join departments d using(dept_no) order by d.dept_no;

-- The employee number, last name, first name, and department name of each employee in the Sales department.
select e.emp_no, e.first_name, e.last_name, d.dept_name from employees e join dept_emp dm using(emp_no) join departments d using(dept_no) where d.dept_name='Sales';

-- The employee number, last name, first name, and department name of each employee in the Sales and Development department.
select e.emp_no, e.first_name, e.last_name, d.dept_name from employees e join dept_emp dm using(emp_no) join departments d using(dept_no) where d.dept_name in ('Sales', 'Development');