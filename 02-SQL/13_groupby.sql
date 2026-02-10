-- 13_groupby.sql 

SELECT * FROM sales;

SELECT * FROM sales WHERE region = ' 서울' OR category = '식품';

SELECT region, category, COUNT(id) AS 매출건수, ROUND(AVG(total_amount),2) AS 평균매출 FROM sales 
GROUP BY region, category ORDER BY 평균매출 DESC LIMIT 3;

-- 카테고리별 분석
-- 카테고리별 주문건수, 총매출, 평균매출 -> 총매출 내림차순
SELECT 
	category AS 카테고리, 
	COUNT(id) AS 주문건수, 
	SUM(total_amount) AS 총매출, 
	ROUND(AVG(total_amount),0) AS 평균매출 
FROM sales 
	GROUP BY 카테고리 ORDER BY 총매출 DESC;

-- 지역별 분석
-- 지역별 주문건수, 총매출, 고객수, 고객당주문수, 고객당평균매출
SELECT 
	region AS 지역, 
	COUNT(id) AS 주문건수, 
	SUM(total_amount) AS 총매출, 
	COUNT(DISTINCT customer_id) AS 고객수, 
	-- 정수 / 정수 -> 정수 BUT 실수 / 정수 -> 실수 그래서 두 개 중에 하나만 실수로 변경해주면됨
	COUNT(id)::FLOAT / COUNT(DISTINCT customer_id) AS 고객당주문수,
	SUM(total_amount) / COUNT(DISTINCT customer_id) AS 고객당평균매출
FROM sales
GROUP BY 지역;

-- 영업사원별-지역별 성과
-- 영업사원, 지역, 주문건수, 총매출액
SELECT 
	sales_rep AS 영업사원,
	region AS 지역,
	COUNT(id) AS 주문건수,
	SUM(total_amount) AS 총매출액
FROM sales
GROUP BY DISTINCT 영업사원, 지역
ORDER BY 영업사원;

-- 영업사원별-월별매출 
-- 월, 사원, 주문건수, 월매출액, 평균매출액
-- 월, 월매출액 순으로 정렬
SELECT 
	sales_rep AS 영업사원,
	TO_CHAR(order_date, 'YYYY-MM') AS 월,
	COUNT(id) AS 주문건수,
	SUM(total_amount) AS 월매출액,
	AVG(total_amount) AS 평균매출액
FROM sales
GROUP BY 
	sales_rep,
	TO_CHAR(order_date, 'YYYY-MM')
ORDER BY
	TO_CHAR(order_date, 'YYYY-MM'),
	월매출액;

-- MAU(Monthly Active User) -> 월간활성고객
-- 월, 주문건수, 월매출액, MAXVALUE
SELECT 
	TO_CHAR(order_date, 'YYYY-MM') AS 월,
	COUNT(id) AS 주문건수,
	SUM(total_amount) AS 월매출액,
	COUNT(DISTINCT CASE WHEN quantity > 0 THEN customer_id END) AS 월간활성고객
FROM sales
GROUP BY 월
ORDER BY 월, 월매출액 DESC;
-- 요일별 매출 패턴 (날짜->요일 함수?)
-- 요일, 주문건수, 총매출, 평균매출
SELECT 
	TO_CHAR(order_date, 'Day') AS 요일,
	EXTRACT(DOW FROM order_date) AS 요일번호,
	COUNT(id) AS 주문건수,
	SUM(total_amount) AS 월매출액,
	AVG(total_amount) AS 평균매출
FROM sales
GROUP BY 요일, 요일번호
ORDER BY 요일번호;