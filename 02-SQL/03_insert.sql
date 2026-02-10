-- 03_insert.sql

INSERT INTO members (NAME, EMAIL, AGE)
VALUES ('박태현', 'my@email.com', 30);

INSERT INTO members (EMAIL) VALUES ('a@a.com');

INSERT INTO members (NAME) VALUES ('이재명');

INSERT INTO members (NAME, EMAIL) VALUES ('이재용', 'lee@lee.com'), ('최태원', 'choi@choi.com');

SELECT * FROM members;
