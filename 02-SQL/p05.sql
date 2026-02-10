-- p05.sql 

-- 1. 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 정렬
SELECT 
	c.customer_name AS 고객명,
	s.product_name AS 상품명,
	s.total_amount AS 주문금액
FROM customers c 
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC LIMIT 10;

-- 2. 구매이력이 있는 고객만 등급별 [고객등급, 주문건수, 평균주문금액] 로 평균주문금액 높은순으로 정렬
SELECT
	c.customer_type AS 고객등급,
	COUNT(s.id) AS 주문건수,
	ROUND(AVG(s.total_amount),0) AS 평균주문금액
FROM customers c 
INNER JOIN sales s ON  s.customer_id = c.customer_id
GROUP BY c.customer_type, s.total_amount
ORDER BY s.total_amount DESC;

-- 3. 모든 고객의 이름과 구매한 상품명 조회 
	-- 만약 구매 이력이 없는 고객의 경우 '없음'으로 표시
SELECT 
	c.customer_name AS 고객명,
	COALESCE(s.product_name, '없음') AS 구매상품명
FROM customers c 
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 4. 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT * FROM customers c
LEFT JOIN sales s ON s.customer_id = c.customer_id
ORDER BY c.customer_id;

-- 5. VIP 고객들의 구매 내역만 조회
SELECT * 
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
WHERE c.customer_type = 'VIP';

-- 건당 50만원 이상 주문한 기업 고객들과 주문내역
SELECT * 
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
WHERE c.customer_type = '기업' AND s.total_amount >= 500000;

-- 6. 2024년 하반기 전자제품 구매 2024년 7월~12월 사이에 카테고리가 '전자제품' 인 주문 내역만 조회하시오.
SELECT * 
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id
WHERE s.category = '전자제품' AND (s.order_date BETWEEN '2024-07-01' AND '2024-12-31');

-- 7.고객별 구매 요약 (구매한 고객만)
	-- 구매 이력이 있는 고객을 대상으로 고객별 고객명, 등급, 주문횟수, 총구매금액, 평균구매금액, 최근주문일을 계산하고 평균구매금액이 높은 순으로 정렬하시오. 
SELECT 
	c.customer_name AS 고객명,
	c.customer_type AS 고객등급,
	COALESCE(COUNT(s.id),0) AS 주문횟수,
	COALESCE(SUM(s.total_amount),0) AS 총구매액,
	COALESCE(ROUND(AVG(s.total_amount),0),0) AS 평균구매액,
	COALESCE(TO_CHAR(MAX(s.order_date), 'YYYY-MM-DD'), '주문없음') AS 최근주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_name, c.customer_type;

-- 8. 모든 고객 구매 통계 (주문 없는 고객 포함)
	-- 모든 고객에 대해 주문횟수, 총구매금액, 평균구매금액, 최대구매금액을 계산하시오. (구매가 없는 경우 0으로 처리하시오.)

SELECT 
	c.customer_name AS 고객명,
	c.customer_type AS 고객등급,
	COALESCE(COUNT(s.id),0) AS 주문횟수,
	COALESCE(SUM(s.total_amount),0) AS 총구매액,
	COALESCE(ROUND(AVG(s.total_amount),0),0) AS 평균구매액,
	COALESCE(TO_CHAR(MAX(s.order_date), 'YYYY-MM-DD'), '주문없음') AS 최근주문일
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_name, c.customer_type
ORDER BY c.customer_type, c.customer_name;

-- 9. 고객 유형 × 상품 카테고리 분석
	-- 고객 유형과 상품 카테고리별로 주문건수와 총매출액을 분석하시오.
SELECT 
	c.customer_type AS 고객유형,
	s.category AS 상품카테고리,
	COUNT(s.id) AS 주문건수,
	SUM(s.total_amount) AS 총매출액
FROM sales s
INNER JOIN customers c ON c.customer_id = s.customer_id
GROUP BY c.customer_type, s.category
ORDER BY c.customer_type, s.category;

-- 10. 고객 등급 분류 (활동 + 구매)
	-- 각 고객을 대상으로 구매횟수와 총구매금액을 기준으로 활동등급과 구매등급을 분류
	-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
	-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]
SELECT 
	c.customer_name AS 고객명,
	COUNT(s.id) AS 구매횟수,
	SUM(s.total_amount) AS 총구매액,
	CASE 
		WHEN COUNT(s.id) = 0 THEN '잠재고객'
		WHEN COUNT(s.id) BETWEEN 0 AND 3 THEN '브론즈'
		WHEN COUNT(s.id) BETWEEN 3 AND 5 THEN '실버'
		WHEN COUNT(s.id) BETWEEN 5 AND 10 THEN '골드'
		ELSE '플래티넘'
	END AS 활동등급,
	CASE
		WHEN SUM(s.total_amount) = 0 THEN '잠재고객'
		WHEN SUM(s.total_amount) BETWEEN 0 AND 100000 THEN '일반'
		WHEN SUM(s.total_amount) BETWEEN 100000 AND 200000 THEN '우수'
		WHEN SUM(s.total_amount) BETWEEN 200000 AND 500000 THEN '최우수'
		ELSE '로얄'
	END AS 구매등급
FROM sales s
INNER JOIN customers c ON c.customer_id = s.customer_id
GROUP BY c.customer_name
ORDER BY c.customer_name;