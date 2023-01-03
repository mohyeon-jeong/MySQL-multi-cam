use mydb;

-- 조건절 where
select *
from employees
where salary > 6000;

-- null인지 아닌지 비교 : is null / is not null
select first_name, commission_pct
from employees
where commission_pct is not null;

-- and / or
select employee_id, first_name
from employees
where first_name = 'John'
	or first_name = 'Den';
    
select employee_id, first_name, salary
from employees
where job_id = 'IT_PROG'
	and salary > 8000;
    
-- 중간값 between A and B
select first_name, job_id, salary, department_id
from employees
where salary between 3000 and 5000;
    
-- 비교 우선순위 설정
select first_name, salary
from employees
where (first_name = 'John'
	or first_name = 'Den')
    and salary > 6000;
    
-- 특정 문자 포함 검색
select *
from employees
where job_id like 'SA_%'; -- SA_ 로 시작하는 항목
-- %SA, %SA% 전부 가능

-- 날짜 비교
select *
from employees
where hire_date > '1999-01-01';

-- 중첩 조건문
select *
from employees
-- where job_id = 'IT_%'
-- 		or job_id = 'ST_%'
-- 		or job_id = 'PU_%'
where job_id in ('IT_PROG', 'ST_MAN', 'PU_CLERK');
-- not in도 가능함
    
