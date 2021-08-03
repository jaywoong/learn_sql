/* 1. 직원정보를 출력 한다. 직원의 연봉 정보와 연봉의 세금 정보를 같이 출력 한다.
세금은 10% */
SELECT *, salary * 0.1 AS tax FROM emp;

/* 2. 직원정보 중 2001 이전에 입사 하였고 월급이 4000만원 미만인 직원을 조회 */
SELECT * FROM emp
WHERE DATE_FORMAT(hdate, '%Y') < 2001 AND ROUND(salary / 12, 0) < 4000;

/* 3. manager가 있는 직원 중 이름에 '자' 가 들어가 있는 직원정보 조회 */
SELECT * FROM emp
WHERE (manager IS NOT NULL) AND (empname LIKE '%자%');

/* 4. 월급이 2000미만은 '하' 4000미만은 '중' 4000이상은 '고' 를 출력 */
SELECT *,
(CASE WHEN salary / 12 < 2000 THEN '하'
WHEN (salary / 12 >= 2000 AND salary / 12 < 4000) THEN '중'
ELSE '고'
END) AS degree
FROM emp