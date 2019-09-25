/*display location_id, city and country id by ordering cities in asc order and countries in desc */
SELECT location_id,city, country_id  FROM locations order by city,country_id desc;

/*employees who is an IT programmer and who has more than 5 years of experience*/
select * from employees
where job_id= "IT_PROG" and hire_date<'2014-09-24';

/*employees whose salary>5000 and who are sales rep's or employees who belong to dept-60*/
select * from employees;
select first_name, last_name from employees 
where (salary>5000 and job_id='SA_REP') or department_id='60';

/*Write a query to Select first_name, dept name, deptid,salary  from employees table and departments table  based on all the common column. */
select e.first_name, d.department_name,e.department_id,e.salary 
from employees e join departments d on 
e.department_id=d.department_id and e.manager_id=d.manager_id;

/**Write a query to Select first_name, dept name, deptid,salary  from employees table and departments table  based on dept id*/
select e.first_name, d.department_name,e.department_id,e.salary 
from employees e join departments d on 
e.department_id=d.department_id;

/*Write a query to Select  city, firstname, deptname  for an employee*/
select l.city,e.first_name,d.department_name from employees e inner join departments d on e.department_id=d.department_id
inner join locations l on d.location_id=l.location_id;

/*Write a query to fetch  empname, deptname and deptid  of all the departments with and without employees.*/
select concat(first_name," ", last_name) as empname,department_name, d.department_id 
from employees e right outer join departments d on
e.department_id = d.department_id;

/*query to find min sal under each job category in specific  department.*/

select department_name,job_title,min_salary from departments d join employees e on
d.department_id=e.department_id join jobs j on e.job_id=j.job_id group by job_title,department_name ; 

/*write a query to find location_ids common to department and location table*/
select l.location_id from locations l inner join departments d on l.location_id=d.location_id;

/*write a query to fetch employee firstname and street adress (use emp table and locations table*/
select e.first_name,l.street_address from employees e join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id;

/*7th highest salry in employees table*/
select distinct(salary) from employees order by salary desc limit 6,1;

/*employers who are not managers in employees table*/
select * from employees where job_id not in ('AC_MGR','FI_MGR','MK_MAN','PU_MAN','SA_MAN','ST_MAN') ; 

/*employers who are highest paid in the company*/
select * from employees where salary= (select max(salary) from employees) ;

/*employers who are least paid in the company*/
select * from employees where salary = (select min(salary) from employees);

/*create a table and modify column name , datatype of column*/
Create database schoolinfo; 
create table students(
student_id INTEGER not null,
first_name varchar(55),
last_name varchar(55),
class char 
);

Alter Table students
modify column class int null;

describe students;

/*list the name of the employees, paid more than 'Alexander' from emp_details*/
select concat(first_name," ",last_name) as empname, salary from employees 
where salary >(select max(salary) from employees where first_name="Alexander");

/*Write a query to find the name (first_name, last_name) of the employees who are managers*/
select first_name,last_name from employees where job_id in ('AC_MGR','FI_MGR','MK_MAN','PU_MAN','SA_MAN','ST_MAN') ; 

/*Write a query to find the name (first_name, last_name), and salary of the employees who 
earns more than the average salary and works in any of the IT departments*/
select first_name, last_name, salary,department_id from employees e
where (salary>(select avg(salary) from employees) and (select d.department_id from departments d where department_name='IT'));

/*Write a query to find the name (first_name, last_name) and salary of the employees 
who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). 
Sort the results of the salary of the lowest to highest.*/
select first_name, last_name, salary from employees where 
salary >(select max(salary) from employees where job_id='SH_CLERK')
order by salary;

/*Write a query to find the 5th max salary of the employee table*/
select distinct salary from employees order by salary desc limit 4,1;


/*Write a query to fetch even numbered records from employees table*/
set @i=0;
select  @i as i, employee_id from 
(select( @i:=@i + 1) as column_1, employee_id from employees) as table_1 where mod (table_1.column_1,2) = 0;
