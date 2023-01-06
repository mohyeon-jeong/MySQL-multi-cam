use mydb;

/*
	무결성(constraint) : column을 지정하는 성질(설정)
    
    primary key : 기본 키. null(빈칸), 중복 허용 x. ex) id, 주민번호
    unique key : 고유 키. null 허용. 중복 허용 x. ex) email
    foreign key : 외래 키. null 허용. join 목적으로 쓰는 경우 많음
				  외래 키로 지정된 column은 연결된 테이블에서 기본 키(고유 키)인 경우가 많음
    check : null 허용. 설정된 값(범위, 정해진 값)만을 사용할 수 있음
    not null : null 허용 x
*/

-- not null
create table tb_test8 (
	col1 varchar(30) not null,
    col2 varchar(20)
);

insert into tb_test8(col1, col2)
values('aaa', 'Aaa');

insert into tb_test8(col1)
values('bbb');

insert into tb_test8(col2) -- col1 == null err
values('ccc');

select * from tb_test8;

-- 무결성 조건까지 모두 삭제
drop table if exists tb_test8;

-- check
create table tb_check(
	col1 varchar(10),
    col2 varchar(20),
    constraint chk_1 check(col1 in('apple', 'pear', 'banana')),
    constraint chk_2 check(col2 between 1 and 100)
);

insert into tb_check(col1, col2)
values('apple', 1);

insert into tb_check(col1) -- col2 can be null
values('banana');

insert into tb_check(col2)
values(100);

insert into tb_check(col1)
values('grape'); -- err. should be apple / pear / banana

select * from tb_check;

-- primary key
create table tb_test8 (
	pk_col varchar(10) primary key,
    col1 varchar(20)
);

insert into tb_test8(pk_col, col1)
values('AAA', 'aaa'); -- 두번 실행하면 pk_col 중복되기 때문에 err

insert into tb_test8(pk_col)
values('BBB');

insert into tb_test8(col1)
values('aaa'); -- pk_col can't be null

select * from tb_test8;

drop table tb_test8;

-- primary key를 지정하는 여러가지 방법
create table tb_test8 (
	pk_col1 varchar(10) primary key,
    pk_col2 varchar(20) primary key -- err
);

create table tb_test8 (
	pk_col varchar(10),
    col1 varchar(20),
    primary key(pk_col, col1) -- no err
);

create table tb_test8 (
	pk_col varchar(10),
    col1 varchar(20)
);

alter table tb_test8
add primary key(pk_col);

-- delete primary key
alter table tb_test8
drop primary key; -- 여러개여도 전부 해제

-- unique key
create table tb_test9 (
	uk_col varchar(10) unique,
    col1 varchar(20)
);

insert into tb_test9(uk_col, col1)
values('AAA', 'aaa'); -- 두번 실행 시 err

insert into tb_test9(col1)
values('bbb');

select * from tb_test9;

-- foreign key
-- 목적 : 테이블간의 연결
-- parent table : dept, child table : emp
create table dept(
	department_id int primary key,
    department_name varchar(20),
    location_id int
);

insert into dept(department_id, department_name, location_id)
values(100, '기획부', 1000);

insert into dept(department_id, department_name, location_id)
values(200, '경리부', 1100);

insert into dept(department_id, department_name, location_id)
values(300, '개발부', 1200);

select * from dept;

create table emp(
	employee_id int primary key,
    first_name varchar(20) not null,
    department_id int,
    foreign key(department_id) references dept(department_id)
);

insert into emp(employee_id, first_name, department_id)
values(10, 'tom', 200); -- department_id는 위 dept table의 dep_id중 하나 이거나 null이어야 함

insert into emp(employee_id, first_name, department_id)
values(20, 'paul', 100);

insert into emp(employee_id, first_name, department_id)
values(30, 'alex', 400); -- err

insert into emp(employee_id, first_name, department_id)
values(30, 'alex', null);

select * from emp;





























