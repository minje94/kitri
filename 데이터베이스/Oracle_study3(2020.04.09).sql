-----------------------------
--복습1) 학생들의 키가 측정되지 않을 경우, '재검'이라고 출력하고, 키가 측정되는 경우, 
--'필요없음'이라고 검사사항을 출력하시오. 출력항목은 학생이름, 키, 검사사항입니다.
SELECT stu_name, stu_height,
       NVL2(stu_height, '필요없음', '재검') AS 검사사항
FROM STUDENT;

SELECT stu_name, stu_height,
CASE WHEN stu_height IS NULL THEN '재검'
           ELSE '필요없음' 
END AS 검사사항
FROm STUDENT;

--복습2) 사원들의 사원이름, 사원직무를 연결하여 검색하시오. (예: King President)
SELECT INITCAP(ename || ' ' || job) AS 사원_직무
FROM EMP;

SELECT CONCAT(CONCAT(INITCAP(ename),' '), INITCAP(job)) AS 사원_직무
FROM EMP;

--복습3) 사장님의 급여를 2배 인상하여 출력하시오.(DECODE 사용)
SELECT ename, DECODE(job, 'PRESIDENT', SAL*2
                           ,SAL) AS sal
FROM EMP
WHERE job = 'PRESIDENT';

SELECT ename, DECODE(mgr, NULL, SAL*2
                           ,SAL) AS sal
FROM EMP
WHERE job ='PRESIDENT';

--[그룹함수]
--STDDEV(표준편차), VARIANCE(분산)
SELECT COUNT(*) FROM STUDENT;
SELECT COUNT(stu_no) FROM STUDENT;
SELECT COUNT(stu_height) FROM STUDENT;

SELECT SUM(sal) FROM EMP;
SELECT AVG(sal) FROM EMP;
SELECT MAX(sal) FROM EMP;
SELECT MIN(sal) FROM EMP;
SELECT STDDEV(sal) FROM EMP;
SELECT VARIANCE(sal) FROM EMP;

--예제1) 매니저들의 평균 연봉을 구하시오.
SELECT AVG(sal) FROM EMP WHERE job ='MANAGER';

--[GROUP BY]
--예제2) 각 직무별 평균 월급을 구하시오. 
SELECT job, ROUND(AVG(sal)) --> GROUP BY 한 항목은 SELECT 할 수 있다. 
FROM EMP
GROUP BY job;

--[HAVING]
--예3) 각 직무별 평균 월급이 3000이상인 직무의 평균 월급을 출력하시오.
SELECT job, ROUND(AVG(sal)) 
FROM EMP 
GROUP BY job 
HAVING AVG(sal) >= 3000;

--예4)
SELECT stu_dept, stu_grade, AVG(stu_height) 
FROM STUDENT 
GROUP BY stu_dept, stu_grade
ORDER BY stu_dept, stu_grade;

--[JOIN]
--ORACLE JOIN WHERE절에 적는 것이 특징이다.
SELECT EMP.ename, DEPT.loc
FROM EMP,DEPT
WHERE EMP.deptno = DEPT.deptno
AND EMP.job = 'PRESIDENT';

--NATURAL JOIN FROM 문제 적는 것이 특징이다.
SELECT ename, loc
FROM EMP NATURAL JOIN DEPT
WHERE job = 'PRESIDENT';

--JOIN ~ USING ~
SELECT ename, loc
FROM EMP JOIN DEPT USING(deptno)
WHERE job = 'PRESIDENT';

--JOIN ~ ON ~ --> deptno를 의미하는 컬럼이 다른 경우에 사용.
SELECT ename, loc
FROM EMP JOIN DEPT ON EMP.deptno = dept.deptno
WHERE job = 'PRESIDENT';

--INNER JOIN ~ ON ~
SELECT ename, loc
FROM EMP INNER JOIN DEPT ON EMP.deptno = dept.deptno
WHERE job = 'PRESIDENT';

--[NON-EQU]
--예5) 사원번호, 사원이름, 급여, 급여등급을 표시하시오.
SELECT empno, ename, sal, grade
FROM EMP,SALGRADE
WHERE EMP.sal BETWEEN SALGRADE.losal AND SALGRADE.hisal;

SELECT empno, ename, sal, grade
FROM EMP,SALGRADE
WHERE EMP.sal >= SALGRADE.losal AND EMP.sal <= SALGRADE.hisal;

--[SELF JOIN]
--예6) 사원이름, MGR번호, 상사의 이름을 출력하시오.
SELECT my.ename, my.mgr, you.ename
FROM EMP my, EMP you
WHERE my.mgr = you.empno;

