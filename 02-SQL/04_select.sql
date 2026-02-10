-- 04_select.sql

-- * -> 모든 컬럼
SELECT * FROM members;

-- 컬럼 지정
SELECT NAME, EMAIL FROM members;

-- 조건 지정
SELECT * FROM members WHERE ID=1;

SELECT * FROM members WHERE AGE=20;

SELECT NAME, AGE FROM members WHERE AGE=20;

