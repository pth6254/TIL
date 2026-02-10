
-- p01.sql

--> 데이터베이스 생성
CREATE DATABASE practice;

--> 테이블 생성
CREATE TABLE userinfo(
	id	INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nickname VARCHAR(20) NOT NULL,
	phone VARCHAR(20) UNIQUE,
	reg_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO userinfo (nickname, phone) VALUES ('alice', '01012345678'), ('bob', '0104561234'), 
('charlie', '01112345678'),('david','01874562131'), ('eric','01054687913');

SELECT * FROM userinfo;

SELECT * FROM userinfo WHERE id=3;

SELECT * FROM userinfo WHERE nickname='bob'

UPDATE userinfo SET phone='01099998888' WHERE id=2

SELECT * FROM userinfo;

DELETE FROM userinfo WHERE id=2;