--[OUTER JOIN]
--FULL OUTER JOIN
SELECT ename, dname, loc
FROM EMP FULL OUTER JOIN DEPT ON EMP.deptno = dept.deptno;

--LEFT OUTER JOIN 왼쪽 테이블은 전부 출력!
SELECT ename, dname, loc
FROM EMP LEFT OUTER JOIN DEPT ON EMP.deptno = dept.deptno;

SELECT ename, dname, loc
FROM EMP,DEPT
WHERE EMP.deptno = dept.deptno(+);  --(+)는 반대방향!!

--RIGHT OUTER JOIN 오른쪽 테이블은 전부 출력!
SELECT ename, dname, loc
FROM EMP RIGHT OUTER JOIN DEPT ON EMP.deptno = dept.deptno;

SELECT ename, dname, loc
FROM EMP,DEPT
WHERE EMP.deptno(+) = dept.deptno; --(+)는 반대방향!!


---------------------------------
--문1) 직무별 평균 급여(sal+comm)을 출력하시오.
SELECT job, ROUND(AVG(sal + NVL(comm,0))) AS 평균급여
FROM EMP
GROUP BY job;

--문2) 각 학과별 학생 수, 평균신장, 신장합, 평균몸무게를 출력하시오.
SELECT stu_dept, COUNT(*), AVG(stu_height) AS 평균신장,
       SUM(stu_height) AS 신장합,
       AVG(stu_weight) AS 평균몸무게
FROM STUDENT
GROUP BY stu_dept;

--문3) 직무별 사원들의 인원수를 출력하시오. 단, 직무인원이 4명이상인 직무만 출력하시오.
SELECT job, COUNT(*)
FROM EMP
GROUP BY job
HAVING count(*) >= 4;

--문4) 월급이 3000이상인 사원들의 월급의 합을 구하시오.
SELECT SUM(sal)
FROM EMP
WHERE sal >=3000;

--문5) 사원수가 5명 이상인 부서의 부서번호, 사원수를 출력하시오.
SELECT deptno, COUNT(*)
FROM EMP
GROUP BY deptno
HAVING count(*) >= 5;

--문6) 기계과 학생들 중 학년별 평균신장이 155이상인 학년과 평균신장을 보이시오.
SELECT stu_grade, AVG(stu_height)
FROM STUDENT
WHERE stu_dept = '기계'
GROUP BY stu_grade
HAVING AVG(stu_height) >= 155;

--문7) 최대 신장이 175이상인 학과와 학과별 최대신장을 보이시오.
SELECT stu_dept, MAX(stu_height)
FROM STUDENT
GROUP BY stu_dept
HAVING MAX(stu_height) >= 175;

--문8) 학과별 평균신장 중 가장 높은 평균 신장을 보이시오.
SELECT MAX(AVG(stu_height))
FROM STUDENT
GROUP BY stu_dept;

--문9) 직무별, 부서별 사원의 급여합이 많은 순으로 검색하시오.
SELECT job, deptno, SUM(sal)
FROM EMP
GROUP BY job, deptno
ORDER BY SUM(sal) DESC;

SELECT job, deptno, SUM(sal)
FROM EMP
GROUP BY job, deptno
ORDER BY 3 DESC;

--문10) 부서별, 직무별 사원들의 급여(sal + comm) 편차가 적은 순으로 검색하시오.
SELECT job,deptno, STDDEV(sal + NVL(comm,0)) AS 급여편차 --->편차를 구할때 STDDEV를 사용한다.
FROM EMP
GROUP BY job, deptno
HAVING COUNT(*) NOT IN (0,1)
ORDER BY 3 DESC;

--문11) 부서번호가 20인 사원들 중에서 직무별 평균 월급, 직무를 보이시오.
--단, 평균 월급이 1000원 이하인 경우는 제외하시오.
SELECT job, AVG(sal + NVL(comm, 0))
FROM EMP
WHERE deptno = 20
GROUP BY job
HAVING AVG(sal + NVL(comm, 0)) > 1000;

--문12) 학생들이 듣고있는 과목번호, 점수를 확인하시오. 학번, 이름, 과목번호, 점수를 출력하시오.
SELECT s.stu_no, s.stu_name, e.sub_no, e.enr_grade 
FROM STUDENT s, ENROL e
WHERE s.stu_no = e.stu_no;

--natural join은 상세히 적지 않아도 된다.
SELECT stu_no, stu_name, sub_no, enr_grade
FROM STUDENT NATURAL JOIN ENROL;

SELECT stu_no, stu_name, sub_no, enr_grade
FROM STUDENT JOIN ENROL USING (stu_no);

