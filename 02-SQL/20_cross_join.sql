
-- 20_cross_join.sql 

SELECT * FROM students;
SELECT * FROM courses;

-- CROSS JOIN -> students와 courses 의 모든 조합을 보여줌
-- 카르테시안 곱 연산
SELECT
	* 
FROM students s 
CROSS JOIN courses c 
WHERE NOT EXISTS(
	SELECT 1
	FROM students_courses sc 
	WHERE sc.student_id=s.id 
	AND sc.course_id=c.id
);