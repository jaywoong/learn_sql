/* 1. 2000 년 이후 입사 한 사원들의 정보르 출력. 사번, 이름, 타이틀, 부서, 지역 */
SELECT e.empno, e.empname, t.titlename, d.deptname, d.deptloc
FROM emp e
INNER JOIN title t ON e.titleno = t.titleno
INNER JOIN dept d ON e.deptno = d.deptno
WHERE DATE_FORMAT(e.hdate, '%Y') > 2000;
​

/* 2. 부서 이름 별 월급의 평균을 구하시오. 단, 평균이 3000 이상인 부서만 출력 */
SELECT e.empno, e.empname, d.deptname, AVG(e.salary) as avg_salary
FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
GROUP BY d.deptname
HAVING avg_salary >= 3000;
​

/* 3. 경기 지역의 직원 들의 평균 연봉을 구하시오 */
SELECT e.empno, e.empname, d.deptloc, AVG(e.salary) AS avg_salary
FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
WHERE d.deptloc = '경기'
​

/* 4. 홍영자 직원와 같은 부서 직원들의 근무 월수를 구하시오 */
SELECT *, TIMESTAMPDIFF(MONTH, hdate, NOW()) as diff_mon
FROM emp
WHERE deptno = (SELECT deptno FROM emp WHERE empname = '홍영자')
​

/* 5. 입사 년수가 가장 많은 직원 순으로 정렬 하여 순위를 정한다. 이름, 부서명, 직위, 년수 */
SELECT e.empname, d.deptname, t.titlename,
TIMESTAMPDIFF(YEAR, e.hdate, NOW()) as diff_year,
RANK() OVER(ORDER BY TIMESTAMPDIFF(YEAR, e.hdate, NOW()) DESC) AS rank
FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno
INNER JOIN title t ON e.titleno = t.titleno
ORDER BY rank