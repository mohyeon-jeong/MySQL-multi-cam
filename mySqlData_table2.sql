use mydb;

create table tb_test4
as
select job_id as 업무아이디, job_title as 업무명
from jobs;

create table tb_test5
as
select department_id as dnum, sum(salary) as sum, avg(salary) as 'avg'
from employees
group by department_id;

select *
from tb_test5
where dnum = 10;

select first_name, salary, t5.sum, t5.avg
from employees e, tb_test5 t5
where employee_id = 101
	and t5.dnum = 90;
    
-- 테이블 수정
select *
from tb_test4;

-- 테이블명 수정
alter table tb_test4
rename to tb_test99;

-- add column
alter table tb_test99
add
newcolname varchar(30);

alter table tb_test99
add
(colnew2 decimal(3, 1), colnew3 date);

-- update column type
alter table tb_test99
modify
colnew2 varchar(20);

-- delete column
alter table tb_test99
drop column colnew3;

-- table copy without data
create table tb_test6
as
select *
from employees
where 1 = 2;

select * from tb_test6;

create table tb_test7
as
select employee_id as empno, first_name as name, salary as sal,
	department_name as dname, job_title as jname
from employees e, departments d, jobs j
where 1 = 2;

select * from tb_test7;

create table tb_test
as
select e.department_id, department_name, e.manager_id, l.location_id
from employees e, departments d, locations l
where 1 = 2;

-- insert
insert into tb_test(department_id, department_name, manager_id, location_id)
values(300, 'asdf', 100, 200);

insert into tb_test(department_id, department_name)
values(301, 'dasf');

insert into tb_test
values(302, 'dag', 101, 1500);

-- 유의
insert into tb_test
values('303', 'dig', '234', '1312'); -- no err
-- 이렇게 잘못된 값을 insert할 수도 있으니 insert into() 하여 column명을 확실히 명시해주는게 좋음

select * from tb_test;

-- delete
-- 워크벤치에서 update, delete 할 땐 아래 set 써줘야함
set sql_safe_updates = 0;

delete from tb_test
where department_name = 'dig';

delete from tb_test
where manager_id is null;

select * from tb_test;

-- update
update tb_test
set department_name = 'geeg'
where department_id = 300;

update tb_test
set manager_id = 104, location_id = 1400
where department_id = 302;

select * from tb_test;

-- 자동으로 값 증가 == sequence
create table tb_test (
	seq int auto_increment primary key,
    name varchar(50),
    height decimal(4, 1)
);

insert into tb_test(name, height)
values('hong', 171.1);

insert into tb_test(name, height)
values('lee', 160.2);

select * from tb_test;
































