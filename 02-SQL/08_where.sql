--08_where.sql

-- id PK
-- name 글자 10
-- age 정수


CREATE TABLE students(
	id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	name VARCHAR(10),
	age INT
);

INSERT INTO students (name, age) 
VALUES ('정 민수', 50),
('서 지훈', 30),
('윤 하늘', 20),
('최 도윤', 25),
('강 수빈', 33),
('문 태오', 18),
('백 현우', 45),
('한 유진', 10),
('임 주원', 88),
('송 민재', 67);


SELECT * FROM students;

DROP TABLE students;

-- 조건문
SELECT * FROM students WHERE name='송 민재';
-- 다름
SELECT * FROM students WHERE id != 1;
-- 이상
SELECT * FROM students WHERE age >= 20;
-- 초과
SELECT * FROM students WHERE age > 20;
-- 범위(이상-이하)
SELECT * FROM students WHERE age BETWEEN 20 AND 40;
-- 다중 선택
SELECT * FROM students WHERE id=1 OR age=30 OR id=5;
SELECT * FROM students WHERE id IN (1, 3, 5);

-- 문자열 패턴 찾기 LIKE (% -> 있을 수도 없을 수도, _ -> 개수만큼 있다)
-- 최씨 찾기
SELECT * FROM students WHERE name LIKE '최%';
-- 이름에 '민' 글자가 있으면 모두
SELECT * FROM students WHERE name LIKE '%민%';
-- 이름이 '훈' 으로 끝나는 사람 모두
SELECT * FROM students WHERE name LIKE '%훈';

-- '박 ' 이후에 글자가 3개 있어야 한다.
SELECT * FROM students WHERE name LIKE '박 ___';