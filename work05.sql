use mydb;

-- 1
select *
from employees
where salary > ( select salary
				from employees
                where last_name = 'Kochhar' );
                
-- 2
select employee_id, first_name, job_id, salary, department_id
from employees
where salary < (select avg(salary) from employees);        

-- 3
select department_id
from employees
group by department_id
having min(salary) > ( select min(salary)
						from employees
                        where department_id = 100 );
                        
-- 4
select employee_id, first_name, job_id, department_id
from employees
where salary in ( select min(salary) from employees group by job_id )
order by job_id;

-- 5
select e.first_name, e.job_id, d.department_name, l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
	and d.location_id = l.location_id
	and e.job_id = 'SA_MAN';
    
-- 6
select manager_id, count(*)
from employees
group by manager_id
having count(manager_id) = ( select max(cnt) -- max(count(*)) 는 MySQL에서는 안됨
							 from ( select count(*) as cnt
									from employees
                                    group by manager_id ) as e );
                                    
-- 7
select department_id, count(*)
from employees
group by department_id
having count(department_id) = (	select max(cnt)
								from (  select count(*) as cnt
										from employees
										group by department_id ) as e );
                                        
-- 9
select employee_id, first_name, job_id, department_name, salary
from employees e, departments d
where ( job_id, salary ) in ( 	select job_id, min(salary)
								from employees
                                group by job_id )
	and e.department_id = d.department_id
order by job_id desc;
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                