SELECT STUDENT.stu_no, stu_name, sub_no, enr_grade
FROM STUDENT JOIN ENROL ON STUDENT.stu_no = ENROL.stu_no;

SELECT STUDENT.stu_no, stu_name, sub_no, enr_grade
FROM STUDENT INNER JOIN ENROL ON STUDENT.stu_no = ENROL.stu_no ;

--문13) 사원이름, MGR번호, 상사이름, 상사월급, 상사월급 등급을 출력하시오.
SELECT DISTINCT my.ename, my.mgr, you.ename, you.sal, sg.grade
FROM EMP my, EMP you, SALGRADE sg
WHERE my.mgr = you.empno
AND you.sal >= sg.losal 
AND you.sal <= sg.hisal;

SELECT DISTINCT my.ename, my.mgr, you.ename, you.sal, sg.grade
FROM EMP you JOIN EMP my ON my.mgr = you.empno
             JOIN SALGRADE sg ON you.sal >= sg.losal AND you.sal <= sg.hisal;

--문14) 사원번호, 사원이름, 상사번호, 상사이름을 모두 출력하는 쿼리를 작성하시오. 
--단, 사장님도 포함하여 출력할 것.
SELECT my.empno, my.ename, you.empno, you.ename
FROM EMP my LEFT OUTER JOIN EMP you 
ON my.mgr = you.empno;

SELECT my.empno, my.ename, you.empno, you.ename
FROM EMP my, EMP you
WHERE my.mgr = you.empno(+);  --> 오라클에서 사용하는 LEFT OUTER JOIN 방식

--문15) 사원번호, 사원이름, 직책, 관리자이름, 근무위치를 출력하시오.
--단, 관련된 모든 정보를 빠짐없이 출력할 것.
SELECT e1.empno, e1.ename, e1.job, e2.ename, DEPT.loc
FROM EMP e1 FULL OUTER JOIN EMP e2 ON e1.mgr = e2.empno 
                       JOIN DEPT ON e1.deptno = DEPT.deptno;

--문16) 사원 JAMES의 사원번호, 이름, 급여, 급여등급, 부서명과 그의 상사이름, 상사부서를 출력하시오.
SELECT DISTINCT e1.empno, e1.ename, e1.sal, s.grade, d1.dname, e2.ename, d2.dname
FROM EMP e1, EMP e2, SALGRADE s, DEPT d1, DEPT d2
WHERE e1.sal BETWEEN s.losal AND s.hisal 
AND e1.deptno = d1.deptno
AND e1.mgr = e2.empno
AND d2.deptno = e2.deptno
AND e1.ename = 'JAMES';

SELECT DISTINCT e1.empno, e1.ename, e1.sal, s.grade, d1.dname, e2.ename, d2.dname
FROM EMP e1 JOIN EMP e2 ON e1.mgr = e2.empno
            JOIN DEPT d1 ON e1.deptno = d1.deptno
            JOIN DEPT d2 ON e2.deptno = d2.deptno,
            SALGRADE s
WHERE e1.sal BETWEEN s.losal AND s.hisal 
AND e1.ename = 'JAMES';

--문17) 각 부서의 이름과 가장 많은 월급의 크기를 출력하시오. (JOIN ~ ON ~ )
SELECT dname, MAX(SAL)
FROM DEPT JOIN EMP ON DEPT.deptno = EMP.deptno
GROUP BY DEPT.dname;

--문18) NEW YORK이나 DALLAS 지역에 근무하는 사원들의 사원번호, 이름을 사원번호 순으로 검색하시오.
SELECT empno, ename
FROM EMP JOIN DEPT ON EMP.deptno = DEPT.deptno
WHERE loc = 'NEW YORK' OR loc = 'DALLAS'
ORDER BY 1;

SELECT EMP.empno, EMP.ename
FROM EMP, DEPT
WHERE EMP.deptno = DEPT.deptno
AND (DEPT.loc = 'NEW YORK' OR DEPT.loc = 'DALLAS') --> 괄호를 쳐서 정리한다.
ORDER BY 1;

SELECT empno, ename
FROM EMP JOIN DEPT ON EMP.deptno = DEPT.deptno
WHERE loc IN ('NEW YORK', 'DALLAS') ---> 셋중에 이방법을 추천!!
ORDER BY 1;

--문19) 부서이름이 ACCOUNTING이거나, 지역이름이 CHICAGO인 사원의 사원번호와 사원이름을 검색하시오.
SELECT EMP.empno, EMP.ename, DEPT.dname, DEPT.loc
FROM EMP JOIN DEPT ON EMP.deptno = DEPT.deptno
WHERE dname = 'ACCOUNTING' 
OR loc = 'CHICAGO';

