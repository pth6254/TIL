-- 06-delete.sql

SELECT * FROM members;

-- 테이블에서 특정 데이터 삭제
DELETE FROM members WHERE ID='최태원';
-- 테이블의 데이터 모두 삭제
DELETE FROM members;