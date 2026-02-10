-- _update.sql

-- 데이터 추가 (name='익명')

INSERT INTO members (NAME) VALUES ('익명');
SELECT * FROM members;

--데이터 수정
UPDATE members SET NAME='홍길동' WHERE NAME='익명';

UPDATE members
SET email='hong@gil', age=25
WHERE id=9;

