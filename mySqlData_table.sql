use mydb;

/*
	Table : column, row로 구성되어 있음
			data를 담을 수 있는 틀
            
	String : varchar((byte))
    int, float : decimal((자릿수), (소숫점))
    Date : date, timestamp
    
    object(table, view) : create, drop(삭제), alter(수정)
    
    data : insert, delete, select, update
*/

create table tb_test1 (
	col1 varchar(10),
    col2 varchar(20),
    col3 varchar(20)
);

drop table tb_test1;

create table tb_test2 (
	userid int,
    username varchar(30),
    height decimal(3, 1)
);

-- table copy
create table tb_test3
as
select * from jobs;

select * from tb_test3;

update tb_test3
set max_salary = 10000
where job_id = 'AC_ACCOUNT';

drop table tb_test3;

-- table copy without data
create table if not exists tb_test3
like mydb.jobs;

select * from mydb.tb_test3;















