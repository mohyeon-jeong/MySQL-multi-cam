use mydb;

-- select
-- column 1개, row 107개 - err
select employee_id, first_name,
	( 	select last_name
		from employees )
from employees;

-- column 2개, row 1개 - err
select employee_id, first_name,
	( 	select last_name, salary
		from employees
        where employee_id = 100)
from employees;

-- column 1, row 1
select employee_id, first_name,
	( 	select last_name
		from employees
        where employee_id = 100)
from employees;

-- 사원 정보 + 월급의 합계, 평균
-- 그룹 함수를 일반 컬럼과 함께 사용했기 때문에 err
select first_name, sum(salary), avg(salary)
from employees;

select first_name, salary,
	(select sum(salary) from employees) as 'salary sum',
    (select avg(salary) from employees) as 'salary avg'
from employees;

select department_id, first_name, salary,
	(select sum(salary) from employees) as 'salary sum'
from employees
where department_id = 30;

-- from
-- mysql에서는 from, where sub query에 alias 붙여줘야 함
select employee_id, first_name, salary
from (select employee_id, first_name, salary, last_name
		from employees
        where department_id = 50) as e
where salary > 5000;
        
select employee_id, first_name, salary, last_name -- err
from (select employee_id, first_name, salary
		from employees
        where department_id = 50) as e;

-- 업무별 급여 합계, 인원수, 사원명, 월급
select job_id, sum(salary), count(*), first_name, salary -- err
from employees
group by job_id;

select e.job_id, salsum, empcnt, e.first_name, e.salary
from employees e, (select job_id as jobno, sum(salary) as salsum, count(*) as empcnt
					from employees
                    group by job_id) as j;
                    
-- where
-- 평균 급여보다 많이 받는 사원                    
select *
from employees
where salary > avg(salary); -- err

select employee_id, first_name, salary, avg(salary) over()
from employees
where salary > (select avg(salary) from employees);

-- department_id = 90인 사원의 업무명
select department_id, job_id
from employees
where department_id = 90; -- 가능하긴 함

select department_id, first_name, job_id
from employees
where job_id in (select job_id
				from employees
                where department_id = 90);
                
-- 부서별로 가장 급여가 적은 사원과 같은 급여를 받는 사원
select first_name, salary, department_id
from employees
where salary in (select min(salary)
				from employees
                group by department_id);
                
-- min salary
select department_id, employee_id, first_name, salary
from employees
where (department_id, salary) in (	select department_id, min(salary)
									from employees
                                    group by department_id );
                                    
-- 특수 query
select employee_id, first_name, phone_number,
	case substr(phone_number, 1, 3) -- like switch-case in Java
		when '515' then 'New York'
        when '590' then 'Washington'
        when '650' then 'Boston'
        else 'etc'
	end as region
from employees;

-- substr((value), (시작 인덱스(DB는 1부터)), (가져올 글자 수))
select substr('hello', 1, 4);
/*
	in Java
	String str = "Hello";
    str.subString(2, 4); -> "ll"
*/                                    

-- over
select department_id, count(*) over() -- 그룹함수지만 over() 붙여주어 사용 가능
from employees;

-- partition by == select절 안의 group by
-- over 안에서 사용
-- 부서별 인원수
select department_id, first_name, salary,
	count(*) over(partition by department_id)
from employees;

/*
	분석함수
    순위함수
    rank()			1 2 3 3 5 6
    dense_rank()	1 2 3 3 4 5
    row_number()	1 2 3 4 5 6
    rownum
*/

select employee_id, first_name, salary,
	rank() over(order by salary desc) as "rank",
    dense_rank() over(order by salary desc) as "dense_rank",
    row_number() over(order by salary desc) as "row_number"
from employees;

select *
from employees
where employee_id between 100 and 109;

-- 전체 중 top 10 출력
select row_number() over(order by salary desc) as "row_num", first_name, salary
from employees
where row_num <= 10 -- 실행순서가 where이 먼저라서 err
order by salary desc;

select row_num, first_name, salary
from (	select row_number() over(order by salary desc) as "row_num", first_name, salary
		from employees
		order by salary desc) as e
where row_num <= 10;















