/* 범위 주석 */
-- 한줄 주석 - Ctrl + / 시 주석 생성
select version(); -- 실행 : Ctrl + Enter.
-- 따로 선택하지 않고 실행 시 해당 라인만 출력

show databases; -- db 검색

create database test; -- db 생성

use test;

create table mytable(
	number float,
    name varchar(10)
);
-- 한 개의 create만 실행한다면 단축키로 실행해도 무방하나
-- 여러 개의 create를 실행한다면 선택 후 위 번개모양 아이콘 클릭해서 실행해야 전부 실행됨