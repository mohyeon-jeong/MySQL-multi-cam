use mydb;

-- 1
select *
from employees;

-- 2
desc employees;

-- 3
select employee_id, concat(first_name, last_name) as 이름, salary, job_id
from employees;

-- 4
select salary + 300 as "SALARY+300"
from employees;

-- 5
select employee_id, concat(first_name, last_name) as "name", salary, commission_pct, salary + (salary * commission_pct) as "commision"
from employees;

-- 6
select last_name as "이름", salary as "급여"
from employees;

-- 7
select last_name as "Name", salary * 12 as "Annual Salary"
from employees;

-- 9
select concat('이름 : ', first_name, ', 업무 : ', job_id)
from employees;

-- 10
select concat(last_name, ' is a ', job_id)
from employees;

-- 11
select concat(last_name, ': 1 Year salary = ', salary * 12) as "Annual Salary"
from employees;

create table tb_date(
	col1 timestamp
);

insert into tb_date(col1)
values(now());

select *
from tb_date;

-- 연월일시분초 각각 출력
select year(now()), month(now()), day(now()), hour(now()), minute(now()), second(now())
from tb_date;








