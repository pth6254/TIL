-- 17_join.sql 

SELECT * FROM sales;
SELECT * FROM customers;

SELECT *, 
	(SELECT customer_name FROM customers WHERE customers.customer_id = sales.customer_id)
FROM sales;

SELECT
	(SELECT customer_name FROM customers c
	WHERE c.customer_id=s.customer_id) AS 고객명,
	(SELECT customer_type FROM customers c
	WHERE c.customer_id=s.customer_id) AS 고객등급,
	*
FROM sales s;

-- INNER JOIN 교집합 -> 왼쪽 (c)와 오른쪽 (s)를 만족하는 교집합 데이터
SELECT 
	*
FROM customers c
INNER JOIN sales s ON c.customer_id=s.customer_id;

-- LEFT JOIN -> 왼쪽 (c)의 모든데이터 + (있을 경우) 매칭되는 오른쪽 데이터
SELECT 
	*
FROM customers c
LEFT JOIN sales s ON c.customer_id=s.customer_id
-- WHERE s.id IS NULL; -> 구매한 적 없는 사람만 확인

-- UNION -> 상하결합
SELECT 
	'1. INNER JOIN' AS 구분,
	COUNT(*) AS 줄수,
	COUNT(DISTINCT c.customer_id) AS 고객수
FROM customers c
INNER JOIN sales s ON c.customer_id=s.customer_id
UNION
SELECT 
	'2. LEFT JOIN' AS 구분,
	COUNT(*) AS 줄수,
	COUNT(DISTINCT c.customer_id) AS 고객수
FROM customers c
LEFT JOIN sales s ON c.customer_id=s.customer_id