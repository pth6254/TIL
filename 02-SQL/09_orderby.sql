
-- 09_orderby.sql
-- 특정 컬럼 기준 정렬
-- ASC 오름차순 | DESC 내림차순


SELECT * FROM students;

-- 이름 ㄱㄴㄷ 순 정렬
SELECT * FROM students ORDER BY name;
SELECT * FROM students ORDER BY name ASC; --기본값
SELECT * FROM studnets ORDER BY name DESC; -- 내림차순

-- 테이블 컬럼 추가 및 데이터 수정
SELECT * FROM students ORDER BY id DESC;
ALTER TABLE students ADD COLUMN grade VARCHAR(1) DEFAULT 'B';
-- 컬럼 안에 있는 값 수정
UPDATE students SET grade = 'A' WHERE id BETWEEN 1 AND 7;
UPDATE students SET grade = 'C' WHERE id BETWEEN 10 AND 13;

SELECT * FROM students ORDER BY id;

-- 다중 컬럼 정렬

-- 같은 성적끼리 나이 줄세우기
SELECT * FROM students ORDER BY age ASC, grade DESC;
-- 같은 나이끼리 성적 줄세우기
SELECT * FROM students ORDER BY age DESC, grade ASC;

SELECT * FROM students ORDER BY id LIMIT 5;

-- 나이가 40 미만인 학생들 중에서 학점 가장 높은 사람들 중에서 - 나이많은순으로 상위 5명 뽑기
SELECT * FROM students WHERE age < 40 AND grade = 'A' ORDER BY age DESC LIMIT 5; 
-- 이 중에서 조건에 해당된 사람들의 이름 확인
SELECT name FROM students WHERE age < 40 AND grade = 'A' ORDER BY age DESC LIMIT 5;