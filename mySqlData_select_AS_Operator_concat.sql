use mydb;

/*
	select : 검색
    
    기본형
    select (값 or 컬럼명 or 함수 or sub query)
    from (테이블명 or sub query);
*/

-- 참고
select 1 from dual; -- dual : 임시 테이블. 값 확인용
select '한글' from dual;

-- 특정 테이블에 대해 모든 데이터를 취득
select *
from employees;

select *
from departments;

-- columns
select employee_id, last_name, hire_date
from employees;

select '이름', employee_id, last_name, hire_date
from employees;

-- 컬럼 별명 (alias)
-- (column) AS "(value)" - 큰따옴표 주의, as 생략 가능(붙여주는게 좋다고 함), value에 공백이 없다면 따옴표 생략 가능
select employee_id as "사원 번호", last_name as "성", salary 월급
from employees;

-- 연산자(+, -, *, /)
select first_name, last_name, salary * 12 as 연봉
from employees;

-- 문자열 합치기
select concat('이름 : ', last_name, ' ', first_name) as 이름
from employees;










