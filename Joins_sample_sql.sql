--display each employee's name along with thier department name

select e.emp_name, d.dept_name from employee e
join department d on
e.dept_id = d.dept_id;

--display employee name who belongs to IT department

select e.emp_name from employee e
join department d
on e.dept_id = d.dept_id
where 
dept_name='IT';


--display employee name, salary and department name for employees earning more than 45000

select e.emp_name, e.salary, d.dept_name from employee e
join department d
on e.dept_id = d.dept_id
where
e.salary > 45000;

--display employees working in either IT or HR

select e.emp_name from employee e
join department d
on e.dept_id = d.dept_id
where 
d.deptname in ('IT','HR');

--display all employees, including those who are not assigned to any department

select e.emp_name, d.dept_name from employee e
left join department d
on e.dept_id = d.dept_id;

--display all departments and thier employess including departments that have no employees

select d.dept_name, e.emp_name from employee e
right join department d
on e.dept_id = d.dept_id;

--display employees whose department information is missing

select e.emp_name from employee e
left join department d
on e.dept_id = d.dept_id
where d.dept_id is null;

--display employees who belongs to the finance department and earn more than 40000.

select e.emp_name from employee e
join department d
on e.dept_id = d.dept_id
where e.salary >40000 and d.dept_name='Finance';