use mydb;

select employee_id, first_name, job_id, salary
from employees
where salary > 6000;

select employee_id, first_name, job_id, salary, department_id
from employees
where job_id = 'ST_MAN';

select employee_id, first_name, job_id, salary, hire_date, department_id
from employees
where hire_date > '1999-01-01';

-- select first_name, job_id, salary, department_id
-- from employees
-- where salary >= 3000
-- 	and salary < 5000;

select first_name, job_id, salary, department_id
from employees
where salary between 3000 and 5000;
    
select employee_id, first_name, job_id, salary, department_id
from employees
where employee_id = '145'
	or employee_id = '152'
    or employee_id = '203';
-- where employee_id in(145, 152, 203); 이 더 나았을듯
    
select employee_id, first_name, job_id, salary, hire_date, department_id
from employees
where year(hire_date) = '2000';

select employee_id, first_name, job_id, salary, hire_date, commission_pct, department_id
from employees
where commission_pct is null;

select employee_id, first_name, job_id, salary, hire_date, department_id
from employees
where salary >= 7000
	and job_id = 'ST_MAN';
    
select employee_id, first_name, job_id, salary, hire_date, department_id
from employees
where salary >= 10000
	or job_id = 'ST_MAN';
    
select employee_id, first_name, job_id, salary, department_id
from employees
where job_id != 'ST_MAN'
	and job_id != 'SA_MAN'
    and job_id != 'SA_REP';
    
select employee_id, first_name, job_id, salary
from employees
where (job_id = 'AD_PRES'
	and salary >= 12000)
	or job_id = 'SA_MAN';
    
select employee_id, first_name, job_id, salary
from employees
where (job_id = 'AD_PRES'
	or job_id like 'SA_%')
    and salary >= 12000;