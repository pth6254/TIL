-- 15_subquery.sql 
-- 평균보다 더 높은 금액을 주문한 판매 데이터(*)
SELECT AVG(total_amount) FROM sales;
SELECT * FROM sales WHERE total_amount >= 612862;

-- 특정 값을 매번 계산해서 잘 가져옴
-- subquery -> 쿼리 안에 쿼리
SELECT * FROM sales WHERE total_amount >= (SELECT AVG(total_amount) FROM sales);

SELECT    
	product_name AS 이름,
	total_amount AS 판매액
FROM sales
WHERE total_amount >= (SELECT AVG(total_amount) FROM sales);

-- sales에서 [가장 비싼 total_amount]를 가진 데이터
SELECT * FROM sales WHERE total_amount = (SELECT MAX(total_amount) FROM sales);

-- 가장 [주문 금액 평균]과 실제 주문액수의 차이가 가장 적은 5개 데이터
SELECT
	id,
	order_date,
	total_amount,
	ABS((SELECT AVG(total_amount) FROM sales) - total_amount) AS 평균차이
FROM sales
ORDER BY 평균차이
LIMIT 5;