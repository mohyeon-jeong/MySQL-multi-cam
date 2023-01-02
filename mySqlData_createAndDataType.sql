use mydb;

/*
	Ctrl + L : 해당 라인 잘라내기(삭제 아님)
    Ctrl + Space : 자동 완성(자동완성 자동 출력 옵션 OFF 시)
    
	SQL : Structured Query Language. 구조적 질의어
    
    can CRUD
    insert, delete, select, update
					└ 90%
                    
	employees : 사원
    departments : 부서
    jobs : 업무
*/

select * from employees;

SELECT * FROM EMPLOYEES; -- 대문자 가능 but 소문자로 많이 씀

select employee_id, first_name, salary
from employees; -- 여러 개 select 시 이렇게 쓴다는 듯

desc employees; -- desc : column information

-- 테이블 정보 조회
select *
from information_schema.tables
where table_schema='mydb';

select COLUMN_NAME
from information_schema.columns
where table_schema='mydb'
and
table_name='employees';

/*
	data type
    
    java		MySQL
    int			int, decimal((byte)) ex) decimal(5)
    double		double, decimal((byte), (나타낼 소숫점 아래 자릿수)) ex) decimal(5, 1)
    String		varchar((byte)) - 영어 : 1byte, 한글 : 3byte. ex) varchar(10) : 10 byte
    Date		date

	테이블 만들기
	create table (테이블명)(
   		(컬럼명1) (자료형),
		(컬럼명2) (자료형),
        .
        .
        (컬럼명n) (자료형)
	);
*/

-- varchar (== String)
create table tb_varchar(
	col1 varchar(10), -- 10 byte
    col2 varchar(20)
);

select * from tb_varchar;

-- 입력
insert into tb_varchar(col1, col2)
values('abc', 'ABC'); -- varchar의 value 입력 시 "" 이 아닌 ''

-- int, double
create table tb_decimal(
	col1 decimal,
    col2 decimal(5),
    col3 decimal(5, 2)
);

insert into tb_decimal(col1, col2, col3)
values(1123.1123, 12432.12, 123.345);

select * from tb_decimal; -- 1123, 12432(5 bytes), 123.35(5 bytes, 2)

-- date
create table tb_date(
	col1 date,
    col2 date
);

insert into tb_date(col1, col2)
values(now(), '2022-12-25'); -- now() : 오늘 년-월-일

select * from tb_date;

create table board(
	col1 timestamp,
    col2 timestamp default now()
);

insert into board(col1, col2)
values(now(), default); -- timestamp일 때, now() : 오늘 년-월-일 시:분:초. default는 ??

select * from board;

-- 테이블 삭제
drop table tb_varchar;
drop table tb_decimal;
drop table tb_date;
drop table board;















