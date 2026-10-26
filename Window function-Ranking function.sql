--find second 2nd highest salaried person: 
--sub query version
select * from employees order by salary desc;
select max(salary) from employee where salary < (select max(salary) from employee);

--window function
--ranmking function

with rank as
(
select * , dense_rank() over (partition by deptid order by salary desc) as salary_rank from employees)
select * from rank where salary_rank =2;

--find the duplicates 

with rownm as
(
select *, row_number() over (partition by empid,empname,deptid,salary order by empid desc) as row_nm from employees)
select * from rownm where row_nm <>1;

--Display all employee details and assign a unique row number based on salary in descending order.

select *, row_number() over (order by salary desc) as row_nm from employees;


--Display employee names, salaries, and their salary ranks from highest to lowest.
-- Employees with the same salary should receive the same rank.

with rankemp as 
(
select *, dense_rank() over (order by salary desc) as ranksal from employees)
select empname,salary, ranksal from rankemp order by ranksal asc;


--Rank all employees based on salary in descending order. 
--Employees with the same salary should receive the same rank, without gaps in the ranking.

with emprank as (
select *, dense_rank() over (order by salary desc) as rankemp from employees
)
select * from emprank;

--Assign row numbers to employees separately within each department, ordering employees by salary from highest to lowest.

with emp_row_no as
(
select *, row_number() over (partition by deptid order by salary desc) as row_no from employees
)
select * from emp_row_no;


--Rank employees by salary within each department. Employees earning the same salary in the same department should receive the same rank.

with emp_rank_sal as
(
select *, dense_rank() over (partition by deptid order by salary desc) as emp_rank from employees
)
select * from emp_rank_sal;

--- Use a CTE to find employees whose salary dense rank is 2 or less within their department. Include ties.

with emp_rank_sal as
(
select *, dense_rank() over (partition by deptid order by salary desc) as emp_rank from employees
)
select * from emp_rank_sal where emp_rank <=2;

--------- different topic "VALUE BASED WINDOW FUNCTION" 

with salegap as
(
select *, lag(sales_date) over (partition department order by sales_date desc) as previous_sales_dt from sales)
select *, datediff(day, sale_date - previous_sales_dt) as daydifference  from salegap 
where datediff(day, sale_date - previous_sales_dt)  > 15;
