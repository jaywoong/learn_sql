-- DML(CRUD)
-- SELECT 문
/*
	GROUP
*/

SELECT empno, empname, ROUND(salary/12,2),
	DATE_FORMAT(hdate, '%Y') FROM emp
WHERE empno IN ('1001','1002','1003')
ORDER BY 3 DESC

SELECT deptno, 
	SUM(salary), 
	ROUND(AVG(salary),1)
	COUNT(*)
	STDDEV(salary),
	VAR_SAMP(salary),
	MAX(salary),
	MIN(salary)
FROM emp
GROUP BY deptno
HAVING SUM(salary) >= 10000
ORDER BY SUM(salary) DESC




