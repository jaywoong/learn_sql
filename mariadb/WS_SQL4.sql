/* 5. 부서 별 월급의 평균을 구하시오. 단, 평균이 3000 이상인 부서만 출력 */
SELECT *, AVG(salary / 12) AS avg_salary FROM emp
GROUP BY deptno
HAVING avg_salary >= 300;

/* 6. 부서 별 대리와 사원 연봉의 평균을 구하시오. 단, 평균이 2500 이상인 부서만 출력*/
SELECT emp.*, title.titlename, AVG(emp.salary) as avg_salary FROM emp LEFT JOIN title
ON emp.titleno = title.titleno
WHERE title.titlename = '대리' or title.titlename = '사원'
GROUP BY title.titlename
HAVING AVG(emp.salary) >= 2500;


/* ​7. 2000년 부터 2002년에 입사는 직원들의 월급의 평균을 구하시오 */
SELECT *, AVG(salary / 12) AS avg_salary FROM emp
WHERE DATE_FORMAT(hdate, '%Y') BETWEEN 2000 AND 2002

/* 8. 부서 별 월급의 합의 ranking을 1위부터 조회 하시오 */
SELECT *, SUM(salary / 12) AS sum_salary FROM emp
GROUP BY deptno
ORDER BY sum_salary DESC

/* 9. 서울에서 근무하는 직원들을 조회 하시오 */
SELECT emp.*, dept.deptname, dept.deptloc FROM emp LEFT JOIN dept
ON emp.deptno = dept.deptno
WHERE dept.deptloc = '서울';

/* 10. 이영자가 속한 부서의 직원들을 조회 하시오*/
SELECT * FROM emp
WHERE deptno IN (SELECT deptno FROM emp WHERE empname = '이영자');

/* 11. 김강국의 타이틀과 같은 직원들을 조회 하시오*/
SELECT * FROM emp
WHERE titleno IN (SELECT titleno FROM emp WHERE empname = '김강국');