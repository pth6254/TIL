--19 MbyN.sql 

-- 각 학생별 수강 수업 확인
SELECT
	*
FROM students s
INNER JOIN students_courses sc ON s.id = sc.student_id
INNER JOIN courses c ON sc.course_id = c.id

SELECT
	*
FROM courses c
INNER JOIN students_courses sc ON c.id = sc.course_id
INNER JOIN students s ON sc.student_id = s.id
ORDER BY c.name;

SELECT
	s.id,
	s.name,
	COUNT(c.id) AS 수업수,
	STRING_AGG(c.name, ', ') AS 수업명
	CASE
		WHEN sc.grade='A+' THEN 4.3
        WHEN sc.grade = 'A'  THEN 4.0
        WHEN sc.grade = 'A-' THEN 3.7
        WHEN sc.grade = 'B+' THEN 3.3
        WHEN sc.grade = 'B'  THEN 3.0
        WHEN sc.grade = 'B-' THEN 2.7
        ELSE 0
    END AS 평균학점
FROM students s
INNER JOIN students_courses sc ON s.id = sc.student_id
INNER JOIN courses c ON sc.course_id = c.id
GROUP BY s.id, s.name;

-- 과목별 정리
-- 수업ID, 수업이름, 강의실, 수강인원, 수업수강 학생명, 학점평균(4.3만점 기준, 소수점 2자리까지)
SELECT 
	c.id AS 수업ID,
	c.name AS 수업이름,
	CASE
        WHEN sc.grade= 'A+' THEN 4.3
        WHEN sc.grade = 'A'  THEN 4.0
        WHEN sc.grade = 'A-' THEN 3.7
        WHEN sc.grade = 'B+' THEN 3.3
        WHEN sc.grade = 'B'  THEN 3.0
        WHEN sc.grade = 'B-' THEN 2.7
        ELSE 0
    END AS 평균학점
FROM courses c
INNER JOIN students_courses sc ON c.id = sc.course_id
INNER JOIN	students s ON sc.student_id = s.id


