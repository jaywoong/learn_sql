/*
1. 사원정보를 조회하시오

2000년 이후 입사자 중 김씨 성을 가진 직원을 조회 하시오

연봉이 낮은 순으로 정렬 하시오

​

2. 월급이 150이상인 직원들 중에 이씨이또는 홍씨인 직원을 조회 하시오

월급이 높은 순으로 정렬 하시오 

​

3. 사원정보를 조회 하고자 한다.

출력 내용은 사번, 이름, 부서번호, 연봉, 세금, 세후연봉 을 출력 한다.

empno, enpname,deptno, salary, tax, atsalary

세금은 연봉에 8.9% 이다.

입사년과 salary를 기준으로 많은 순으로 정렬 하시오

​

4. 사원정보를 조회 하고자 한다.

월급이 150에서 250사이의 직원들을 모든 정보를 조회 하시오

empno, enpname,deptno, salary, msalary, hmonth

단, 1월에 입사한 직원들만 조회 한다.
*/

#1
SELECT empno, empname, deptno, salary, DATE_FORMAT(hdate, '%Y') AS hyear FROM emp
WHERE DATE_FORMAT(hdate, '%Y') >= '2000' AND empname LIKE '김%'
ORDER BY salary DESC;

#2
SELECT empno, empname, deptno, salary, ROUND(salary/12,0) AS msalary FROM emp
WHERE (ROUND(salary/12,0) >= 150) AND (empname LIKE '이%' OR empname LIKE '홍%')
ORDER BY msalary ASC;

#3
SELECT empno, empname, deptno, salary, (salary * 0.089) AS tax, salary * (1 - 0.089) AS atsalary FROM emp
ORDER BY DATE_FORMAT(hdate, '%Y'), salary ASC;
​
#4
SELECT empno, empname, deptno, salary, ROUND(salary/12,0) AS msalary, DATE_FORMAT(hdate, '%M') AS hmonth FROM emp
WHERE (ROUND(salary/12,0) BETWEEN 150 AND 250) AND DATE_FORMAT(hdate, '%M') = 'January';