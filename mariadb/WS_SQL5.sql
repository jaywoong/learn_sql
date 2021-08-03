/*
1. 입사 년도별 직원들의 연봉의 평균을 출력 하시오

단 연봉 평균이 3000이상인 정보만 출력 하시오

year, avg_salary


2. 부사별 입사 년도별 직원들의 연봉의 평균을 출력 하시오
*/

-- 1
SELECT DATE_FORMAT(hdate,'%Y') AS YEAR,
ROUND(AVG(salary),1) AS avg_salary
FROM emp
GROUP BY DATE_FORMAT(hdate,'%Y')
HAVING ROUND(AVG(salary),1) >= 3000
-- 2.
SELECT deptno,DATE_FORMAT(hdate,'%Y') AS YEAR,
ROUND(AVG(salary),1) AS avg_salary
FROM emp
GROUP BY deptno,DATE_FORMAT(hdate,'%Y')