use mydb;

/*
	sorting
    order by
*/

select first_name, salary
from employees
order by salary asc; -- 오름차순

select first_name, salary
from employees
order by salary desc; -- 내림차순

-- where과 함께 사용 가능
select job_id, first_name, salary
from employees
where job_id = 'IT_PROG'
order by salary desc;

-- 중첩 sorting
select first_name, job_id, salary
from employees
order by job_id asc, salary desc;
-- 적은 순서대로 먼저 정렬
-- 위의 경우 job_id가 먼저 정렬되고, 같은 job_id 안에서 salary 정렬

-- as 인용 가능
select salary as '연봉'
from employees
order by 연봉 asc;

-- distinct : (컬럼 등을) 하나씩만 보는 기능
select distinct department_id
from employees
order by department_id asc;

-- group by(위 distinct와 비슷)
-- where 아래, order by 위에 작성해야 함
select department_id -- , first_name - err.
-- department_id를 이미 group화 했기 때문에 동작 불가
from employees
group by department_id;

/*
	통계
    
    그룹 함수
    count, sum, avg, max, min
*/

select count(employee_id), count(*), sum(salary), avg(salary), max(salary), min(salary)
from employees
where job_id = 'IT_PROG';

select department_id, sum(salary), max(salary)
from employees
where department_id is not null
group by department_id;

-- truncate : 버림
select truncate(avg(salary), 0) -- 소숫점 아래로 나타낼 자릿수인듯
from employees
group by department_id;

-- having : group 후의 조건
select job_id, sum(salary)
from employees
group by job_id
having sum(salary) >= 15000
order by sum(salary) desc;

select job_id, count(employee_id), sum(salary), avg(salary)
from employees
where salary >= 5000
group by job_id
having sum(salary) > 20000;












