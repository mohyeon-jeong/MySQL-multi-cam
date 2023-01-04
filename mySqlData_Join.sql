use mydb;

/*
	Join
    두개 이상의 테이블을 연결하여 데이터를 검색하는 방법
    목적 : 현재 테이블에서 취득할 수 없는 컬럼의 데이터를 상대 테이블에서 취득하기 위함
    
    기본키(Primary key) - departments table
    외래키(Foreign key) - employees table
    
    Join의 종류
    inner join - 제일 많이 사용
		└ 교집합
    outer join
		left
        right
	self join
    full outer join - 잘 안씀
		└ 합집합
    cross join - 잘 안씀
*/

-- inner join
-- ansi SQL - 어느 DB든 동작 가능한 코드
select e.employee_id, e.first_name,
	e.department_id, d.department_id,
    d.department_name, d.location_id
from employees e inner join departments d
	on e.department_id = d.department_id;
    
-- MySQL, Oracle에서 join은 이렇게 써도 된다고 함
select e.employee_id, e.first_name,
	e.department_id, d.department_id,
    d.department_name
from employees e, departments d
where e.department_id = d.department_id;

select e.employee_id, e.first_name,
	e.job_id, j.job_id,
    j.job_title
from employees e, jobs j
where e.job_id = j.job_id;

-- 3중 Join
-- ansi
select e.employee_id, e.first_name,
	e.department_id, d.department_id,
    e.job_id, j.job_id,
    d.department_name, j.job_title
from mydb.employees e inner join mydb.departments d -- 자동완성 안돼서 mydb 붙였더니 됨
	on e.department_id = d.department_id
		inner join mydb.jobs j
			on e.job_id = j.job_id
where first_name = 'William';

-- MySQL
select e.employee_id, e.first_name,
	e.department_id, d.department_id,
    e.job_id, j.job_id,
    d.department_name, j.job_title
from mydb.employees e, mydb.departments d, mydb.jobs j
where e.department_id = d.department_id
	and e.job_id = j.job_id
    and first_name = 'William';
    
-- left outer
select employee_id, first_name,
	e.department_id, d.department_id,
    d.department_name
-- left outer라서 employees가 기준이 됨
from mydb.employees e left outer join mydb.departments d
	on e.department_id = d.department_id;
    
select employee_id, first_name,
	e.department_id, d.department_id,
    d.department_name
from mydb.employees e left outer join mydb.departments d
	on e.department_id = d.department_id
where e.department_id is null; -- 차집합

-- right
select employee_id, first_name,
	e.department_id, d.department_id,
    d.department_name
-- departments table is main
from mydb.employees e right outer join mydb.departments d
	on e.department_id = d.department_id;
    
select employee_id, first_name,
	e.department_id, d.department_id,
    d.department_name
from mydb.employees e right outer join mydb.departments d
	on e.department_id = d.department_id
where e.department_id is null;

-- self join
select emp.first_name,
	emp.manager_id, mgr.employee_id,
    mgr.first_name
from mydb.employees emp, mydb.employees mgr -- emp : 사원, mgr : 상사(manager)
where emp.manager_id = mgr.employee_id;














