use mydb;

-- 1
select first_name, e.department_id,
	d.department_name
from employees e, departments d
where e.department_id = d.department_id;

-- 2
select first_name, job_id,
	d.department_name
from employees e, departments d
where e.department_id = d.department_id
	and e.department_id = 30;
    
-- 3
select first_name, job_id,
	e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id
	and e.commission_pct is not null;
    
-- 4
select first_name, job_id,
	e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id
	and d.location_id = 2500;
    
-- 5
select first_name, d.department_name
from employees e, departments d
where e.department_id = d.department_id
	and first_name like '%A%';
    
-- 6
select e.first_name, m.first_name
from employees e, employees m
where e.manager_id = m.employee_id;

-- 7
select first_name, d.department_name, salary
from employees e, departments d
where e.department_id = d.department_id
	and salary > 6000;
    
-- 8
select e2.first_name, e2.hire_date
from employees e1, employees e2
where e1.first_name = 'TJ'
	and e1.hire_date < e2.hire_date;
    
-- 9
select e.first_name, d.department_name, e.salary
from employees e, departments d
where e.department_id = d.department_id
	and salary between 3000 and 5000;
    
-- 10
select first_name, hire_date
from employees e, departments d
where e.department_id = d.department_id
	and d.department_name = 'ACCOUNTING';
    
-- 11
select first_name, city
from employees e, departments d, locations l
where e.department_id = d.department_id
	and d.location_id = l.location_id
	and salary <= 3000;
    
-- 12
select d.location_id, count(e.employee_id) as emp_count, l.city
from employees e left outer join departments d
	on e.department_id = d.department_id
		inner join locations l
			on d.location_id = l.location_id
group by d.location_id
having count(e.employee_id) <= 5
order by emp_count asc;

-- 13
select e.department_id as deptno, e.first_name as 사원, c.first_name as 동료
from employees e, employees c
where e.department_id = c.department_id
	and e.employee_id != c.employee_id
order by deptno asc, 사원 asc, 동료 asc;









