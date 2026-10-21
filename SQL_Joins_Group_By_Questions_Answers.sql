select * from department;
select * from employees;
select * from orders;

--Display each department's name and the total amount of its delivered orders. Include departments with no delivered
--orders and show 0 for them. Expected columns: DeptName, TotalDeliveredSales.

select d.deptName, coalesce (sum(o.amount),0) as TotalDeliveredSales from department d
left join employees e
on d.deptId = e.deptId
left join orders o
on e.empId=o.empId
group by deptName;

--Display each department's name and the total number of employees working in it. Include departments even if they
--have no employees. Expected columns: DeptName, EmployeeCount

select d.deptName, count(e.empid) from department d
left join employees e
on d.deptid = e.deptid
group by deptName;

--Display the department name and average employee salary. Show only departments whose average salary is greater
--than 55,000. Expected columns: DeptName, AverageSalary.

select d.deptName, avg(e.salary) as AverageSalary  from department d
join employees e
on d.deptid = e.deptid
group by deptName
having avg(e.salary)>55000;

--Display employee names and their total number of orders. Show only employees who handled more than one order.
--Expected columns: EmpName, TotalOrders

select e.empName, count(o.orderid) as TotalOrders from employees e
join orders o
on e.empid = o.empid
group by empName
having count(o.orderid)>1;

--Display the department name, employee count, and total salary. Show only departments whose total salary exceeds
--150,000. Expected columns: DeptName, EmployeeCount, TotalSalary

select d.deptName, count(e.empId) as EmployeeCount, sum(e.salary) as TotalSalary from department d
join employees e
on d.deptId = e.deptId
group by deptName
having sum(e.salary)>150000;

--Display the employee name, department name, and total order amount for each employee. Show only employees
--whose total order amount exceeds 20,000. Expected columns: EmpName, DeptName, TotalOrderAmount.

select e.empName, d.deptName, sum(o.amount) as TotalOrderAmount from employees e
left join department d
on e.deptid = d.deptid
join orders o
on e.empid = o.empid
group by empName, deptName
having sum(o.amount)>20000;

--Display each department's name and the number of distinct employees who handled delivered orders. Show only
--departments with at least two such employees. Expected columns: DeptName, EmployeeCount

select d.deptName, count(distinct(e.empid)) as EmployeeCount from department d
left join employees e
on d.deptid = e.deptid
join orders o 
on e.empid = o.empid
where o.status='Delivered'
group by deptName
having count(distinct(e.empid))>2;

--Display the department name, total number of orders, total order amount, and average order amount. Include
--departments with no orders, but show only departments with at least two orders. Expected columns: DeptName,
--TotalOrders, TotalAmount, AverageAmount.

select d.deptName, count(o.orderid) as TotalOrders, sum(o.amount) as TotalAmount, avg(o.amount) as AverageAmount from department d
left join employees e
on d.deptid = e.deptid
left join orders o
on e.empid = o.empid
group by deptName
having count(o.orderid)>=2