use mydb;

select employee_id, first_name, job_id, salary, hire_date, department_id
from employees
order by hire_date;

select employee_id, first_name, job_id, salary, hire_date, department_id
from employees
order by hire_date desc;

select employee_id, first_name, job_id, department_id, salary
from employees
order by department_id asc, salary desc;

select employee_id, first_name, hire_date, department_id, job_id, salary
from employees
order by department_id asc, job_id asc, salary desc;

select avg(salary), max(salary), min(salary), sum(salary)
from employees
where job_id like 'SA_%';

select count(*), count(*) - count(commission_pct), avg(commission_pct), count(distinct job_id)
from employees;

select count(*), avg(salary), min(salary), max(salary), sum(salary)
from employees
group by department_id;

select count(*), avg(salary), min(salary), max(salary), sum(salary)
from employees
group by department_id
order by sum(salary) desc;

select department_id, job_id, count(*), avg(salary), sum(salary)
from employees
group by department_id, job_id;

select department_id, count(*), sum(salary)
from employees
group by department_id
having count(*) > 4;

select department_id, avg(salary), sum(salary)
from employees
group by department_id
having max(salary) >= 10000;

select job_id, truncate(avg(salary), 0), truncate(sum(salary), 0)
from employees
group by job_id
having avg(salary) >= 10000;

select job_id, sum(salary)
from employees
where job_id not like 'SA_%'
group by job_id
having sum(salary) > 10000
order by sum(salary) desc;














