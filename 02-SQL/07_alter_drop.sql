

-- 07_alter_drop.sql

SELECT * FROM members;

-- 컬럼 추가
ALTER TABLE members 
ADD COLUMN address VARCHAR(100) NOT NULL DEFAULT '';

-- 컬럼 수정 (이름)
ALTER TABLE members
RENAME COLUMN address TO juso;

-- 컬럼 수정 (데이터타입)
ALTER TABLE members
ALTER COLUMN juso TYPE VARCHAR(50);

ALTER TABLE members
ALTER COLUMN age SET DEFAULT 10;
-- 디폴트값 삭제시 DROP DEFAULT

-- 컬럼 삭제
ALTER TABLE members
DROP COLUMN address;