/*
	CRUD
	READ : SELECT
*/

SELECT * FROM EMP;
SELECT empno, empname, salary FROM emp;
SELECT empno as no, empname as name, salary FROM emp;
SELECT  empno , salary, round(salary/12,2) as msalary FROM emp

SELECT empname, hdate FROM emp;
SELECT empno, STR_TO_DATE(hdate, '%Y') FROM emp;

/*
	SELECT 조건
*/


SELECT * FROM emp WHERE salary > 3000 AND salary < 4000;
SELECT * FROM emp WHERE salary between 3000 AND 4000;
SELECT * FROM emp WHERE empname = '이말숙';
SELECT * FROM emp WHERE deptno in ('10','20'); 
SELECT * FROM emp WHERE empname like '이%';
SELECT * FROM emp WHERE empname like '%자%';
SELECT * FROM emp WHERE empname like '__자%';

SELECT * FROM emp 
WHERE hdate > '2000-01-01'
AND (empname like '김%' OR empname like '홍%')
ORDER BY salary

SELECT empname, DATE_FORMAT(hdate,'%Y') AS YEAR, salary,
ROUND(salary/12,0) AS msalary
FROM emp 
WHERE DATE_FORMAT(hdate,'%Y') > '2000';
AND ROUND(salary/12,0) > 200
ORDER BY msalary 

SELECT empname,
DATE_FORMAT(hdate, '%Y / %M / %D' AS M1,
DATE_FORMAT(hdate, '%Y / %M / %D' AS M2,
FROM emp

SELECT * FROM emp WHERE manager IS NULL
SELECT * FROM emp WHERE manager IS NOT NULL 

-- 정렬 order by
SELECT * FROM emp ORDER BY salary DESC LIMIT 5;
SELECT * FROM emp ORDER BY 2,5;

-- 중복
SELECT DISTINCT(deptno) FROM emp;

-- 범위설정
SELECT * FROM emp ORDER BY salary DESC LIMIT 3,3;

