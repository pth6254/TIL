SELECT * from sales;

-- COUNT 
SELECT
	COUNT(*) AS 매출건수
FROM sales;

SELECT
	COUNT(*) AS 총주문건수,
	COUNT(DISTINCT customer_id) AS 고객수,
	COUNT(DISTINCT product_name) AS 상품수
FROM sales;

-- SUM
