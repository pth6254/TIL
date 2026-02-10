

-- 16_subquery2.sql
/*
Scala  			-> 데이터 1개 | 14.56
Vector 			-> 데이터 1줄 | (1,2,3,4)
Matrix/Tensor 	-> 행*열
*/

-- Scala
SELECT AVG(total_amount) FROM sales;
-- Vector
SELECT DISTINCT region FROM sales;

-- VIP들의 주문내역만 확인
SELECT * FROM customers WHERE customer_type='VIP';
-- 식품 결제 내역 고르기
SELECT * FROM sales WHERE customer_id IN ('C001', 'C005', 'C010');
SELECT * FROM sales WHERE customer_id IN (SELECT customer_id FROM customers WHERE customer_type='VIP');

-- [전자 제품을 구매한 고객들의 customer_id] 모든 주문
SELECT * FROM sales -- customer_id
WHERE customer_id IN (SELECT customer_id FROM sales WHERE category = '전자제품' );