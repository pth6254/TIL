-- 02-CREATE-TABLE.SQL

-- 테이블 생성
CREATE TABLE sample (
	name VARCHAR(30), -- 30글자 이하 (character)
	age INT           -- 정수 (intgeger)  
);

-- 테이블 삭제
DROP TABLE sample;

-- members 테이블
CREATE TABLE members (
	-- 자동으로 1씩 올라가고, 해당 테이블의 PK
	ID 			INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	-- 비어있지 않게 (null)
	NAME 		VARCHAR (30) NOT NULL,
	-- 중복 허용하지 않게
	EMAIL 		VARCHAR (100) UNIQUE,
	-- 기본값 20
	AGE 		INT DEFAULT 20,
	-- 자동으로 오늘 날짜
	JOIN_DATE 	DATE DEFAULT CURRENT_DATE
);

DROP TABLE members;
